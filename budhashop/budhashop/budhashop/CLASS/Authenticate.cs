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

namespace budhashop.CLASS
{
    internal class Authenticate
    {
        internal void AuthenticateUser(string userid, string role)
        {
            // Create forms authentication ticket
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
            1, // Ticket version
            userid,// Username to be associated with this ticket
            DateTime.Now, // Date/time ticket was issued
            DateTime.Now.AddMinutes(50), // Date and time the cookie will expire
            false, // if user has chcked rememebr me then create persistent cookie
            role, // store the user data, in this case roles of the user
            FormsAuthentication.FormsCookiePath); // Cookie path specified in the web.config file in <Forms> tag if any.
            // To give more security it is suggested to hash it
            string hashCookies = FormsAuthentication.Encrypt(ticket);
            HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hashCookies); // Hashed ticket
            // Add the cookie to the response, user browser
            HttpContext.Current.Response.Cookies.Add(cookie);
        }
    }
}
