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

namespace budhashop
{
    public partial class contactus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_userName.Attributes.Add("onkeypress", "return controlEnter('" + btn_submitComplaint.ClientID + "', event)");
            txt_Pid.Attributes.Add("onkeypress", "return controlEnter('" + btn_submitComplaint.ClientID + "', event)");
        }

        [WebMethod]
        public static bool fileComplaint(string Name, string PId, string Message)
        {
            CLASS.SendComplaint send = new budhashop.CLASS.SendComplaint();
            bool result = send.fileComplaint(Name, PId, Message);
            return result;
        }
    }
}
