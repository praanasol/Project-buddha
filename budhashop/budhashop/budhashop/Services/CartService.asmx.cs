using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using BusinessEntitiesBS;
using System.Collections.Generic;
using System.Web.Script.Services;

namespace budhashop.Services
{
    /// <summary>
    /// Summary description for CartService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    //[ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class CartService : System.Web.Services.WebService
    {

        //The important part is “EnableSession = true”
        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string GetSessionValue(String Name)
        {
            List<CartItems> cartItem;
            if (Session[Name] != null)
            {
                cartItem = (List < CartItems >) Session[Name];
            }
            return Name;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool SetSessionValue(string Name, string ID)
        {
            //string sessionVal = String.Empty;
            List<CartItems> cartItems = new List<CartItems>();


            if (HttpContext.Current.Session != null && HttpContext.Current.Session[Name] != null)
            {
                try
                {
                    cartItems = (List<CartItems>)HttpContext.Current.Session[Name];
                    CartItems newItem = new CartItems();
                    newItem.ItemId = int.Parse(ID);
                    newItem.CatId = 3;
                    newItem.GrpChk = false;
                    newItem.Qty = 1;
                    cartItems.Add(newItem);


                    HttpContext.Current.Session[Name] = cartItems;

                    return true;
                }
                catch
                {
                    return false;
                    throw;
                }
            }
            else return false;
        }
    }
}
