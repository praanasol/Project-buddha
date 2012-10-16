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
            //string flag = string.Empty;
            string encryptedpwd = CLASS.PasswordEncryption.EncryptIt(password);
            BusinessEntitiesBS.UserEntities.userobj checkuserObj = new BusinessEntitiesBS.UserEntities.userobj();
            checkuserObj.uname = emailid;
            checkuserObj.pwd = encryptedpwd;
            try
            {
                
                IUser checkuser = new UserItems();

                //returns datatable if username and password are matched
                dt = checkuser.checklogin(checkuserObj);
                if (dt != null)
                {
                    //flag = "Existing User";
                    this.Session["currentuser"] = dt.Rows[0]["Email"].ToString();
                    return true;
                }
                else
                {
                    //flag = "Invalid User";
                    return false;

                }
            }
            catch (Exception ex)
            {
                //flag = "Error: " + ex;
                return false;
            }
            
            //return flag;        
        }

        [WebMethod(EnableSession = true)]
        public bool RegisterUser(string emailid, string password)
        {
            try
            {
                IUser checkuser = new UserItems();

                //returns the table if given emailid exists
                dt = checkuser.checkavailability(emailid);
                if (dt == null)
                {
                    string encryptedpwd = CLASS.PasswordEncryption.EncryptIt(password);
                    BusinessEntitiesBS.UserEntities.userobj userObj = new BusinessEntitiesBS.UserEntities.userobj();

                    userObj.uname = "";
                    userObj.emailid = emailid;
                    userObj.pwd = encryptedpwd;
                    userObj.phno = "";
                    userObj.address = "";
                    userObj.userstatus = true;
                    try
                    {
                        IUser userInsert = new UserItems();

                        //insert new user details in database with given values
                        userInsert.insertUser(userObj);
                        this.Session["currentuser"] = emailid;
                        return true;
                    }
                    catch (Exception exp)
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        [WebMethod]
        public bool UpdateName(string emailid, string newname)
        {
            try
            {
                IUser updatename = new UserItems();
                bool isupdated = updatename.UpdateName(emailid, newname);
                return isupdated;
            }
            catch
            {
                return false;
            }

        }

        [WebMethod]
        public bool UpdatePhoneNumber(string emailid, string newphno)
        {
            try
            {
                IUser updatephno = new UserItems();
                bool isupdated = updatephno.UpdatePhoneNumber(emailid, newphno);
                return isupdated;
            }
            catch
            {
                return false;
            }
        }

        [WebMethod]
        public bool UpdateAddress(string emailid, string newaddress)
        {
            try
            {
                IUser updateaddress = new UserItems();
                bool isupdated = updateaddress.UpdateAddress(emailid, newaddress);
                return isupdated;
            }
            catch
            {
                return false;
            }
        }
    }
}
