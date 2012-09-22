using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DataAccessBS.SupportedClasses;
using System.Data;
using InterfacesBS.InterfacesDA;

namespace DataAccessBS.UserClasses
{
    public class UserDA : IUserDA
    {
        #region IUserDA Members Insert User

        public void insertUserDA(BusinessEntitiesBS.UserEntities.userobj userobjDA)
        {
            try
            {

                SqlParameter[] sqlParams = new SqlParameter[6];

                //User parameters
                sqlParams[0] = new SqlParameter("@uname", userobjDA.uname);
                sqlParams[1] = new SqlParameter("@emailid", userobjDA.emailid);
                sqlParams[2] = new SqlParameter("@pwd", userobjDA.pwd);
                sqlParams[3] = new SqlParameter("@phno", userobjDA.phno);
                sqlParams[4] = new SqlParameter("@address", userobjDA.address);
                sqlParams[5] = new SqlParameter("@userstatus", userobjDA.userstatus);
                DBHelper.ExecuteNonQuery(DBCommon.ConnectionString, "USP_INSERT_USERS", sqlParams);
            }
            catch (SqlException exc)
            {
                throw exc;
            }

        }

        #endregion

        #region IUserDA Members Check UserName or EmailId Availability

        public DataTable checkavailability(string checkvalue)
        {            
                try
                {
                    SqlParameter[] sqlParams = new SqlParameter[1];

                    //User parameters
                    sqlParams[0] = new SqlParameter("@uname", checkvalue);
                    DataTable checkuserDT = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_CHECK_USER", sqlParams).Tables[0];

                    if (checkuserDT.Rows.Count > 0)
                    {
                        return checkuserDT;
                    }
                    else
                    {
                        return null;
                    }
                }
                catch
                {
                    throw;
                }
        }
        #endregion

        #region IUserDA Members Check Login

        public DataTable checklogin(BusinessEntitiesBS.UserEntities.userobj checkloginDA)
        {
            try
            {
                    SqlParameter[] sqlParams = new SqlParameter[2];

                    //User parameters
                    sqlParams[0] = new SqlParameter("@uname", checkloginDA.uname);
                    sqlParams[1] = new SqlParameter("@password", checkloginDA.pwd);
                    DataTable LoginDT = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_CHECK_LOGIN", sqlParams).Tables[0];

                    if (LoginDT.Rows.Count > 0)
                    {
                        return LoginDT;
                    }
                    else
                    {
                        return null;
                    }
            }
            catch
            {
                    throw;
            }
        }

        #endregion

        #region IUserDA Members Update Password

        public bool UpdatePassword(string emailid, string newpwd)
        {
            try
            {
                SqlParameter[] sqlParams = new SqlParameter[2];

                sqlParams[0] = new SqlParameter("@Email", emailid);
                sqlParams[1] = new SqlParameter("@PWD", newpwd);
                int count = DBHelper.ExecuteNonQuery(DBCommon.ConnectionString, "USP_CHANGE_PASSWORD", sqlParams);
                bool isUpdated = false;
                if (count > 0)
                {
                    isUpdated = true;
                }
                else
                {
                    isUpdated = false;
                }
                return isUpdated;
            }
            catch (System.Data.SqlClient.SqlException ex_msg)
            {

                string msg = "Error occured while login.";
                msg += ex_msg.Message;
                throw new Exception(msg);
            }
        }

        #endregion
    }
}
