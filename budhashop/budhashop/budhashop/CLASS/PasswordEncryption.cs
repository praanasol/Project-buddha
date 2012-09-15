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
using System.Security.Cryptography;
using System.Security;
using System.Text;

namespace budhashop.CLASS
{
    public class PasswordEncryption
    {
        static void Main(string[] args)
        {
        }
        public static string EncryptIt(string password)
        {
            HashAlgorithm hash = new SHA512Managed();

            // compute hash of the password
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(password);
            byte[] hashBytes = hash.ComputeHash(plainTextBytes);
            string saltedHashValue = Convert.ToBase64String(hashBytes);

            return saltedHashValue;
        }
    }
}
