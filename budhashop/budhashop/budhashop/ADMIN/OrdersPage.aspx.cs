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
using System.Collections.Generic;

namespace budhashop.ADMIN
{
    public partial class OrdersPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                getOrders();
            else
                itemsDiv.Visible = false;
        }

        private void getOrders()
        {
            try
            {
                BusinessLogicBS.UserClasses.UserItems getOrders = new BusinessLogicBS.UserClasses.UserItems();
                DataTable orderDT = getOrders.getOrders();

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

            if (txt_search.Text == "" && txt_datepick.Text == "")
            {
                getOrders();
            }
            else
            {
                SearchOrders(txt_search.Text, txt_datepick.Text);
            }
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
                bool   isDelivered = bool.Parse(orderGrid.DataKeys[index]["DeliveredFlag"].ToString());
                string itemString = orderGrid.DataKeys[index]["ItemString"].ToString();
                string addrString = orderGrid.DataKeys[index]["ShippingAddress"].ToString();
                string TypeString = orderGrid.DataKeys[index]["TypeItem"].ToString();
                
                //string itemString = (HiddenField)row.Cells[index].FindControl("HiddenItemStr")).Value;
                //string addrString = ((HiddenField)e.Row.FindControl("HiddenAddrStr")).Value;

                budhashop.CLASS.CallCache callCache = new budhashop.CLASS.CallCache();
            
                DataSet itemData = new DataSet();
                itemData = callCache.getCache();
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
                    itemsDiv.Visible = true;

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
                    DataColumn dcSz = new DataColumn("Size", typeof(string));
                    CartDT.Columns.Add(dcSz);

                    //itemString.Remove(itemString.Length);
                    var itemsArray = itemString.Split(';');
                    var sizeArray = TypeString.Split(';');
                    for (var i = 0; i < itemsArray.Length-1; i++)
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
                            dr[6] = sizeArray[i];
                            CartDT.Rows.Add(dr);
                        }

                    }
                    SelectedOrderGrid.DataSource = CartDT;
                    SelectedOrderGrid.DataBind();

                    itemsDiv.Visible = true;
            }
        }

        protected void closeDetails_Click(object sender, EventArgs e)
        {
            itemsDiv.Visible = false;
        }

        //public class ItemDetails
        //{
        //    public string ItemId { get; set; }
        //    public string ItemPath { get; set; }
        //    public string ItemName { get; set; }
        //    public string ItemPrice { get; set; }
            
        //    public string ItemQty { get; set; }
        //    public string CatId { get; set; }
        //}

        protected void btn_search_Click(object sender, EventArgs e)
        {
            string str = txt_datepick.Text;
            if (txt_search.Text == "" && txt_datepick.Text=="")
            {
                lbl_search.Text = HardCodedValues.BuddaResource.EnterValue;
                getOrders();
            }
            else
            {
                lbl_search.Text = "";
                SearchOrders(txt_search.Text, txt_datepick.Text);
            }
        }

        private void SearchOrders(string value1,string value2)
        {
            try
            {
                BusinessLogicBS.BusinessClasses.AdminItems getorders = new BusinessLogicBS.BusinessClasses.AdminItems();
                DataTable ordersDT = getorders.SearchOrders(value1,value2);
                if (ordersDT != null)
                {
                    orderGrid.DataSource = ordersDT;
                    orderGrid.DataBind();
                }
                else
                {
                    lbl_search.Text = HardCodedValues.BuddaResource.NoOrderError;
                    orderGrid.DataSource = null;
                    orderGrid.DataBind();
                }
            }
            catch (Exception iExp)
            {
                lbl_search.Text = HardCodedValues.BuddaResource.InvalidDate;
            }
        }

        protected void lb_logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("../ADMIN/LoginA.aspx");
        }
    }
}
