﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace InterfacesBS.InterfacesBL
{
    public interface IAdmin
    {
        int insertCatagory(BusinessEntitiesBS.Catagory_Entities.catagoryObj catObj);
        DataTable getCatagories();

        int insertSubCatagory(int catid, string subcatname);
        DataTable checkSubCatName(string subcatname, int catid);

        int insertMerchant(BusinessEntitiesBS.merchantObj merchantValues);
        DataTable getMerchants();

        int insertItems(BusinessEntitiesBS.ItemEntities.ItemObj itemObj);
        DataTable getItems(int grpCatId);
        int insertGroup(BusinessEntitiesBS.GroupEntities.grpObj grpObj);

        int UpdateItems(BusinessEntitiesBS.ItemEntities.ItemObj updateitemObj, int itemid);
        DataTable SearchItems(string itemname, int catid);
        int removeItems(int itemid);

        DataTable SearchUsers(string uname);
        int UpdateUsers(BusinessEntitiesBS.UserEntities.userobj updateuserObj, int userid);

        DataTable SearchOrders(string value1, string value2);

        int checkLogin(string adminid, string pwd);

        DataTable getFeedback();
    }
}
