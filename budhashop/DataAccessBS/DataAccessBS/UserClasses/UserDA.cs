using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using DataAccessBS.SupportedClasses;
using System.Data;
using InterfacesBS.InterfacesDA;

using System.Web;

namespace DataAccessBS.UserClasses
{
    public class UserDA : IUserDA
    {
        #region IUserDA Members Insert User

        /// <summary>
        ///  This method will do 
        /// </summary>
        /// <param name="userobjDA"></param>
        public void insertUserDA(BusinessEntitiesBS.UserEntities.userobj userobjDA)
        {
            try
            {

                SqlParameter[] sqlParams = new SqlParameter[3];

                //User parameters
                sqlParams[0] = new SqlParameter("@uname", userobjDA.uname);
                sqlParams[1] = new SqlParameter("@emailid", userobjDA.emailid);
                sqlParams[2] = new SqlParameter("@pwd", userobjDA.pwd);
                DBHelper.ExecuteNonQuery(DBCommon.ConnectionString, "USP_INSERT_USERS", sqlParams);
            }
            catch (SqlException exc)
            {
                throw exc;
            }

        }

        #endregion

        #region IUserDA Members Check EmailId Availability

        public DataTable checkavailability(string emailid)
        {            
                try
                {
                    SqlParameter[] sqlParams = new SqlParameter[1];

                    //User parameters
                    sqlParams[0] = new SqlParameter("@emailid", emailid);
                    DataTable checkuserDT = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_CHECK_EMAIL", sqlParams).Tables[0];

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

        public DataTable checklogin(string emailid, string pwd)
        {
            try
            {
                    SqlParameter[] sqlParams = new SqlParameter[2];

                    //User parameters
                    sqlParams[0] = new SqlParameter("@uname", emailid);
                    sqlParams[1] = new SqlParameter("@password", pwd);
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

        public bool UpdatePassword(string userid, string newpwd)
        {
            try
            {
                SqlParameter[] sqlParams = new SqlParameter[2];

                sqlParams[0] = new SqlParameter("@userid", userid);
                sqlParams[1] = new SqlParameter("@password", newpwd);
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

        #region IUserDA Members Update Profile

        public bool UpdateProfile(string userid, string newvalue, string fieldname)
        {
            try
            {
                SqlParameter[] sqlParams = new SqlParameter[3];

                sqlParams[0] = new SqlParameter("@uid", userid);
                sqlParams[1] = new SqlParameter("@newvalue", newvalue);
                sqlParams[2] = new SqlParameter("@fieldname", fieldname);

                int count = DBHelper.ExecuteNonQuery(DBCommon.ConnectionString, "USP_EDIT_PROFILE", sqlParams);
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
                return false;
            }
        }

        #endregion

        #region IUserDA Members


        public int insertOrdersDA(BusinessEntitiesBS.UserEntities.OrderItems orderitems)
        {
            try
            {

                SqlParameter[] sqlParams = new SqlParameter[9];

                //User parameters
                sqlParams[0] = new SqlParameter("@userId", orderitems.userid);
                sqlParams[1] = new SqlParameter("@purchaseDate", orderitems.purchaseDate);
                sqlParams[2] = new SqlParameter("@ItemString", orderitems.cartItems);
                sqlParams[3] = new SqlParameter("@totalPrice", orderitems.totalBill);
                sqlParams[4] = new SqlParameter("@Address", orderitems.ShippingAdr);
                sqlParams[5] = new SqlParameter("@totalItems", orderitems.totalItems);
                sqlParams[6] = new SqlParameter("@separator", ';');
                sqlParams[7] = new SqlParameter("@separator2", ',');
                sqlParams[8] = new SqlParameter("@SizeString", orderitems.TypeItem);

                DataTable idDt = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_INSERT_ORDER_ITEMS", sqlParams).Tables[0];
                int returnedId = Convert.ToInt32(idDt.Rows[0].ItemArray[0].ToString());


                if (idDt.Rows.Count > 0)
                {
                    return returnedId;
                }
                else
                {
                    return -1;
                }



            }
            catch (SqlException exc)
            {

                throw exc;
                return -1;
            }
        }

        #endregion

        #region IUserDA Members


        public DataTable retrieveOrdersDA()
        {
            try
            {

                DataTable ordersDT = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_GET_ORDERS").Tables[0];

                if (ordersDT.Rows.Count > 0)
                {
                    return ordersDT;
                }
                else
                {
                    return null;
                }
            }
            catch(Exception exp)
            {
                throw exp;
            }
        }

        #endregion

        #region IUserDA Members User Orders


        public DataTable retrieveUserOrdersDA(string userid)
        {
            try
            {
                SqlParameter[] sqlParams = new SqlParameter[1];

                sqlParams[0] = new SqlParameter("@uid", userid);

                DataTable ordersDT = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_USER_ORDERS",sqlParams).Tables[0];

                if (ordersDT.Rows.Count > 0)
                {
                    return ordersDT;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception exp)
            {
                throw exp;
            }
        }

        #endregion

        #region IUserDA Members Insert Feedback

        public int insertFeedbackDA(string email,string msg)
        {
            try
            {

                SqlParameter[] sqlParams = new SqlParameter[2];

                sqlParams[0] = new SqlParameter("@email", email);
                sqlParams[1] = new SqlParameter("@msg", msg);

                int count = DBHelper.ExecuteNonQuery(DBCommon.ConnectionString, "USP_SITE_FEEDBACK", sqlParams);

                return count;
            }
            catch (SqlException exc)
            {
                throw exc;
                return -1;
            }
        }

        #endregion
    }
}
