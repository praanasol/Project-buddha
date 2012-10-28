using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Data.SqlClient;
using InterfacesBS.InterfacesBL;
using BusinessLogicBS;
using BusinessLogicBS.UserClasses;

namespace budhashop.USER
{
    public partial class ProfilePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["currentuser"] != null)
            {
                //ProfileDiv Start
                    DataTable dt = (DataTable)this.Session["currentuser"];
                    string emailid = dt.Rows[0]["Email"].ToString();
                    retrieveUser(emailid);
                //ProfileDiv End

                //OrderHistoryDiv Start
                    getOrders();

                    DataSet allDataDS = new DataSet();

                    InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();


                    if (System.Web.HttpContext.Current.Cache["CacheItemsObj"] == null)
                    {
                        allDataDS = allData.getAllItems();
                        System.Web.HttpContext.Current.Cache.Insert("CacheItemsObj", allDataDS, null, System.DateTime.Now.AddDays(1), System.Web.Caching.Cache.NoSlidingExpiration);
                    }
                //OrderHistoryDiv End
            }
            else
            {
                Response.Redirect("~/homepage.aspx");
            }
        }

        protected void retrieveUser(string emailid)
        {
            try
            {
                IUser retrieveuser = new UserItems();

                //returns the table if given emailid exists
                DataTable dt = retrieveuser.checkavailability(emailid);
                if (dt != null)
                {
                    txt_emailid.Text = dt.Rows[0]["Email"].ToString();
                    txt_uname.Text = dt.Rows[0]["UserName"].ToString();
                    txt_phno.Text = dt.Rows[0]["Phone"].ToString();
                    txt_address.Text = dt.Rows[0]["Address"].ToString();
                }
            }
            catch (Exception ex)
            {
                lbl_status.Text = "Error Occured : " + ex.Message;
            }
        }

        protected void getOrders()
        {
            DataTable dt = (DataTable)this.Session["currentuser"];
            string userid = dt.Rows[0]["Uid"].ToString();
            try
            {
                BusinessLogicBS.UserClasses.UserItems getOrders = new BusinessLogicBS.UserClasses.UserItems();
                DataTable orderDT = getOrders.getUserOrders(userid);

                if (orderDT != null)
                {
                    orderGrid.DataSource = orderDT;
                    orderGrid.DataBind();
                }
                else
                {
                    //grpMsgLbl.Text = "No Data for items! change the catagory";
                    orderGrid.DataSource = null;
                    orderGrid.DataBind();
                }
            }
            catch (Exception iExp)
            {
                throw iExp;
            }
        }

        protected void orderGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            orderGrid.PageIndex = e.NewPageIndex;
            getOrders();
        }

        protected void orderGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {


            if (e.CommandName.Equals("show"))
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());

                string PurchaseId = orderGrid.DataKeys[index].Value.ToString();
                string UserId = orderGrid.DataKeys[index]["Uid"].ToString();
                string ItemQty = orderGrid.DataKeys[index]["NoItems"].ToString();
                string totalBill = orderGrid.DataKeys[index]["TotalBilledRate"].ToString();
                string purchaseDate = orderGrid.DataKeys[index]["PurchaseDate"].ToString();//ItemString
                bool isDelivered = bool.Parse(orderGrid.DataKeys[index]["DeliveredFlag"].ToString());
                string itemString = orderGrid.DataKeys[index]["ItemString"].ToString();
                string addrString = orderGrid.DataKeys[index]["ShippingAddress"].ToString();

                //string itemString = (HiddenField)row.Cells[index].FindControl("HiddenItemStr")).Value;
                //string addrString = ((HiddenField)e.Row.FindControl("HiddenAddrStr")).Value;


                DataSet itemData = new DataSet();
                itemData = (DataSet)System.Web.HttpContext.Current.Cache["CacheItemsObj"];
                DataTable dt = itemData.Tables[0];
                DataTable dtg = itemData.Tables[1];

                //List<string[]> arrays = new List<string[]>();
                var primeArray = addrString.Split(';');

                string name = primeArray[0];
                string phone = primeArray[1];
                string address = primeArray[2];

                NameA.Text = name;
                PhnA.Text = phone;
                AdrA.Text = address;
                //itemsDiv.Visible = true;

                DataTable CartDT = new DataTable();//data to be bound to cart datalist
                DataColumn dcId = new DataColumn("ItemId", typeof(long));
                CartDT.Columns.Add(dcId);
                DataColumn dcPath = new DataColumn("ImagePath", typeof(string));
                CartDT.Columns.Add(dcPath);
                DataColumn dcNme = new DataColumn("ItemName", typeof(string));
                CartDT.Columns.Add(dcNme);
                DataColumn dcQy = new DataColumn("Qty", typeof(int));
                CartDT.Columns.Add(dcQy);
                DataColumn dcBr = new DataColumn("BilledRate", typeof(float));
                CartDT.Columns.Add(dcBr);
                DataColumn dcTr = new DataColumn("TotalRate", typeof(float));
                CartDT.Columns.Add(dcTr);

                //itemString.Remove(itemString.Length);
                var itemsArray = itemString.Split(';');
                for (var i = 0; i < itemsArray.Length - 1; i++)
                {
                    var items = itemsArray[i].Split(',');
                    int itemId = int.Parse(items[0].ToString());
                    int qty = int.Parse(items[1].ToString());

                    var itemDetails = dt.AsEnumerable().First(p => p.Field<long>("ItemId") == itemId);
                    if (itemDetails == null)
                    {
                        itemDetails = dtg.AsEnumerable().First(p => p.Field<long>("ItemId") == itemId);
                    }

                    if (itemDetails != null)
                    {
                        DataRow dr = CartDT.NewRow();
                        dr[0] = itemDetails["ItemId"];
                        dr[1] = itemDetails["ImagePath"];
                        dr[2] = itemDetails["ItemName"];
                        dr[3] = qty;
                        float blrte = float.Parse(itemDetails["BilledRate"].ToString());
                        dr[4] = blrte;
                        //cartItem.TotalBill = blrte;
                        //float ntrte = float.Parse(itemDetails["NetRate"].ToString());
                        //cartItem.totalNet = ntrte;
                        float totRate = qty * (float.Parse(itemDetails["BilledRate"].ToString()));
                        dr[5] = totRate;

                        CartDT.Rows.Add(dr);
                    }

                }
                SelectedOrderGrid.DataSource = CartDT;
                SelectedOrderGrid.DataBind();

                //itemsDiv.Visible = true;
                ClientScriptManager cs = Page.ClientScript;
                cs.RegisterStartupScript(typeof(Page), "PrintScript_" + UniqueID, "showitemsDiv();", true);
            }
        }

        public class ItemDetails
        {
            public string ItemId { get; set; }
            public string ItemPath { get; set; }
            public string ItemName { get; set; }
            public string ItemPrice { get; set; }

            public string ItemQty { get; set; }
            public string CatId { get; set; }
        }

        protected void orderGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onmouseover", "this.style.cursor='pointer';this.style.backgroundColor='lightgreen'");
                e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='transparent';";
                e.Row.ToolTip = "Click To View Ordered Items";
                //e.Row.Attributes.Add("onclick", String.Format("javascript:__doPostBack('orderGrid','Select${0}')", e.Row.RowIndex));
                //e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.orderGrid, "Select$" + e.Row.RowIndex);
                LinkButton lb_Select = (LinkButton)e.Row.FindControl("lb_Show");
                e.Row.Attributes["OnClick"] = Page.ClientScript.GetPostBackClientHyperlink(lb_Select, "");
            }
        }
    }
}
