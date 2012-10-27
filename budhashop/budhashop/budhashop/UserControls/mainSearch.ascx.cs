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

namespace budhashop.UserControls
{
    public partial class mainSearch : System.Web.UI.UserControl
    {
        public string startItem
        {
            get
            {
                return SearchAll.Text;
            }
            set
            {
                SearchAll.Text = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            string searchStr = SearchAll.Text.ToString();
            string searchUrl = "~/searchitems.aspx?q=" + searchStr;
            Response.Redirect(searchUrl);

        }
    }
}