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
    public partial class LoginRegister : System.Web.UI.Page
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

        protected void txt_emailid_TextChanged(object sender, EventArgs e)
        {
            string emailid = txt_emailid.Text;
            bool ismatched = System.Text.RegularExpressions.Regex.IsMatch(emailid, @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
            if (ismatched)
            {
                try
                {
                    IUser checkuser = new UserItems();

                    //returns the table if given emailid exists
                    dt = checkuser.checkavailability(emailid);
                    if (dt != null)
                    {
                        imgEmail.ImageUrl = "~/images/unavailable.png";
                        imgEmail.Visible = true;
                        lbl_checkemail.Text = HardCodedValues.BuddaResource.EmailIdExist;
                        lbl_checkemail.ForeColor = System.Drawing.Color.Red;
                        txt_emailid.Focus();
                    }
                    else
                    {
                        imgEmail.ImageUrl = "~/images/tick.png";
                        imgEmail.Visible = true;
                        lbl_checkemail.Text = HardCodedValues.BuddaResource.EmailIdAvailable;
                        lbl_checkemail.ForeColor = System.Drawing.Color.Green;
                    }
                }
                catch (Exception ex)
                {
                    lbl_checkemail.Text = HardCodedValues.BuddaResource.CatchBlockError + ex.Message;
                }
            }
            else
            {
                imgEmail.ImageUrl = "~/images/unavailable.png";
                imgEmail.Visible = true;
                lbl_checkemail.Text = HardCodedValues.BuddaResource.EmailFormatError;
                lbl_checkemail.ForeColor = System.Drawing.Color.Red;
                txt_emailid.Focus();
            }
        }

        protected void btn_clr_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void btn_reg_Click(object sender, EventArgs e)
        {
            if (lbl_checkemail.Text == HardCodedValues.BuddaResource.EmailIdAvailable)
            {
                //Check whether the Captcha text is correct or not
                if (this.txt_captcha.Text == this.Session["CaptchaImageText"].ToString())
                {
                    string uname = txt_username.Text;
                    string emailid = txt_emailid.Text;
                    string encryptedpwd = CLASS.PasswordEncryption.EncryptIt(txt_password.Text);

                    BusinessEntitiesBS.UserEntities.userobj userObj = new BusinessEntitiesBS.UserEntities.userobj();

                    userObj.uname = uname;
                    userObj.emailid = emailid;
                    userObj.pwd = encryptedpwd;
                    try
                    {
                        IUser userInsert = new UserItems();

                        //insert new user details in database with given values
                        userInsert.insertUser(userObj);

                        dt = userInsert.checklogin(emailid, encryptedpwd);
                        this.Session["currentuser"] = dt;

                        //lbl_register.Text = "Registration Successfull";
                        Response.Redirect("~/USER/ProfilePage.aspx");
                    }
                    catch (Exception exp)
                    {
                        lbl_register.Text = HardCodedValues.BuddaResource.CatchBlockError + exp.Message;
                    }
                }
                else
                {
                    txt_captcha.Text = "";
                    lbl_captcha.Text = HardCodedValues.BuddaResource.CaptchaError;
                    // Create a random Captcha and store it in the Session object.
                    this.Session["CaptchaImageText"] = Captcha.CaptchaImage.GenerateRandomCode(7);
                    txt_captcha.Focus();
                }
            }
            else
            {
                txt_emailid.Focus();
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
                    this.Session["currentuser"] = dt;
                    //lbl_login.Text = "Log In Successfull";
                    Response.Redirect("~/homepage.aspx");
                    //txt_lusername.Enabled = txt_lpassword.Enabled = false;
                }
                else
                {
                    lbl_login.Text = HardCodedValues.BuddaResource.LoginFail;
                }
            }
            catch (Exception ex)
            {
                lbl_login.Text = HardCodedValues.BuddaResource.CatchBlockError + ex.Message;
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
