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


namespace budhashop.Merchant
{
    public partial class verifyemail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void verify_Click(object sender, EventArgs e)
        {
            bool isVerified = budhashop.CLASS.VerifyEmail.verify(emailTxt.Text.ToString());
            if (isVerified)
            {
                ResultLbl.Text = "Email address exists";
            }
            else
            {
                ResultLbl.Text = "Email address does not exists";
            }
        }

        
    }
}
