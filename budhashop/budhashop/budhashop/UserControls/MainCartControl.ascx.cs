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
using InterfacesBS.InterfacesBL;
using BusinessLogicBS.BusinessClasses;
using System.Collections.Generic;
using BusinessEntitiesBS;

namespace budhashop.UserControls
{
    public partial class MainCartControl : System.Web.UI.UserControl
    {
        private List<CartItems> CartDetails;
        
        protected void Page_Load(object sender, EventArgs e)
        {
         if (!IsPostBack)
         {
             if (Session["itemCheck"] != null)
             {
                 hiddenCheck5.Value = Session["itemCheck"].ToString();
                 hiddenCheck6.Value = Session["totCheck"].ToString();

             }

            if (Session["CartPicks"] != null)
            {
                CartDetails = new List<CartItems>();
                CartDetails = (List<CartItems>)Session["CartPicks"];
                LoadItems(CartDetails);
            }
          }
           
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
                bool grpId = item.GrpChk;
                var cartItems = (List<CartItems>)Session["CartPicks"];
                var cartItem = cartItems.First(p => p.ItemId == cid);
                // finding the data item
                if (grpId)
                {
                    
                    var itemDetails = dtg.AsEnumerable().First(p => p.Field<long>("GroupId") == cid);
                    if (itemDetails != null)
                    {
                        DataRow dr = CartDT.NewRow();
                        dr[0] = itemDetails["GroupId"];
                        dr[1] = itemDetails["ImagePath"]; //change this to actual image path when done
                        dr[2] = itemDetails["GroupName"];
                        dr[3] = qty;
                        float blrte = float.Parse(itemDetails["BilledRate"].ToString());
                        dr[4] = blrte;
                        cartItem.TotalBill = blrte;
                        //float ntrte = float.Parse(itemDetails["NetRate"].ToString());
                        //cartItem.totalNet = ntrte;
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
                        float blrte = float.Parse(itemDetails["BilledRate"].ToString());
                        dr[4] = blrte;
                        cartItem.TotalBill = blrte;
                        //float ntrte = float.Parse(itemDetails["NetRate"].ToString());
                        //cartItem.totalNet = ntrte;
                        float totRate = qty * (float.Parse(itemDetails["BilledRate"].ToString()));
                        dr[5] = totRate;
                        totalPrice += totRate;
                        CartDT.Rows.Add(dr);
                    }
                }
                Session["CartPicks"] = cartItems;
                // updating the data row from the itemDetails object.
                
            }
            if (CartDT != null)
            {
                DataView dv = new DataView();
                PagedDataSource pagedData = new PagedDataSource();
                int rowCnt = CartDT.Rows.Count;
                noOfItemsLbl.Text = rowCnt.ToString();
                totitems.Text = rowCnt.ToString();
                if (rowCnt > 0)
                {
                    orderBtn1.Enabled = true;
                    errorMsg.Text = "";
                }
                else
                {
                    orderBtn1.Enabled = false;
                    errorMsg.Text = "No products added";
                }
                totalLbl.Text = totalPrice.ToString();
                Session["itemCheck"] = totitems.Text; // old values will be store in below sessions.
                Session["totCheck"] = totalLbl.Text;
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
                orderBtn1.Enabled = false;
            }
        }
  
        /// <summary>
        /// 
        /// </summary>
        /// <param name="source"></param>
        /// <param name="e"></param>
        protected void itemCartDL_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (Session["itemCheck"] != null)
            {

                hiddenCheck5.Value = Session["itemCheck"].ToString();
                hiddenCheck6.Value = Session["totCheck"].ToString();

            }
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
                        var cartItem = cartItems.First(p => p.ItemId == long.Parse(itemId));

                        cartItem.Qty = int.Parse(qty);
                        float updatedTot = int.Parse(qty) * (float.Parse(((Label)e.Item.FindControl("priceLbl")).Text));
                        float Total = float.Parse(totalLbl.Text) + updatedTot - (float.Parse(((Label)e.Item.FindControl("rateLbl")).Text));
                        ((Label)e.Item.FindControl("rateLbl")).Text = updatedTot.ToString();
                        cartItem.TotalBill = updatedTot;
                        totalLbl.Text = Total.ToString();
                        Session["CartPicks"] = cartItems;
                        Session["totCheck"] = totalLbl.Text;
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
                      cartItems.RemoveAll(p => p.ItemId == long.Parse(itemId));
                        
                        //update session
                        Session["CartPicks"] = cartItems;

                        //load updated cart items
                        LoadItems(cartItems);
                    }


            }
        }

        protected void orderBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER/OrderPage.aspx");
        }
    }
}