using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using InterfacesBS.InterfacesDA;
using InterfacesBS.InterfacesBL;


namespace BusinessLogicBS.BusinessClasses
{
    public class AdminItems : IAdmin
    {

        #region IAdmin Members insertCatagory

        public int insertCatagory(BusinessEntitiesBS.Catagory_Entities.catagoryObj catObj)
        {
            try
            {

                IAdminDA catInsert = new DataAccessBS.AdminClasses.AdminDA();
                int catChk = catInsert.insertCatagoryDA(catObj);
                return catChk;
            }
            catch
            {
                return -1;
            }
        }

        #endregion

        #region IAdmin Members getCatagories


        public DataTable getCatagories()
        {
            DataTable catDS = new DataTable();

            IAdminDA getCatg = new DataAccessBS.AdminClasses.AdminDA();
            catDS = getCatg.getCatgValues();
       
            if (catDS.Rows.Count > 0)
            {
                return catDS;                
            }
            else
            {
                return null;
            }
        }

        #endregion

        #region IAdmin Members insertItems


        public int insertItems(BusinessEntitiesBS.ItemEntities.ItemObj itemObj)
        {

            IAdminDA itemValues = new DataAccessBS.AdminClasses.AdminDA();

            int itemId = itemValues.insertItemDA(itemObj);
            return itemId;
            
        }

        #endregion

        #region IAdmin Members getItems


        public DataTable getItems(int grpCatId)
        {
            try
            {

                IAdminDA itemValues = new DataAccessBS.AdminClasses.AdminDA();
                return itemValues.getItemValues(grpCatId);
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IAdmin Members insertGroup


        public int insertGroup(BusinessEntitiesBS.GroupEntities.grpObj grpObj)
        {
            IAdminDA inertGrp = new DataAccessBS.AdminClasses.AdminDA();
            return inertGrp.insertGrpDA(grpObj);

        }

        #endregion

        #region IAdmin Members UpdateItems


        public int UpdateItems(BusinessEntitiesBS.ItemEntities.ItemObj updateitemObj, int itemid)
        {

            IAdminDA UpdateItemValues = new DataAccessBS.AdminClasses.AdminDA();

            int updateitemId = UpdateItemValues.UpdateItemDA(updateitemObj, itemid);
            return updateitemId;

        }

        #endregion

        #region IAdmin Members SearchItems

        public DataTable SearchItems(string itemname,int catid)
        {
            try
            {

                IAdminDA searchitemValues = new DataAccessBS.AdminClasses.AdminDA();
                return searchitemValues.SearchItemsDA(itemname,catid);
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IAdmin Members removeItems


        public int removeItems(int itemid)
        {
            IAdminDA RemoveItemValues = new DataAccessBS.AdminClasses.AdminDA();

            int removeitem = RemoveItemValues.removeItemDA(itemid);
            return removeitem;
        }

        #endregion

        #region IAdmin Members SearchUsers

        public DataTable SearchUsers(string uname)
        {
            try
            {

                IAdminDA searchuserValues = new DataAccessBS.AdminClasses.AdminDA();
                return searchuserValues.SearchUsersDA(uname);
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IAdmin Members UpdateItems


        public int UpdateUsers(BusinessEntitiesBS.UserEntities.userobj updateuserObj, int userid)
        {

            IAdminDA UpdateUserValues = new DataAccessBS.AdminClasses.AdminDA();
            int updateuserId = UpdateUserValues.UpdateUserDA(updateuserObj, userid);
            return updateuserId;

        }

        #endregion

        #region IAdmin Members SearchOrders

        public DataTable SearchOrders(string value1, string value2)
        {
            try
            {

                IAdminDA searchorder = new DataAccessBS.AdminClasses.AdminDA();
                return searchorder.SearchOrdersDA(value1, value2);
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IAdmin Members Check Admin Login

        public int checkLogin(string adminid, string pwd)
        {
            try
            {

                IAdminDA login = new DataAccessBS.AdminClasses.AdminDA();
                return login.checkLoginDA(adminid, pwd);
            }
            catch
            {
                return -1;
                throw;
            }
        }

        #endregion
    }
}
