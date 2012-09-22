using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using BusinessEntitiesBS.UserEntities;

namespace InterfacesBS.InterfacesBL
{
    public interface IUser
    {
        void insertUser(userobj userObj);
        DataTable checkavailability(string checkvalue);
        DataTable checklogin(userobj checkloginObj);
        bool UpdatePassword(string emailid, string newpwd);
    }
}
