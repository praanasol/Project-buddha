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

namespace budhashop.ADMIN
{
    public partial class LoginA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            string aname = txt_username.Text;
            string pwd = txt_password.Text;

            IAdmin checklogin = new AdminItems();
            int count = checklogin.checkLogin(aname, pwd);

            if (count != -1)
            {
                string roles = ConfigurationSettings.AppSettings["AdminPages"];

                CLASS.Authenticate authenticateMe = new budhashop.CLASS.Authenticate();
                authenticateMe.AuthenticateUser(aname, roles);

                // Get the requested page from the url
                string returnUrl = Request.QueryString["ReturnUrl"];

                // check if it exists, if not then redirect to default page
                if (returnUrl == null) returnUrl = "~/ADMIN/";

                Response.Redirect(returnUrl);
            }
            else
            {
                lbl_submit.Text = "Invalid Login Credentials";
            }
        }
    }
}
