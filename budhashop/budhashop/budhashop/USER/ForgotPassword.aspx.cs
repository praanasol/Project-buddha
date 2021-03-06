﻿using System;
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

namespace budhashop.USER
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        private DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                // Create a random Captcha and store it in the Session object.
                this.Session["CaptchaImageText"] = Captcha.CaptchaImage.GenerateRandomCode(7);
            }
        }

        private static Random rand = new Random();
        private static string randomtext = HardCodedValues.BudhaConstants.RandomString;

        // Generates and returns a new random password
        private static string GenerateRandomPassword(int length)
        {
            string result = "";
            while (length-- > 0)
                result += randomtext[rand.Next(randomtext.Length)];
            return result;
        }

        protected void btn_fsubmit_Click(object sender, EventArgs e)
        {
            //check whether the entered captcha text is matched or not
            if (this.txt_captcha.Text == this.Session["CaptchaImageText"].ToString())
            {
                string emailid = txt_femailid.Text;                
                try
                {
                    IUser checkuser = new UserItems();

                    //returns table if given email id exists
                    dt = checkuser.checkavailability(emailid);
                    if (dt == null)
                    {
                        lbl_femailid.Text = HardCodedValues.BuddaResource.EmailIdNull;
                        // Create a random Captcha and store it in the Session object.
                        this.Session["CaptchaImageText"] = Captcha.CaptchaImage.GenerateRandomCode(HardCodedValues.BudhaConstants.RandomPasswordLength);
                        lbl_captcha.Text = string.Empty;
                    }
                    else
                    {
                        //if email id exists, then generate a new random password
                        string newpwd = GenerateRandomPassword(HardCodedValues.BudhaConstants.RandomPasswordLength);

                        //encrypt the given password to store in database
                        string encryptedpwd = CLASS.PasswordEncryption.EncryptIt(newpwd);

                        //update the new password in database
                        bool ispwdupdated = checkuser.UpdatePassword(emailid, encryptedpwd);
                        if (ispwdupdated)
                        {
                            //send the new password to the user email id
                            sendEmail(emailid, newpwd);

                            lbl_fsubmit.Text = HardCodedValues.BuddaResource.PwdForgotSuccess;
                            lbl_fsubmit.Font.Bold = true;
                        }
                        else
                        {
                            lbl_fsubmit.Text = HardCodedValues.BuddaResource.Error;                            
                        }
                    }
                }
                catch (Exception ex)
                {
                    lbl_fsubmit.Text = HardCodedValues.BuddaResource.CatchBlockError + ex.Message;
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

        protected void imgbtn_refreshcaptcha_Click(object sender, ImageClickEventArgs e)
        {
            // Create a random Captcha and store it in the Session object.
            this.Session["CaptchaImageText"] = Captcha.CaptchaImage.GenerateRandomCode(7);
            txt_captcha.Text = "";
        }
        
        private void sendEmail(string emailid, string password)
        {
            
            string smsg = "New password has been generated, find your details below:<br>";
            smsg += "<br><b>Your Mail Id: </b>" + emailid;
            smsg += "<br><b>New Password: </b>" + password;
            smsg += "<br><br><br><br>";
            smsg += "<b>-govedic.com";
            

            MailMessage message = new MailMessage();
            try
            {
                message.To.Add(new MailAddress(emailid));
                message.From = new MailAddress("support@govedic.com");

                message.Subject = "PASSWORD CHANGE";
                message.Body = smsg;
                message.IsBodyHtml = true;

                SmtpClient client = new SmtpClient();
                client.Port = 25; // Gmail works on this port 587
                client.Host = "smtp.net4india.com";
                System.Net.NetworkCredential nc = new System.Net.NetworkCredential("support@govedic.com", "nrmr#ps24");
                client.EnableSsl = false;
                client.UseDefaultCredentials = false;

                client.Credentials = nc;
                client.Send(message);
            }
            catch
            {
                throw;
            }
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginRegister.aspx");
        }
    }
}
