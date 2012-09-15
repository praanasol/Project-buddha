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

namespace budhashop.USER
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        public DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            string uname = txt_emailid.Text;
            string oldpassword = CLASS.PasswordEncryption.EncryptIt(txt_oldpwd.Text);
            string newpassword = CLASS.PasswordEncryption.EncryptIt(txt_newpwd.Text);
            BusinessEntitiesBS.UserEntities.userobj checkuserObj = new BusinessEntitiesBS.UserEntities.userobj();
            checkuserObj.uname = uname;
            checkuserObj.pwd = oldpassword;
            try
            {
                IUser checkuser = new UserItems();

                //returns a table if given email id and password are matched
                dt = checkuser.checklogin(checkuserObj);
                if (dt != null)
                {
                    bool ispwdupdated = checkuser.UpdatePassword(uname, newpassword); 
                    if (ispwdupdated)
                    {
                        lbl_submit.Text = "Password Changed Successfully";
                        lbl_submit.Font.Bold = true;
                    }
                    else
                    {
                        lbl_submit.Text = "Something Wrong,try again!";
                    }
                }
                else
                {
                    lbl_submit.Text = "Invalid User Id / Password";
                }
            }
            catch (Exception ex)
            {
                lbl_submit.Text = "Error Occured: " + ex.Message;
            }
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login_Register.aspx");
        }
    }
}
