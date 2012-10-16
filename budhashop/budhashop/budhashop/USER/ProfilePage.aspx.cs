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

using System.Data.SqlClient;
using InterfacesBS.InterfacesBL;
using BusinessLogicBS;
using BusinessLogicBS.UserClasses;

namespace budhashop.USER
{
    public partial class ProfilePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["currentuser"] != null)
            {
                DataTable dt = (DataTable)this.Session["currentuser"];
                string emailid = dt.Rows[0]["Email"].ToString();
                retrieveUser(emailid);
            }
            else
            {
                lbl_status.Text = "You are not Logged in...";
            }
        }

        protected void retrieveUser(string emailid)
        {
            try
            {
                IUser retrieveuser = new UserItems();

                //returns the table if given emailid exists
                DataTable dt = retrieveuser.checkavailability(emailid);
                if (dt != null)
                {
                    txt_emailid.Text = dt.Rows[0]["Email"].ToString();
                    txt_uname.Text = dt.Rows[0]["UserName"].ToString();
                    txt_phno.Text = dt.Rows[0]["Phone"].ToString();
                    txt_address.Text = dt.Rows[0]["Address"].ToString();
                }
            }
            catch (Exception ex)
            {
                lbl_status.Text = "Error Occured : " + ex.Message;
            }
        }
    }
}
