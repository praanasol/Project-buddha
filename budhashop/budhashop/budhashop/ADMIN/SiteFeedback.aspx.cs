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
    public partial class SiteFeedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getFeedBackList();
        }

        private void getFeedBackList()
        {
            try
            {
                IAdmin getFeedback = new AdminItems();
                DataTable feedbackDt = getFeedback.getFeedback();
                gv_feedback.DataSource = feedbackDt;
                gv_feedback.DataBind();
            }
            catch
            {
                gv_feedback.DataSource = null;
                gv_feedback.DataBind();
            }
                
        }

        protected void gv_feedback_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_feedback.PageIndex = e.NewPageIndex;
            getFeedBackList();
        }

        protected void lb_logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("../ADMIN/LoginA.aspx");
        }
    }
}
