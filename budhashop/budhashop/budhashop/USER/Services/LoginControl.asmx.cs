﻿using System;
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
        public string LoginUser(string emailid, string password)
        {
            //string flag = string.Empty;
            string encryptedpwd = CLASS.PasswordEncryption.EncryptIt(password);
            try
            {
                
                IUser checkuser = new UserItems();

                //returns datatable if username and password are matched
                dt = checkuser.checklogin(emailid, encryptedpwd);
                if (dt != null)
                {
                    //flag = "Existing User";
                    this.Session["currentuser"] = dt;
                    return emailid;
                }
                else
                {
                    //flag = "Invalid User";
                    return "nouser";

                }
            }
            catch (Exception ex)
            {
                //flag = "Error: " + ex;
                return "nouser";
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
                    try
                    {
                        IUser userInsert = new UserItems();

                        //insert new user details in database with given values
                        userInsert.insertUser(userObj);

                        DataTable dt2 = userInsert.checklogin(emailid, encryptedpwd);

                        this.Session["currentuser"] = dt2;
                       
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

        [WebMethod(EnableSession = true)]
        public bool UpdateProfile(string newvalue, string fieldname)
        {
            dt = (DataTable)this.Session["currentuser"];
            string userid = dt.Rows[0]["Uid"].ToString();
            try
            {
                IUser updateprofile = new UserItems();
                bool isupdated = updateprofile.UpdateProfile(userid, newvalue, fieldname);
                return isupdated;
            }
            catch
            {
                return false;
            }

        }

        [WebMethod(EnableSession = true)]
        public bool UpdatePassword(string oldpwd, string newpwd)
        {
            dt = (DataTable)this.Session["currentuser"];
            string emailid = dt.Rows[0]["Email"].ToString();
            string userid = dt.Rows[0]["Uid"].ToString();
            string validuser = LoginUser(emailid, oldpwd);
            if (validuser != "nouser")
            {
                string newpassword = CLASS.PasswordEncryption.EncryptIt(newpwd);
                try
                {
                    IUser updatepassword = new UserItems();
                    bool ispwdupdated = updatepassword.UpdatePassword(userid, newpassword);
                    return ispwdupdated;
                }
                catch
                {
                    return false;
                }
            }
            else
            {
                return false;
            }

        }

        [WebMethod(EnableSession = true)]
        public string Getuser()
        {
            DataTable dt = (DataTable)this.Session["currentuser"];
            return dt.Rows[0]["Email"].ToString();
        }
    }
}
