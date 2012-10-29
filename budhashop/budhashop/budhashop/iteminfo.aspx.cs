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
using BusinessEntitiesBS;
using System.Collections.Generic;

namespace budhashop
{
    public partial class iteminfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static bool SetSessionValue(int ID, int Type)
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

                        if (Type == 1)
                        {
                            newItem.CatId = 3;
                            newItem.GrpChk = true;
                        }
                        else
                        {
                            if (Type == 3)
                            {
                                newItem.CatId = 3;
                            }
                            else
                            {
                                newItem.CatId = 5;
                            }
                            newItem.GrpChk = false;
                        }
                        newItem.Qty = 1;
                        cartItems.Add(newItem);


                        HttpContext.Current.Session[Name] = cartItems;

                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch
                {
                    return false;
                    throw;
                }
            }
            else
            {

                return false;
            }

        }
    }
}
