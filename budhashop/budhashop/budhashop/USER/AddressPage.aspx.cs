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
using BusinessEntitiesBS;
using System.Collections.Generic;
using BusinessLogicBS.BusinessClasses;

namespace budhashop.USER
{
    public partial class AddressPage : System.Web.UI.Page
    {
        public List<CartItems> CartDetails;
        public DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["currentuser"] != null)
                {
                    DataTable dtt = (DataTable)this.Session["currentuser"];
                    string emailid = dtt.Rows[0]["Email"].ToString();
                    retrieveUser(emailid);
                }

                if (Session["CartPicks"] != null)
                {
                    CartDetails = new List<CartItems>();

                    CartDetails = (List<CartItems>)Session["CartPicks"];

                    LoadItems(CartDetails);
                }

                
            }
            
        }

        protected void retrieveUser(string emailid)
        {
            try
            {
                IUser retrieveuser = new UserItems();

                //returns the table if given emailid exists
                dt = retrieveuser.checkavailability(emailid);
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

        protected void ConfirmBtn_Click(object sender, EventArgs e)
        {
            
            //code for adding cart data in db and show back result to user
            string emailid = txt_emailid.Text.ToString();
            string shippingAdr = txt_uname.Text.ToString()+";"+txt_phno.Text.ToString()+";"+txt_address.Text.ToString()+";";
            string purchaseDate = "";

            CartDetails = new List<CartItems>();

            CartDetails = (List<CartItems>)Session["CartPicks"];

            
            String cartItems = "";

            foreach (object cartObj in CartDetails)
            {
                CartItems item = cartObj as CartItems;
                int cid = item.ItemId;
                int qty = item.Qty;

                cartItems += cid + "," + qty + ";";
             
            }

            string TotalBill = totalHidden.Value;
            //Parent.FindControl("totalLbl").
            
            float TotalNet = 0;
            
            adressDiv.Visible = false;
            cartDataGV.Visible = true;
            Session["CartPicks"] = null;

        }

        private void LoadItems(List<CartItems> Cartinfo)
        {

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

            DataSet ds = new DataSet();
            DataTable dtv = new DataTable();
            DataTable dtg = new DataTable();
            InterfacesBS.InterfacesBL.InterfaceItems callCache = new ItemsClass();
            ds = callCache.getAllItems();
            dtv = ds.Tables[0];
            dtg = ds.Tables[1];
            //create cache for group items and store here and loop throuh groups if groupChk is true in session list
            float totalPrice = 0;
            foreach (object cartObj in Cartinfo)
            {
                CartItems item = cartObj as CartItems;
                int cid = item.ItemId;
                int qty = item.Qty;
                bool grpId = item.GrpChk;

                // finding the data item
                if (grpId)
                {
                    var itemDetails = dtg.AsEnumerable().First(p => p.Field<long>("GroupId") == cid);
                    
                    if (itemDetails != null)
                    {
                        DataRow dr = CartDT.NewRow();
                        dr[0] = itemDetails["GroupId"];
                        dr[1] = "/ItemImages/3/4/4small.jpg";//change this to actual image path when done
                        dr[2] = itemDetails["GroupName"];
                        dr[3] = qty;
                        dr[4] = float.Parse(itemDetails["BilledRate"].ToString());
                        float totRate = qty * (float.Parse(itemDetails["BilledRate"].ToString()));
                        dr[5] = totRate;
                        totalPrice += totRate;
                        CartDT.Rows.Add(dr);
                    }
                }
                else
                {

                    var itemDetails = dtv.AsEnumerable().First(p => p.Field<long>("ItemId") == cid);
                    if (itemDetails != null)
                    {
                        DataRow dr = CartDT.NewRow();
                        dr[0] = itemDetails["ItemId"];
                        dr[1] = itemDetails["ImagePath"];
                        dr[2] = itemDetails["ItemName"];
                        dr[3] = qty;
                        dr[4] = float.Parse(itemDetails["BilledRate"].ToString());
                        float totRate = qty * (float.Parse(itemDetails["BilledRate"].ToString()));
                        dr[5] = totRate;
                        totalPrice += totRate;
                        CartDT.Rows.Add(dr);
                    }
                }
                // updating the data row from the itemDetails object.

            }
            if (CartDT != null)
            {
                DataView dv = new DataView();
                PagedDataSource pagedData = new PagedDataSource();
                int rowCnt = CartDT.Rows.Count;
                //noOfItemsLbl.Text = rowCnt.ToString();
                //totalLbl.Text = totalPrice.ToString();
                dv = CartDT.DefaultView;
                pagedData.DataSource = dv;
                //pagedData.AllowPaging = true;
                //pagedData.PageSize = 4;
                pagedData.CurrentPageIndex = 0;

                cartDataGV.DataSource = pagedData;
                cartDataGV.DataBind();
            }
            else
            {
                cartDataGV.DataSource = "";
                cartDataGV.DataBind();
            }
        }
    }
}
