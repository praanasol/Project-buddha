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
        DataTable checkavailability(string checkvalue);//to check username and email availability
        DataTable checklogin(userobj checkloginDa);
        bool UpdatePassword(string emailid, string newpwd);
        bool UpdateName(string emailid, string newname);
        bool UpdatePhoneNumber(string emailid, string newphno);
        bool UpdateAddress(string emailid, string newaddress);
    }
}
