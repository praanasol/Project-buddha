using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using BusinessEntitiesBS.UserEntities;

namespace InterfacesBS.InterfacesDA
{
    public interface IUserDA
    {
        void insertUserDA(userobj userObjDa);
        DataTable checkavailability(userobj checkuserDa);//to check username and email availability
        DataTable checklogin(userobj checkloginDa);
        bool UpdatePassword(string emailid, string newpwd);
    }
}
