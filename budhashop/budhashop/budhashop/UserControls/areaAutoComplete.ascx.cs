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
    public partial class areaAutoComplete : System.Web.UI.UserControl
    {
        public delegate void PassIDToParent(string ID);
        public event PassIDToParent PassID;

        public string AreaName
        {
            get { return txtArea.Text; }
           set { txtArea.Text = value; }
        
        }

        public string AreaId
        {
            get { return ((HiddenField)this.FindControl("hdArea")).Value; }
            set { ((HiddenField)this.FindControl("hdArea")).Value = value; }

        }

       
        protected void Upload() //--- this is your current upload function
        {
            //--- other upload code
            //int ar = int.Parse(AreaId);
            string ReturnedID = ((HiddenField)this.FindControl("hdArea")).Value; //--- whatever is returned
            PassID(ReturnedID);
            
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void txtArea_TextChanged(object sender, EventArgs e)
        {
            //Upload();
        }
    }
}