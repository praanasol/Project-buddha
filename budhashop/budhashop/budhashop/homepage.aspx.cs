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
using BusinessEntitiesBS;

namespace budhashop
{
    public partial class homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // When retrieving an object from session state, cast it to 
            // the appropriate type.
           
           // List<CartItems> cartItems = List < CartItems > Session["CartPicks"];
            List<CartItems> cartItems = new List<CartItems>();
            // Write the modified stock picks list back to session state.
            Session["CartPicks"] = cartItems;
           
        }
        [WebMethod]
        public static bool AddToCart()
        {
            return true;
            //
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
        public class UserDetails
        {
            public string UserId { get; set; }
            public string UserName { get; set; }
            public string Location { get; set; }
        }

       
    }
}
