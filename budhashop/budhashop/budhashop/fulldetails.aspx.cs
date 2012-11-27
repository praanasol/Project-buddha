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
using System.Web.Services;
using BusinessEntitiesBS;
using System.Collections.Generic;

namespace budhashop
{
    public partial class fulldetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod(EnableSession = true)]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static int SetSessionValue(int ID, int Type)
        {
            string Name = "CartPicks";
            //string sessionVal = String.Empty;
            List<CartItems> cartItems = new List<CartItems>();


            if (HttpContext.Current.Session[Name] != null)
            {
                try
                {
                    cartItems = (List<CartItems>)HttpContext.Current.Session[Name];
                    CartItems newItem = new CartItems();
                    bool hasItem = cartItems.Any(c => c.ItemId == ID);
                    if (!hasItem)
                    {
                        newItem.ItemId = ID;

                        if (Type == 0)
                        {
                            newItem.CatId = 1;
                            newItem.GrpChk = true;
                        }
                        else
                        {
                            //if (Type == 3)
                            //{
                            //    newItem.CatId = 3;
                            //}
                            //else
                            //{
                            //    newItem.CatId = 5;
                            //}
                            newItem.CatId = Type;
                            newItem.GrpChk = false;
                            
                        }
                        newItem.Qty = 1;
                        cartItems.Add(newItem);


                        HttpContext.Current.Session[Name] = cartItems;

                        return 1;
                    }
                    else
                    {
                        var cartItems2 = (List<CartItems>)HttpContext.Current.Session["CartPicks"];

                        if (cartItems2 != null)
                        {
                            var cartItem = cartItems2.First(p => p.ItemId == ID);
                            int qty = cartItem.Qty + 1;
                            cartItem.Qty = qty;


                            HttpContext.Current.Session["CartPicks"] = cartItems;
                        }

                        return 2;
                    }
                }
                catch
                {
                    return 0;
                    throw;
                }
            }
            else
            {

                return 0;
            }

        }
    }
}
