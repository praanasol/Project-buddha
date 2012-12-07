using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.IO;
using System.Text;
using System.Net.Mail;

namespace budhashop.CLASS
{
    internal class SendComplaint
    {
        internal bool fileComplaint(string name, string pid, string msg)
        {
            MailMessage message = new MailMessage();
            try
            {
                string emailid = "mithunmohan23@gmail.com";
                string smsg1 = "<b>Purchase Id: </b>" + pid;
                string smsg2 = "<br><b>Name: </b>" + name;
                string smsg3 = "<br><b>Message: </b>" + msg;

                message.To.Add(new MailAddress(emailid));
                message.From = new MailAddress("support@govedic.com");

                message.Subject = "Complaint agianst Purchase Id = " + pid;
                message.Body = smsg1 + smsg2 + smsg3;
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

