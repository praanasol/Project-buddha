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
        DataTable checkavailability(string emailid);//to check email availability
        DataTable checklogin(string emailid, string pwd);
        bool UpdatePassword(string userid, string newpwd);
        bool UpdateProfile(string userid, string newvalue, string fieldname);
        int insertOrdersDA(OrderItems orderitems);
        DataTable retrieveOrdersDA();
        DataTable retrieveUserOrdersDA(string userid);

        int insertFeedbackDA(string email, string msg);

        int checkPurchaseIdDA(int pid);

        DataTable checkMerchantDA(string id, string pwd);
        DataSet getMerchantDA(int mId);
    }
}
