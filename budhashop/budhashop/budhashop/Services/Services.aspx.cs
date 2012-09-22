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
using System.Collections.Generic;
using BusinessEntitiesBS;
using System.Web.Script.Services;

namespace budhashop.Services
{
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        [WebMethod]
        public static ItemDetails[] BindGrptable()
        {
            DataTable dt = new DataTable();
            List<ItemDetails> details = new List<ItemDetails>();
            InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();
            DataSet allDataDS = allData.getAllItems();
            dt = allDataDS.Tables[1];

            foreach (DataRow dtrow in dt.Rows)
            {
               
                    ItemDetails user = new ItemDetails();
                    user.ItemId = dtrow["GroupId"].ToString();
                    user.ItemName = dtrow["GroupName"].ToString();
                    user.ItemPrice = dtrow["BilledRate"].ToString();
                    details.Add(user);
                
            }

            return details.ToArray();
        }

        [WebMethod]
        public static ItemDetails[] BindDatatable(string CatgId)
        {
            DataTable dt = new DataTable();
            List<ItemDetails> details = new List<ItemDetails>();
            InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();
            DataSet allDataDS = allData.getAllItems();
            dt = allDataDS.Tables[0];

            foreach (DataRow dtrow in dt.Rows)
            {
                bool FeatureChk = bool.Parse(dtrow["FeaturedFlag"].ToString());
                int category = int.Parse(dtrow["CategoryId"].ToString());
                if (FeatureChk && category == int.Parse(CatgId))
                {
                    ItemDetails user = new ItemDetails();
                    user.ItemId = dtrow["ItemId"].ToString();
                    user.ItemName = dtrow["ImagePath"].ToString();
                    user.ItemPrice = dtrow["BilledRate"].ToString();
                    details.Add(user);
                }
            }

            return details.ToArray();
        }

        [WebMethod(EnableSession = true)]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static bool SetSessionValue(string Name, string ID, int Type)
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
                   
                    if (Type == 1)
                    {
                        newItem.CatId = 3;
                        newItem.GrpChk = true;
                    }
                    else
                    {
                        if (Type == 2)
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
        public class ItemDetails
        {
            public string ItemId { get; set; }
            public string ItemName { get; set; }
            public string ItemPrice { get; set; }
        }

       
    }
}
