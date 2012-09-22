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
    public partial class login : System.Web.UI.UserControl
    {
        public DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string luname = txt_lusername.Text;
            string lpassword = CLASS.PasswordEncryption.EncryptIt(txt_lpassword.Text);
            BusinessEntitiesBS.UserEntities.userobj checkuserObj = new BusinessEntitiesBS.UserEntities.userobj();
            checkuserObj.uname = luname;
            checkuserObj.pwd = lpassword;
            try
            {
                IUser checkuser = new UserItems();

                //returns datatable if username and password are matched
                dt = checkuser.checklogin(checkuserObj);
                if (dt != null)
                {
                    lbl_login.Text = "Log In Successfull";
                }
                else
                {
                    lbl_login.Text = "Invalid User Id / Password";
                }
            }
            catch (Exception ex)
            {
                lbl_login.Text = "Error Occured: " + ex.Message;
            }
        }

        protected void btn_lclr_Click(object sender, EventArgs e)
        {
            txt_lusername.Text = txt_lpassword.Text = "";
            txt_lusername.Focus();
        }
    }
}