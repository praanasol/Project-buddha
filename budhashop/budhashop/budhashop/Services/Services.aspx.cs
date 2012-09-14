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
        
        public static UserDetails[] BindDatatable()
        {
            DataTable dt = new DataTable();
            List<UserDetails> details = new List<UserDetails>();
            InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();
            DataSet allDataDS = allData.getAllItems();
            dt = allDataDS.Tables[0];

            foreach (DataRow dtrow in dt.Rows)
            {
                bool FeatureChk = bool.Parse(dtrow["FeaturedFlag"].ToString());
                if (FeatureChk)
                {
                    UserDetails user = new UserDetails();
                    user.UserId = dtrow["ItemId"].ToString();
                    user.UserName = dtrow["ImagePath"].ToString();
                    user.Location = dtrow["BilledRate"].ToString();
                    details.Add(user);
                }
            }

            return details.ToArray();
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static bool SetSessionValue(string Name, string ID)
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
            else
            {

                return false;
            }
        }
        public class UserDetails
        {
            public string UserId { get; set; }
            public string UserName { get; set; }
            public string Location { get; set; }
        }

       
    }
}
