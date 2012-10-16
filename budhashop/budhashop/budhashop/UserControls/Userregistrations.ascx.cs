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
    public partial class Userregistrations : System.Web.UI.UserControl
    {
        public DataTable dt;

        private void Page_Load(object sender, System.EventArgs e)
        {
            if (!this.IsPostBack)
            {
                // Create a random Captcha and store it in the Session object.
                this.Session["CaptchaImageText"] = Captcha.CaptchaImage.GenerateRandomCode(7);
            }
        }        

        protected void btn_chkuser_Click(object sender, EventArgs e)
        {            
            string uname = txt_username.Text;          
            try
            {
                IUser checkuser = new UserItems();

                //returns the table if given username exists
                dt = checkuser.checkavailability(uname);
                if (dt == null)
                {
                    lbl_checkuser.Text = "Available";
                    txt_username.Enabled = btn_chkuser.Enabled = false;
                    txt_emailid.Enabled = btn_chkemail.Enabled = true;
                }
                else
                {
                    lbl_checkuser.Text = "Try Another";
                }
            }
            catch (Exception ex)
            {
                lbl_register.Text = "Error Occured: " + ex.Message;
            }
        }

        protected void btn_chkemail_Click(object sender, EventArgs e)
        {
            string emailid = txt_emailid.Text;            
            try
            {
                IUser checkuser = new UserItems();

                //returns the table if given emailid exists
                dt = checkuser.checkavailability(emailid);
                if (dt == null)
                {
                    lbl_checkemail.Text = "Available";
                    txt_emailid.Enabled = btn_chkuser.Enabled = false;
                    txt_password.Enabled = txt_cnfmpassword.Enabled = txt_phno.Enabled = txt_address.Enabled = txt_captcha.Enabled = btn_reg.Enabled = true;
                }
                else
                {
                    lbl_checkemail.Text = "You are Already Registered with this Email ID";
                }                
            }
            catch (Exception ex)
            {
                lbl_register.Text = "Error Occured : " + ex.Message;
            }
        }

        protected void btn_clr_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            //Check whether the Captcha text is correct or not
            if (this.txt_captcha.Text == this.Session["CaptchaImageText"].ToString())
            {
                btn_chkemail.Enabled = false;

                string uname = txt_username.Text;
                string emailid = txt_emailid.Text;
                string encryptedpwd = CLASS.PasswordEncryption.EncryptIt(txt_password.Text);
                string phno = txt_phno.Text;
                string address = txt_address.Text;
                bool userstatus = cb_userstatus.Checked;

                BusinessEntitiesBS.UserEntities.userobj userObj = new BusinessEntitiesBS.UserEntities.userobj();

                userObj.uname = uname;
                userObj.emailid = emailid;
                userObj.pwd = encryptedpwd;
                userObj.phno = phno;
                userObj.address = address;
                userObj.userstatus = userstatus;
                try
                {
                    IUser userInsert = new UserItems();

                    //insert new user details in database with given values
                    userInsert.insertUser(userObj);
                    lbl_register.Text = "Registration Successfull";
                }
                catch (Exception exp)
                {
                    lbl_register.Text = "Error: " + exp.Message;
                }
            }
            else
            {
                txt_captcha.Text = "";
                lbl_captcha.Text = "Enter Correct data";
                // Create a random Captcha and store it in the Session object.
                this.Session["CaptchaImageText"] = Captcha.CaptchaImage.GenerateRandomCode(7);
                txt_captcha.Focus();
            }
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            string luname = txt_lusername.Text;
            string lpassword = CLASS.PasswordEncryption.EncryptIt(txt_lpassword.Text);
            try
            {
                IUser checkuser = new UserItems();

                //returns datatable if username and password are matched
                dt = checkuser.checklogin(luname, lpassword);
                if (dt != null)
                {
                    lbl_login.Text = "Log In Successfull";
                    //txt_lusername.Enabled = txt_lpassword.Enabled = false;
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
        }

        protected void imgbtn_refreshcaptcha_Click(object sender, ImageClickEventArgs e)
        {
            // Create a random Captcha and store it in the Session object.
            this.Session["CaptchaImageText"] = Captcha.CaptchaImage.GenerateRandomCode(7);
        }
    }
}