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
    }
}
