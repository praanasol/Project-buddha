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
using System.Net.Mail;
using System.Net;
using System.Net.Sockets;

namespace budhashop.USER
{
    public partial class LoginRegister : System.Web.UI.Page
    {
        private DataTable dt;

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

                    bool verfyDomain = verifyDomain(emailid);
                    bool chkEmail = sendEmail(emailid);

                    if (verfyDomain && chkEmail)
                    {
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
                        lbl_register.Text = "Registration Incomplete! Invalid email id or domain. Please provide valid email for regitration.";

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

        public static bool verifyDomain(string address)
        {
            try
            {
                string[] host = (address.Split('@'));
                string hostname = host[1];
                //string hostStr = "smtp.net4india.com";

                IPHostEntry IPhst = Dns.GetHostEntry(hostname);
                //Dns.GetHostByName
                IPEndPoint endPt = new IPEndPoint(IPhst.AddressList[0], 25);
                Socket s = new Socket(endPt.AddressFamily,
                             SocketType.Stream, ProtocolType.Tcp);
                s.Connect(endPt);

                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw;

            }
        }

        private bool sendEmail(string emailId)
        {
            //string siteurl = "http://www.autoraksha.com/login/NewPassword.aspx";
            string smsg = "<div style='text-align:center;background:#4D1C12;><a href='http://www.govedic.com'><img src='http://www.govedic.com/images/logo.gif' /></a></div><br>";
            string smsg1 = "<div style='font-size:16px;text-align:center;background:#E7CD73;'><br/><b>Your account has been created succesfully with us.<b>";
            string smsg2 = "<br><b>Now you can use your account for purchasing products.  </b>" ;
            string smsg3 = "<br><b>Look around different categories of products.  </b>" ;
            string smsg4 = "<br><b>You might be interested in some of them. </b>" ;
            string smsg5 = "<br><br><b>www.govedic.com</b></div>";
            string smsg6 = "<div style='background:#4D1C12; height:100px;></div><br>";
            string smsg7 = "<br><br><br><br><br>";
            string smsg8 = "<p></p>";
            string smsg9 = "<div style='font-size:10px;text-align:center;background:#E7CD73;'><p>This is automated message. And will be sent to you only once.</p>";
            string smsg10 = "<p>Not intented for spamming.</p></div>";

            MailMessage message = new MailMessage();
            try
            {
               
                

                message.To.Add(new MailAddress(emailId));
                message.From = new MailAddress("support@govedic.com");

                message.Subject = "Thank you for registering on www.govedic.com !";
                message.Body = smsg1 + smsg2 + smsg3 + smsg4 + smsg5 + smsg6 + smsg7 + smsg8 + smsg9 + smsg10;
                message.IsBodyHtml = true;

                SmtpClient client = new SmtpClient();
                client.Port = 25; // Gmail works on this port 587
                client.Host = "smtp.net4india.com";
                System.Net.NetworkCredential nc = new System.Net.NetworkCredential("support@govedic.com", "nrmr#ps24");
                client.EnableSsl = false;
                client.UseDefaultCredentials = false;

                client.Credentials = nc;
                client.Send(message);
                return true;
            }
            catch (Exception ex)
            {
                return false;
                throw ex;
            }
        }
    }
}
