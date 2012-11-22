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
    public partial class FeedbackControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_emailfb.Attributes.Add("onkeypress", "return controlEnter('" + btn_submitFb.ClientID + "', event)");
        }

        protected void btn_submitFb_Click(object sender, EventArgs e)
        {
            //string email = txt_emailfb.Text;
            //string msg = txt_msg.Text;
            //ClientScriptManager cs = Page.ClientScript;
            //try
            //{
            //    IUser feedbackInsert = new UserItems();
            //    //insert feedback details in database with given values
            //    int count = feedbackInsert.insertFeedback(email, msg);
            //    if (count > 0)
            //    {
            //        cs.RegisterStartupScript(typeof(Page), "PrintScript_" + UniqueID, "show_submittedFb('success');", true);
            //    }
            //    else
            //    {
            //        cs.RegisterStartupScript(typeof(Page), "PrintScript_" + UniqueID, "show_submittedFb('fail');", true);
            //    }
            //}
            //catch
            //{
            //    cs.RegisterStartupScript(typeof(Page), "PrintScript_" + UniqueID, "show_submittedFb('fail');", true);
            //    //Response.Write(@"<script language='javascript'>alert('Something Wrong, Please try again...')</script>");
            //}
        }
    }
}