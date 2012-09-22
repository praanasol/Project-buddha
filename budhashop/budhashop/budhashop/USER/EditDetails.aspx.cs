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
    public partial class EditDetails : System.Web.UI.Page
    {
        public DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_updateemail_Click(object sender, EventArgs e)
        {
            dt = (DataTable)this.Session["data"];
            string emailid = txt_emailid.Text;
            if (emailid != dt.Rows[0]["Email"].ToString())
            {
                try
                {
                    IUser checkuser = new UserItems();

                    //returns the table if given emailid exists
                    dt = checkuser.checkavailability(emailid);
                    if (dt == null)
                    {

                    }
                    else
                    {
                        lbl_checkemail.Text = "Email Id Already exists in our Database";
                    }
                }
                catch (Exception ex)
                {
                    lbl_checkemail.Text = "Error Occured : " + ex.Message;
                }
            }
            else
            {
                lbl_checkemail.Text = "No changes made";
            }
        }

        protected void btn_retrieve_Click(object sender, EventArgs e)
        {
            string uname = txt_uname.Text;
            try
            {
                IUser checkuser = new UserItems();

                //returns the table if given emailid exists
                dt = checkuser.checkavailability(uname);
                if (dt == null)
                {
                    lbl_checkemail.Text = "Invalid UserName";
                }
                else
                {
                    //DataRow dtr = dt.Rows[0];
                    //txt_emailid.Text = dtr[1].ToString();
                    //txt_phno.Text = dtr["Phone"].ToString();
                    txt_emailid.Text = dt.Rows[0]["Email"].ToString();
                    txt_phno.Text = dt.Rows[0]["Phone"].ToString();
                    txt_address.Text = dt.Rows[0]["Address"].ToString();
                    cb_actvsts.Checked = Convert.ToBoolean(dt.Rows[0]["ActvSts"]);
                    this.Session["data"] = dt;
                }
            }
            catch (Exception ex)
            {
                lbl_checkemail.Text = "Error Occured : " + ex.Message;
            }            
        }
    }
}
