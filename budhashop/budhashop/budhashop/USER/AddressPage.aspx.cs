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
using BusinessEntitiesBS.UserEntities;

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

                    LoadItemsFinal(CartDetails);
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
            DataTable dtt = (DataTable)this.Session["currentuser"];
            string userid = dtt.Rows[0]["Uid"].ToString();

            bool isupdated=true;

            if (cb_profilechange.Checked)
            {
                string newuname = txt_uname.Text.ToString();
                string newphno = txt_phno.Text.ToString();
                string newaddress = txt_address.Text.ToString();
                try
                {
                    IUser updateuser = new UserItems();
                    bool nameupdated = updateuser.UpdateProfile(userid, newuname, "name");
                    if (nameupdated)
                    {
                        bool phnoupdated = updateuser.UpdateProfile(userid, newphno, "phno");
                        if (phnoupdated)
                        {
                            bool addressupdated = updateuser.UpdateProfile(userid, newaddress, "address");
                            if (!addressupdated)
                            {
                                isupdated = false;
                            }
                        }
                        else
                        {
                            isupdated = false;
                        }
                    }
                    else
                    {
                        isupdated = false;
                    }
                }
                catch
                {
                    isupdated = false;
                }
            }

            if (isupdated)
            {

                //string emailid = txt_emailid.Text.ToString();
                string shippingAdr = txt_uname.Text.ToString() + ";" + txt_phno.Text.ToString() + ";" + txt_address.Text.ToString() + ";";
                string purchaseDate = System.DateTime.Now.ToString();

                CartDetails = new List<CartItems>();

                CartDetails = (List<CartItems>)Session["CartPicks"];

                String cartItems = "";
                float Total = 0;
                int count = 0;

                foreach (object cartObj in CartDetails)
                {

                    CartItems item = cartObj as CartItems;
                    count += 1;
                    int cid = item.ItemId;
                    int qty = item.Qty;
                    float tot = item.TotalBill;
                    Total += tot;
                    cartItems += cid + "," + qty + ";";

                }

                float TotalBill = Total;
                int ItemsCount = count;
                OrderItems insertOrder = new OrderItems();
                insertOrder.userid = int.Parse(userid);
                insertOrder.purchaseDate = purchaseDate;
                insertOrder.ShippingAdr = shippingAdr;
                insertOrder.cartItems = cartItems;
                insertOrder.totalBill = TotalBill;
                insertOrder.totalItems = ItemsCount;

                UserItems ordr = new UserItems();
                int purchaseId = ordr.insertOrders(insertOrder);
                if (purchaseId != -1)
                {
                    adressDiv.Visible = false;
                    cartDataGV.Visible = true;
                    Session["CartPicks"] = null;
                }
                else
                {
                    //show error
                }
            }
            else
            {
                lbl_status.Text = "Error Occured, Try Again";
            }

        }

        private void LoadItemsFinal(List<CartItems> Cartinfo)
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
                        dr[1] = itemDetails["ImagePath"];//change this to actual image path when done
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
