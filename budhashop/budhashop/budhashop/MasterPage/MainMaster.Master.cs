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
using System.Collections.Generic;
using BusinessEntitiesBS;

namespace budhashop.MasterPage
{
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CartPicks"] == null)
                {
                    createSession();
                }
                
            }
        }

        private void createSession()
        {
            //List<CartItems> cartItems = List < CartItems > Session["CartPicks"];
            List<CartItems> cartItems = new List<CartItems>();
            //cartItems = List<CartItems> Session["CartPicks"];
            // Write the modified stock picks list back to session state.
            Session["CartPicks"] = cartItems;
        }
    }
}
