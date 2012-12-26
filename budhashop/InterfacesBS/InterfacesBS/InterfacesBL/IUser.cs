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
        DataTable checkavailability(string emailid);
        DataTable checklogin(string emailid, string pwd);
        bool UpdatePassword(string userid, string newpwd);
        bool UpdateProfile(string userid, string newvalue, string fieldname);
        int insertOrders(OrderItems orderitems);
        DataTable getOrders();
        DataTable getUserOrders(string userid);

        int insertFeedback(string email, string msg);

        int checkPurchaseId(int pid);

        DataTable checkMerchant(string id, string pwd);
        DataSet getMerchant(int mId);
        bool updateMerchantItems(int itemId, float itemBR, int Qty, float itemNR);
    }
}
