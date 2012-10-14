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
using BusinessLogicBS;
using BusinessLogicBS.UserClasses;

namespace budhashop.UserControls
{
    public partial class login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["currentuser"] != null)
            {
                logintext.Text = this.Session["currentuser"].ToString();
            }
            else
            {
                logintext.Text = "LogIn";
            }
        }

        protected void lb_logout_Click(object sender, EventArgs e)
        {
            this.Session["currentuser"] = null;
            lbl_result1.Text = "";
            logintext.Text = "LogIn";
            Response.Redirect(Request.RawUrl);
        }

        protected void lb_profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER/ProfilePage.aspx");
        }

        protected void lb_orderhistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER/ProfilePage.aspx");
        }

    }
}