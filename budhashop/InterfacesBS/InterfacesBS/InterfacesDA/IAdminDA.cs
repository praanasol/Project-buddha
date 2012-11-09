using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using BusinessEntitiesBS.Catagory_Entities;
using BusinessEntitiesBS.ItemEntities;
using BusinessEntitiesBS.GroupEntities;
using BusinessEntitiesBS.UserEntities;

namespace InterfacesBS.InterfacesDA
{
    public interface IAdminDA
    {
        int insertCatagoryDA(catagoryObj catObjDa);
        DataTable getCatgValues();
        int insertItemDA(ItemObj itemObjDa);
        DataTable getItemValues(int grpCatId);
        int insertGrpDA(grpObj grpObjDa);
        
        int UpdateItemDA(ItemObj updateitemObjDa, int itemid);
        DataTable SearchItemsDA(string itemname,int catid);
        int removeItemDA(int itemid);

        DataTable SearchUsersDA(string uname);
        int UpdateUserDA(userobj updateuserObjDa, int userid);

        DataTable SearchOrdersDA(string value1, string value2);

        int checkLoginDA(string adminid, string pwd);
    }
}
