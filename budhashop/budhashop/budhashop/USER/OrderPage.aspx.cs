using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.Services;
using System.Collections.Generic;

using InterfacesBS.InterfacesBL;
using BusinessLogicBS.BusinessClasses;
using BusinessEntitiesBS;
using BusinessLogicBS.UserClasses;
using BusinessEntitiesBS.UserEntities;
using budhashop.UserControls;

using System.IO;
using System.Text;
using System.Net.Mail;

namespace budhashop.USER
{
    public partial class OrderPage : System.Web.UI.Page
    {
        private List<CartItems> CartDetails;

        private DataTable dt;
        private bool adrFlag = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            txt_emailid.Attributes.Add("onkeypress", "return controlEnter('" + btn_login.ClientID + "', event)");
            txt_pwd.Attributes.Add("onkeypress", "return controlEnter('" + btn_login.ClientID + "', event)");

            txt_emailid2.Attributes.Add("onkeypress", "return controlEnter('" + btn_register.ClientID + "', event)");
            txt_pwd2.Attributes.Add("onkeypress", "return controlEnter('" + btn_register.ClientID + "', event)");
            txt_confirmpwd2.Attributes.Add("onkeypress", "return controlEnter('" + btn_register.ClientID + "', event)");

            if (!IsPostBack)
            {
                if (Session["CartPicks"] != null)
                {
                    CartDetails = new List<CartItems>();
                    CartDetails = (List<CartItems>)Session["CartPicks"];
                    LoadItems(CartDetails);
                }
                else
                {
                    Response.Redirect("../homepage.aspx");
                }
            }
            if (IsPostBack)
            {
                if (adrFlag == true)
                {
                    ClientScript.RegisterHiddenField("isPostBack", "1");
                }

            }

            (Master.FindControl("cart1") as MainCartControl).Visible = false;

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
            DataColumn dcSz = new DataColumn("Size", typeof(string));
            CartDT.Columns.Add(dcSz);

            DataSet ds = new DataSet();
            DataTable dtv = new DataTable();
            DataTable dtg = new DataTable();
            //InterfacesBS.InterfacesBL.InterfaceItems callCache = new ItemsClass();
            budhashop.CLASS.CallCache callCache = new budhashop.CLASS.CallCache();
            ds = callCache.getCache();
            dtv = ds.Tables[0];
            dtg = ds.Tables[1];
            //create cache for group items and store here and loop throuh groups if groupChk is true in session list
            float totalPrice = 0;
            foreach (object cartObj in Cartinfo)
            {
                CartItems item = cartObj as CartItems;
                int cid = item.ItemId;
                int qty = item.Qty;
                string Size = "";
                if (item.TypeCheck != "undefined")
                {
                    Size = "Size : " + item.TypeCheck;
                }
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
                        dr[6] = Size;
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
                        dr[6] = Size;
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
                noOfItemsLbl2.Text = rowCnt.ToString();
                totalLbl2.Text = totalPrice.ToString();
                dv = CartDT.DefaultView;
                pagedData.DataSource = dv;
                //pagedData.AllowPaging = true;
                //pagedData.PageSize = 4;
                pagedData.CurrentPageIndex = 0;

                itemCartDL.DataSource = pagedData;
                itemCartDL.DataBind();
            }
            else
            {
                itemCartDL.DataSource = "";
                itemCartDL.DataBind();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void itemCartDL_ItemCommand(object source, DataListCommandEventArgs e)
        {
            var sizeLbl = ((Label)e.Item.FindControl("sizeLbl")).Text;
            var size = sizeLbl.Length == 0 ? "undefined" : sizeLbl.Substring(7);

            if (e.CommandName == "UpdateItem")
            {
                //getting the primary key from the Datalist of the to be updated item.
                var itemId = itemCartDL.DataKeys[e.Item.ItemIndex].ToString();

                //accessing the quantity from the textbox of the datalist.
                var qty = ((TextBox)e.Item.FindControl("qtyTxt")).Text;

                if (qty != null)
                {
                    // loading the cart items.
                    var cartItems = (List<CartItems>)Session["CartPicks"];

                    if (cartItems != null)
                    {
                        var cartItem = cartItems.First(p => p.ItemId == long.Parse(itemId) && p.TypeCheck == size);

                        cartItem.Qty = int.Parse(qty);
                        float updatedTot = int.Parse(qty) * (float.Parse(((Label)e.Item.FindControl("priceLbl")).Text));
                        float Total = float.Parse(totalLbl2.Text) + updatedTot - (float.Parse(((Label)e.Item.FindControl("rateLbl")).Text));
                        ((Label)e.Item.FindControl("rateLbl")).Text = updatedTot.ToString();

                        totalLbl2.Text = Total.ToString();
                        Session["CartPicks"] = cartItems;
                    }
                }

            }

            if (e.CommandName == "RemoveItem")
            {
                //getting the primary key from the Datalist of the to be updated item.
                var itemId = itemCartDL.DataKeys[e.Item.ItemIndex].ToString();
                // loading the cart items.
                var cartItems = (List<CartItems>)Session["CartPicks"];

                if (cartItems != null)
                {
                    //remove cart item with itemId
                    cartItems.RemoveAll(p => p.ItemId == long.Parse(itemId) && p.TypeCheck == size);

                    //update session
                    Session["CartPicks"] = cartItems;

                    //load updated cart items
                    LoadItems(cartItems);
                }


            }
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/homepage.aspx");
        }



        [WebMethod]
        public static AddressDetails[] showAdress()
        {
            List<AddressDetails> adrdetails = new List<AddressDetails>();
            //budhashop.USER.OrderPage pge = new budhashop.USER.OrderPage();
            if (HttpContext.Current.Session["currentuser"] != null)
            {
                DataTable dtt = (DataTable)HttpContext.Current.Session["currentuser"];
                string emailid = dtt.Rows[0]["Email"].ToString();

                try
                {

                    IUser retrieveuser = new UserItems();

                    //returns the table if given emailid exists
                    DataTable dt2 = retrieveuser.checkavailability(emailid);
                    if (dt2 != null)
                    {
                        AddressDetails adr = new AddressDetails();
                        //pge.txt_emailid.Text
                        adr.EmailId = dt2.Rows[0]["Email"].ToString();

                        //txt_uname.Text 
                        adr.UserName = dt2.Rows[0]["UserName"].ToString();
                        //pge.txt_phno.Text 
                        adr.Phone = dt2.Rows[0]["Phone"].ToString();
                        //pge.txt_address.Text 
                        adr.Address = dt2.Rows[0]["Address"].ToString();

                        adrdetails.Add(adr);
                    }


                }
                catch (Exception ex)
                {
                    //pge.lbl_status.Text = "Error Occured : " + ex.Message;
                    throw ex;
                }
            }

            //ClientScript.RegisterHiddenField("isPostBack", "1");
            return adrdetails.ToArray();


            //pge.CartDiv.Visible = false;
            //pge.adressDiv.Visible = true;
            //return true;

        }

        private void LoadItemsFinal()//List<CartItems> Cartinfo)
        {
            if (HttpContext.Current.Session["CartPicks"] != null)
            {
                List<CartItems> CartDetails2 = new List<CartItems>();

                CartDetails2 = (List<CartItems>)HttpContext.Current.Session["CartPicks"];

                DataTable CartDT = new DataTable();//data to be bound to cart datalist
                DataColumn dcId = new DataColumn("ItemId", typeof(long));
                CartDT.Columns.Add(dcId);
                //DataColumn dcPath = new DataColumn("ImagePath", typeof(string));
                //CartDT.Columns.Add(dcPath);
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

                DataSet ds = new DataSet();
                DataTable dtv = new DataTable();
                DataTable dtg = new DataTable();
                //InterfacesBS.InterfacesBL.InterfaceItems callCache = new ItemsClass();
                budhashop.CLASS.CallCache callCache = new budhashop.CLASS.CallCache();

                ds = callCache.getCache();
                dtv = ds.Tables[0];
                dtg = ds.Tables[1];
                //create cache for group items and store here and loop throuh groups if groupChk is true in session list
                float totalPrice = 0;
                foreach (object cartObj in CartDetails2)
                {
                    CartItems item = cartObj as CartItems;
                    int cid = item.ItemId;
                    int qty = item.Qty;
                    string size = item.TypeCheck;
                    bool grpId = item.GrpChk;

                    // finding the data item
                    if (grpId)
                    {
                        var itemDetails = dtg.AsEnumerable().First(p => p.Field<long>("GroupId") == cid);

                        if (itemDetails != null)
                        {
                            DataRow dr = CartDT.NewRow();
                            dr[0] = itemDetails["GroupId"];
                            //dr[1] = itemDetails["ImagePath"];//change this to actual image path when done
                            dr[1] = itemDetails["GroupName"];
                            dr[2] = qty;
                            dr[3] = float.Parse(itemDetails["BilledRate"].ToString());
                            float totRate = qty * (float.Parse(itemDetails["BilledRate"].ToString()));
                            dr[4] = totRate;
                            if (size != "")
                            {
                                dr[5] = size;
                            }
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
                            //dr[1] = itemDetails["ImagePath"];
                            dr[1] = itemDetails["ItemName"];
                            dr[2] = qty;
                            dr[3] = float.Parse(itemDetails["BilledRate"].ToString());
                            float totRate = qty * (float.Parse(itemDetails["BilledRate"].ToString()));
                            dr[4] = totRate;
                            if (size != "")
                            {
                                dr[5] = size;
                            }
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
            else
            {
                Response.Redirect("../homepage.aspx");
            }


        }

        protected void ConfirmBtn_Click(object sender, EventArgs e)
        {
            if (this.Session["currentuser"] != null)
            {
                //code for adding cart data in db and show back result to user
                DataTable dtt = (DataTable)this.Session["currentuser"];
                string userid = dtt.Rows[0]["Uid"].ToString();

                bool isupdated = true;

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
                    string sizeString = "";
                    float Total = 0;
                    int count = 0;

                    if (CartDetails != null)
                    {
                        foreach (object cartObj in CartDetails)
                        {

                            CartItems item = cartObj as CartItems;
                            count += 1;
                            int cid = item.ItemId;
                            int qty = item.Qty;
                            float tot = item.TotalBill;
                            Total += tot;
                            cartItems += cid + "," + qty + ";";
                            sizeString += item.TypeCheck + ";";
                        }
                    }
                    else
                    {
                        Response.Redirect("../homepage.aspx");
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
                    insertOrder.TypeItem = sizeString;

                    UserItems ordr = new UserItems();
                    int purchaseId = ordr.insertOrders(insertOrder);
                    if (purchaseId != -1)
                    {
                        LoadItemsFinal();
                        //CartDiv.Visible = false;
                        //adressDiv.Visible = false;
                        //cartData.Visible = true;
                        //cartDataGV.Visible = true;
                        Session["CartPicks"] = null;
                        //lbl_status.Text = "Order placed successfully";

                        purchaseIdLbl.Text = purchaseId.ToString();
                        totalpLbl.Text = TotalBill.ToString();
                        itemspNoLbl.Text = ItemsCount.ToString();
                        purchaseDateLbl.Text = purchaseDate;
                        userpNameLbl.Text = txt_uname.Text.ToString();
                        phnpLbl.Text = txt_phno.Text.ToString();
                        addrpLbl.Text = txt_address.Text.ToString();

                        adrFlag = true;
                        ClientScript.RegisterHiddenField("isPostBack", "1");

                        int status = sendEmail();
                        ClientScriptManager cs = Page.ClientScript;
                        if (status == 1)
                        {
                            //emailsentlbl.Text = "Order information has been sent to your email";
                            //emailsentlbl.Visible = true;
                            //Response.Redirect("../USER/ProfilePage.aspx");
                            cs.RegisterStartupScript(typeof(Page), "PrintScript_" + UniqueID, "showOrderMailedDiv();", true);

                        }
                        else
                        {
                            cs.RegisterStartupScript(typeof(Page), "PrintScript_" + UniqueID, "showOrderMailedDivError();", true);
                        }
                    }
                    else
                    {
                        //show error
                        lbl_status.Text = HardCodedValues.BuddaResource.Error;
                    }
                }
                else
                {
                    lbl_status.Text = HardCodedValues.BuddaResource.Error;
                }
            }
            else
            {
                Response.Write(@"<script language='javascript'>alert('Your Session has Expired...');window.location.replace('../homepage.aspx');</script>");
            }

        }

        private int sendEmail()
        {
            //string siteurl = "http://www.autoraksha.com/login/NewPassword.aspx";
            string smsg = "Your order is placed succesfully, find your details below:<br>";
            string smsg1 = "<b>Purchase Id: </b>" + purchaseIdLbl.Text;
            string smsg2 = "<br><b>Total Bill: </b>" + totalpLbl.Text;
            string smsg3 = "<br><b>Number Of Items: </b>" + itemspNoLbl.Text;
            string smsg4 = "<br><b>Purchase Date: </b>" + purchaseDateLbl.Text;
            string smsg5 = "<br><br><b>Name: </b>" + userpNameLbl.Text;
            string smsg6 = "<br><b>Phone Number: </b>" + phnpLbl.Text;
            string smsg7 = "<br><b>Shipping Address: </b>" + addrpLbl.Text + "<br>";
            string smsg8 = DivToHtml(cartDataGV);
            string smsg9 = "<br><br><br><br>";
            string smsg10 = "<b>-govedic.com";

            MailMessage message = new MailMessage();
            try
            {
                dt = (DataTable)HttpContext.Current.Session["currentuser"];
                string emailid = dt.Rows[0]["Email"].ToString();

                message.To.Add(new MailAddress(emailid));
                
                message.From = new MailAddress("support@govedic.com");

                message.Subject = "Your Order is Placed Successfully";
                message.Body = smsg1 + smsg2 + smsg3 + smsg4 + smsg5 + smsg6 + smsg7 + smsg8 + smsg9 + smsg10;
                message.IsBodyHtml = true;

                SmtpClient client = new SmtpClient();
                client.Port = 25; // Gmail works on this port 587
                client.Host = "smtp.net4india.com";
                System.Net.NetworkCredential nc = new System.Net.NetworkCredential("support@govedic.com", "nrmr#ps24");
                client.EnableSsl = false;
                client.UseDefaultCredentials = false;

                client.Credentials = nc;
                client.Send(message);
                return 1;
            }
            catch (Exception ex)
            {
                return 0;
                throw ex;
            }
        }

        private string DivToHtml(GridView data)
        {
            StringBuilder sb = new StringBuilder();
            StringWriter sw = new StringWriter(sb);
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            try
            {
                data.RenderControl(htw);
                return sb.ToString();
            }
            catch (HttpException generatedExceptionName)
            {
                throw generatedExceptionName;
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
            /* Write Nothing Here or place return; */
        }

        public class AddressDetails
        {
            public string EmailId { get; set; }
            public string UserName { get; set; }
            public string Phone { get; set; }
            public string Address { get; set; }

        }
    }
}
