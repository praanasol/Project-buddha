using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using InterfacesBS.InterfacesDA;
using InterfacesBS.InterfacesBL;

namespace BusinessLogicBS.UserClasses
{
    public class UserItems : IUser
    {
        #region IUser Members insert user

        public void insertUser(BusinessEntitiesBS.UserEntities.userobj userobj)
        {
            IUserDA userInsert = new DataAccessBS.UserClasses.UserDA();
            userInsert.insertUserDA(userobj);
        }

        #endregion

        #region IUser Members Check Email Availability

        public DataTable checkavailability(string emailid)
        {
            try
            {
                IUserDA checkuser = new DataAccessBS.UserClasses.UserDA();
                return checkuser.checkavailability(emailid);
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IUser Members Check LogIn

        public DataTable checklogin(string emailid, string pwd)
        {
            try
            {
                IUserDA checklogin = new DataAccessBS.UserClasses.UserDA();
                return checklogin.checklogin(emailid,pwd);
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IUser Members Password Update

        public bool UpdatePassword(string userid, string newpwd)
        {
            try
            {
                IUserDA checkuser = new DataAccessBS.UserClasses.UserDA();
                return checkuser.UpdatePassword(userid, newpwd);
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region IUser Members Profile Update

        public bool UpdateProfile(string userid, string newvalue, string fieldname)
        {
            try
            {
                IUserDA updatefield = new DataAccessBS.UserClasses.UserDA();
                return updatefield.UpdateProfile(userid, newvalue, fieldname);
            }
            catch
            {
                throw;
            }
        }
        #endregion


        #region IUser Members


        public int insertOrders(BusinessEntitiesBS.UserEntities.OrderItems orderitems)
        {
            IUserDA orderInsert = new DataAccessBS.UserClasses.UserDA();
            return orderInsert.insertOrdersDA(orderitems);
            
        }

        #endregion

        #region IUser Members


        public DataTable getOrders()
        {
            IUserDA orderInsert = new DataAccessBS.UserClasses.UserDA();
            return orderInsert.retrieveOrdersDA();
        }

        #endregion

        #region IUser Members User Orders


        public DataTable getUserOrders(string userid)
        {
            IUserDA getOrders = new DataAccessBS.UserClasses.UserDA();
            return getOrders.retrieveUserOrdersDA(userid);
        }

        #endregion

        #region IUser Members insert Feedback

        public int insertFeedback(string email, string msg)
        {
            IUserDA feedbackInsert = new DataAccessBS.UserClasses.UserDA();
            int count = feedbackInsert.insertFeedbackDA(email, msg);
            return count;
        }

        #endregion

        #region IUser Members Check Purchase Id

        public int checkPurchaseId(int pid)
        {
            IUserDA checkPid = new DataAccessBS.UserClasses.UserDA();
            int count = checkPid.checkPurchaseIdDA(pid);
            return count;
        }

        #endregion

        #region IUser Members Check Merchant LogIn

        public DataTable checkMerchant(string id, string pwd)
        {
            try
            {
                IUserDA checklogin = new DataAccessBS.UserClasses.UserDA();
                return checklogin.checkMerchantDA(id, pwd);
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IUser Members Get Merchant Details

        public DataSet getMerchant(int mId)
        {
            try
            {
                IUserDA getmerchant = new DataAccessBS.UserClasses.UserDA();
                return getmerchant.getMerchantDA(mId);
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IUser Members Merchant Items Update

        public bool updateMerchantItems(int itemId, float itemBR, int Qty, float itemNR)
        {
            try
            {
                IUserDA updateItems = new DataAccessBS.UserClasses.UserDA();
                return updateItems.updateMerchantItemsDA(itemId, itemBR, Qty, itemNR);
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region IUser Members Merchant Orders Search

        public DataTable searchMerchantOrders(int mId, int itemId, string startDate, string endDate)
        {
            try
            {
                IUserDA searchOrders = new DataAccessBS.UserClasses.UserDA();
                return searchOrders.searchMerchantOrdersDA(mId, itemId, startDate, endDate);
            }
            catch
            {
                throw;
            }
        }
        #endregion
    }
}
