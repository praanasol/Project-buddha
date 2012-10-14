using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

using InterfacesBS.InterfacesBL;
using BusinessLogicBS;
using BusinessLogicBS.UserClasses;

namespace budhashop.USER.Services
{
    /// <summary>
    /// Summary description for LoginControl
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    //[ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class LoginControl : System.Web.Services.WebService
    {
        public DataTable dt;

        [WebMethod(EnableSession = true)]
        public bool LoginUser(string emailid, string password)
        {
            bool flag = false;
            string pwd = CLASS.PasswordEncryption.EncryptIt(password);
            BusinessEntitiesBS.UserEntities.userobj checkuserObj = new BusinessEntitiesBS.UserEntities.userobj();
            checkuserObj.uname = emailid;
            checkuserObj.pwd = pwd;
            try
            {
                
                IUser checkuser = new UserItems();

                //returns datatable if username and password are matched
                dt = checkuser.checklogin(checkuserObj);
                if (dt != null)
                {
                    flag = true;
                    this.Session["currentuser"] = dt.Rows[0]["Email"].ToString();
                }
                else
                {
                    flag = false;

                }
            }
            catch (Exception ex)
            {
                flag = false;

            }
            
            return flag;
        
        }
    }
}
