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

        #region IUser Members Check UserName or Email Availability

        public DataTable checkavailability(string checkvalue)
        {
            try
            {
                IUserDA checkuser = new DataAccessBS.UserClasses.UserDA();
                return checkuser.checkavailability(checkvalue);
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IUser Members Check LogIn

        public DataTable checklogin(BusinessEntitiesBS.UserEntities.userobj checkuserObj)
        {
            try
            {
                IUserDA checklogin = new DataAccessBS.UserClasses.UserDA();
                return checklogin.checklogin(checkuserObj);
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IUser Members Password Update

        public bool UpdatePassword(string emailid, string newpwd)
        {
            try
            {
                IUserDA checkuser = new DataAccessBS.UserClasses.UserDA();
                return checkuser.UpdatePassword(emailid, newpwd);
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region IUser Members User Name Update

        public bool UpdateName(string emailid, string newname)
        {
            try
            {
                IUserDA updatename = new DataAccessBS.UserClasses.UserDA();
                return updatename.UpdateName(emailid, newname);
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region IUser Members Phone Number Update

        public bool UpdatePhoneNumber(string emailid, string newphno)
        {
            try
            {
                IUserDA updatephno = new DataAccessBS.UserClasses.UserDA();
                return updatephno.UpdatePhoneNumber(emailid, newphno);
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region IUser Members Address Update

        public bool UpdateAddress(string emailid, string newaddress)
        {
            try
            {
                IUserDA updateaddress = new DataAccessBS.UserClasses.UserDA();
                return updateaddress.UpdateAddress(emailid, newaddress);
            }
            catch
            {
                throw;
            }
        }
        #endregion

    }
}
