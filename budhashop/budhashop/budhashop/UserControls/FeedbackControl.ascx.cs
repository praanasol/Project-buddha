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

        }

        protected void btn_submitFb_Click(object sender, EventArgs e)
        {
            string email = txt_emailfb.Text;
            string msg = txt_msg.Text;
            try
            {
                IUser feedbackInsert = new UserItems();
                //insert feedback details in database with given values
                int count = feedbackInsert.insertFeedback(email, msg);
                if (count > 0)
                {
                    Response.Write(@"<script language='javascript'>alert('Feedback Submitted Successfully...')</script>");
                }
                else
                {
                    Response.Write(@"<script language='javascript'>alert('Error ocuured, Please try again...')</script>");
                }
            }
            catch
            {
                Response.Write(@"<script language='javascript'>alert('Something Wrong, Please try again...')</script>");
            }
        }
    }
}