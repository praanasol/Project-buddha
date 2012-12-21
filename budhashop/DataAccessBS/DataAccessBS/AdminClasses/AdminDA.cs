using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

using System.Data;
using InterfacesBS.InterfacesDA;
using DataAccessBS.SupportedClasses;

namespace DataAccessBS.AdminClasses
{
    public class AdminDA:IAdminDA
    {

        #region IAdminDA Members insertCatagoryDA

        public int insertCatagoryDA(BusinessEntitiesBS.Catagory_Entities.catagoryObj catObjDa)
        {
            try
            {

                SqlParameter[] sqlParams = new SqlParameter[3];

                //Catgory parameters
                sqlParams[0] = new SqlParameter("@catagoryName", catObjDa.catagoryName);
                sqlParams[1] = new SqlParameter("@CatagoryDescription", catObjDa.catagoryDesc);
                sqlParams[2] = new SqlParameter("@catStatus", catObjDa.catagoryStatus);
                DataTable idcDt = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_INSERT_CATAGORY", sqlParams).Tables[0];
                int idCat = Convert.ToInt32(idcDt.Rows[0].ItemArray[0].ToString());

                if (idcDt.Rows.Count > 0)
                {
                    return idCat;
                }
                else
                {
                    return -1;
                }
            }
            catch(SqlException exc)
            {
                return -1;
                throw exc;
            }

        }

        #endregion

        #region IAdminDA Members getCatgValues


        public DataTable getCatgValues()
        {
            try
            {

               DataTable catDT = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_GET_CATAGORIES").Tables[0];

                if (catDT.Rows.Count > 0)
                {
                    return catDT;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IAdminDA Members insertSubCatagoryDA

        public int insertSubCatagoryDA(int catid, string subcatname)
        {
            try
            {

                SqlParameter[] sqlParams = new SqlParameter[2];

                //Catgory parameters
                sqlParams[0] = new SqlParameter("@catId", catid);
                sqlParams[1] = new SqlParameter("@subCatName", subcatname);
                int count = DBHelper.ExecuteNonQuery(DBCommon.ConnectionString, "USP_INSERT_SUBCATAGORY", sqlParams);
                return count;
            }
            catch (SqlException exc)
            {
                return -1;
                throw exc;
            }

        }

        #endregion

        #region IAdminDA Members Check Sub-Catagory Name

        public DataTable checkSubCatNameDA(string subcatname, int catid)
        {
            try
            {

                SqlParameter[] sqlParams = new SqlParameter[2];

                //Catgory parameters
                sqlParams[0] = new SqlParameter("@SubCatName", subcatname);
                sqlParams[1] = new SqlParameter("@CatId", catid);
                DataTable idcDt = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_GET_SUBCATAGORY", sqlParams).Tables[0];
                if (idcDt.Rows.Count > 0)
                {
                    return idcDt;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                throw;
            }

        }

        #endregion

        #region IAdminDA Members insertMerchantDA

        public int insertMerchantDA(BusinessEntitiesBS.merchantObj merchantValues)
        {
            try
            {
                SqlParameter[] sqlParams = new SqlParameter[6];
                //Merchant parameters
                sqlParams[0] = new SqlParameter("@name", merchantValues.mName);
                sqlParams[1] = new SqlParameter("@type", merchantValues.mType);
                sqlParams[2] = new SqlParameter("@address", merchantValues.mAddress);
                sqlParams[3] = new SqlParameter("@phno", merchantValues.mPhno);
                sqlParams[4] = new SqlParameter("@phno", merchantValues.mLoginId);
                sqlParams[5] = new SqlParameter("@phno", merchantValues.mPwd);
                int count = DBHelper.ExecuteNonQuery(DBCommon.ConnectionString, "USP_INSERT_MERCHANT", sqlParams);
                return count;
            }
            catch (SqlException exc)
            {
                return -1;
                throw exc;
            }

        }

        #endregion

        #region IAdminDA Members getMercahntsDA

        public DataTable getMerchantsDA()
        {
            try
            {
                DataTable merDt = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_GET_MERCHANTS").Tables[0];
                if (merDt.Rows.Count > 0)
                {
                    return merDt;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                throw;
            }

        }

        #endregion

        #region IAdminDA Members insertItemDA


        public int insertItemDA(BusinessEntitiesBS.ItemEntities.ItemObj itemObjDa)
        {
            try
            {

                SqlParameter[] sqlParams = new SqlParameter[10];

                //Catgory parameters
                sqlParams[0] = new SqlParameter("@itemName", itemObjDa.itemName);
                sqlParams[1] = new SqlParameter("@itemDescription", itemObjDa.itemDesc);
                sqlParams[2] = new SqlParameter("@catId", itemObjDa.itemCatagory);
                sqlParams[3] = new SqlParameter("@itemBR", itemObjDa.itemBR);
                sqlParams[4] = new SqlParameter("@itemNR", itemObjDa.itemNR);
                sqlParams[5] = new SqlParameter("@itemQty", itemObjDa.itemQty);
                sqlParams[6] = new SqlParameter("@itemSts", itemObjDa.itemStatus);
                sqlParams[7] = new SqlParameter("@itemType", itemObjDa.itemType);
                sqlParams[8] = new SqlParameter("@subCatId", itemObjDa.itemSubCatId);
                sqlParams[9] = new SqlParameter("@merchantId", itemObjDa.merchantId);

                DataTable idDt = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_INSERT_ITEMS", sqlParams).Tables[0];
                int returnedId = Convert.ToInt32(idDt.Rows[0].ItemArray[0].ToString());

               //string imgPath = "/ItemImages/" + itemObjDa.itemCatagory+"/"+returnedId+ "/" +returnedId+"small.jpg";

               //SqlParameter[] imgSqlParams = new SqlParameter[2];
               //imgSqlParams[0] = new SqlParameter("@itemID", returnedId);
               //imgSqlParams[1] = new SqlParameter("@itemImagePath", imgPath);
               
               // int retImgPth = DBHelper.ExecuteNonQuery(DBCommon.ConnectionString, "USP_INSERT_ITEM_IMAGEPATH", imgSqlParams);
              
                if (idDt.Rows.Count > 0)
                {
                    return returnedId;
                }
                else
                {
                    return -1;
                }
            }
            catch (SqlException exc)
            {
                return -1;
                throw exc;
            }
        }


        #endregion

        #region IAdminDA Members getItemValues


        public DataTable getItemValues(int grpCatId)
        {
            try
            {
                SqlParameter[] grpCatIdParams = new SqlParameter[1];
                grpCatIdParams[0] = new SqlParameter("@catID", grpCatId);

                DataTable itemDT = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_GET_ITEMS", grpCatIdParams).Tables[0];

                if (itemDT.Rows.Count > 0)
                {
                    return itemDT;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IAdminDA Members insertGrpDA


        public int insertGrpDA(BusinessEntitiesBS.GroupEntities.grpObj grpObjDa)
        {
            try
            {
                //long groupId = 0;
               
                SqlParameter[] sqlParams = new SqlParameter[9];

                //Catgory parameters
                sqlParams[0] = new SqlParameter("@grpName", grpObjDa.grpName);
                sqlParams[1] = new SqlParameter("@grpDesc", grpObjDa.grpDesc);
                sqlParams[2] = new SqlParameter("@grpSts", grpObjDa.grpStatus);
                sqlParams[3] = new SqlParameter("@grpBR", grpObjDa.grpBR);
                sqlParams[4] = new SqlParameter("@grpNR", grpObjDa.grpNR);
                sqlParams[5] = new SqlParameter("@grpChk", grpObjDa.fixedGrp);
                sqlParams[6] = new SqlParameter("@grpQty", grpObjDa.Quantity);
                sqlParams[7] = new SqlParameter("@separator", ",");
                sqlParams[8] = new SqlParameter("@Array", grpObjDa.itemIdStr);
                //sqlParams[9] = new SqlParameter("@GroupId", groupId);
                //sqlParams[9].Direction = ParameterDirection.Output;     

                DataTable idDt = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_INSERT_GROUP", sqlParams).Tables[0];
                int returnedId = Convert.ToInt32(idDt.Rows[0].ItemArray[0].ToString());

                
                if (idDt.Rows.Count > 0)
                {
                    return returnedId;
                }
                else
                {
                    return -1;
                }
            }
            catch (SqlException exc)
            {
                return -1;
                throw exc;
            }
        }

        #endregion

        #region IAdminDA Members UpdateItemDA


        public int UpdateItemDA(BusinessEntitiesBS.ItemEntities.ItemObj updateitemObjDa, int itemid)
        {
            try
            {

                SqlParameter[] sqlParams = new SqlParameter[12];

                //Catgory parameters
                sqlParams[0] = new SqlParameter("@itemId", itemid);
                sqlParams[1] = new SqlParameter("@itemName", updateitemObjDa.itemName);
                sqlParams[2] = new SqlParameter("@itemDescription", updateitemObjDa.itemDesc);
                sqlParams[3] = new SqlParameter("@catId", updateitemObjDa.itemCatagory);
                sqlParams[4] = new SqlParameter("@itemBR", updateitemObjDa.itemBR);
                sqlParams[5] = new SqlParameter("@itemNR", updateitemObjDa.itemNR);
                sqlParams[6] = new SqlParameter("@itemQty", updateitemObjDa.itemQty);
                sqlParams[7] = new SqlParameter("@itemSts", updateitemObjDa.itemStatus);
                sqlParams[8] = new SqlParameter("@featuredFlag", updateitemObjDa.featuredFlag);
                sqlParams[9] = new SqlParameter("@itemType", updateitemObjDa.itemType);
                sqlParams[10] = new SqlParameter("@subCatId", updateitemObjDa.itemSubCatId);
                sqlParams[11] = new SqlParameter("@merchantId", updateitemObjDa.merchantId);

                int updated = DBHelper.ExecuteNonQuery(DBCommon.ConnectionString, "USP_UPDATE_ITEMS", sqlParams);

                if (updated > 0)
                {
                    return updated;
                }
                else
                {
                    return -1;
                }
            }
            catch (SqlException exc)
            {
                return -1;
                throw exc;
            }
        }

        #endregion

        #region IAdminDA Members SearchItemsDA


        public DataTable SearchItemsDA(string itemname,int catid)
        {
            try
            {
                SqlParameter[] searchParams = new SqlParameter[2];
                searchParams[0] = new SqlParameter("@ItemName", itemname);
                searchParams[1] = new SqlParameter("@CatagoryId", catid);

                DataTable searchitemDT = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_SEARCH_ITEMS", searchParams).Tables[0];

                if (searchitemDT.Rows.Count > 0)
                {
                    return searchitemDT;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IAdminDA Members removeItemDA


        public int removeItemDA(int itemid)
        {
            try
            {
                SqlParameter[] sqlParams = new SqlParameter[1];

                sqlParams[0] = new SqlParameter("@itemId", itemid);
                int removed = DBHelper.ExecuteNonQuery(DBCommon.ConnectionString, "USP_REMOVE_ITEMS", sqlParams);

                if (removed == -1)
                {
                    return removed;
                }
                else
                {
                    return 1;
                }
            }
            catch (SqlException exc)
            {
                return -1;
                throw exc;
            }
        }

        #endregion

        #region IAdminDA Members SearchUsersDA


        public DataTable SearchUsersDA(string uname)
        {
            try
            {
                SqlParameter[] searchParams = new SqlParameter[1];
                searchParams[0] = new SqlParameter("@UserName", uname);

                DataTable searchuserDT = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_SEARCH_USERS", searchParams).Tables[0];

                if (searchuserDT.Rows.Count > 0)
                {
                    return searchuserDT;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IAdminDA Members UpdateItemDA


        public int UpdateUserDA(BusinessEntitiesBS.UserEntities.userobj updateuserObjDa, int userid)
        {
            try
            {

                SqlParameter[] sqlParams = new SqlParameter[7];

                //Catgory parameters
                sqlParams[0] = new SqlParameter("@uid", userid);
                sqlParams[1] = new SqlParameter("@username", updateuserObjDa.uname);
                sqlParams[2] = new SqlParameter("@pwd", updateuserObjDa.pwd);
                sqlParams[3] = new SqlParameter("@email", updateuserObjDa.emailid);
                sqlParams[4] = new SqlParameter("@phone", updateuserObjDa.phno);
                sqlParams[5] = new SqlParameter("@address", updateuserObjDa.address);
                sqlParams[6] = new SqlParameter("@actvsts", updateuserObjDa.userstatus);

                int updated = DBHelper.ExecuteNonQuery(DBCommon.ConnectionString, "USP_UPDATE_USERS", sqlParams);

                if (updated > 0)
                {
                    return updated;
                }
                else
                {
                    return -1;
                }
            }
            catch (SqlException exc)
            {
                return -1;
                throw exc;
            }
        }

        #endregion

        #region IAdminDA Members SearchOrdersDA


        public DataTable SearchOrdersDA(string value1,string value2)
        {
            try
            {
                SqlParameter[] searchParams = new SqlParameter[2];
                searchParams[0] = new SqlParameter("@Value1", value1);
                searchParams[1] = new SqlParameter("@Value2", value2);

                DataTable searchuserDT = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_SEARCH_ORDERS", searchParams).Tables[0];

                if (searchuserDT.Rows.Count > 0)
                {
                    return searchuserDT;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                throw;
            }
        }

        #endregion

        #region IAdminDA Members Check Admin Login

        public int checkLoginDA(string adminid, string pwd)
        {
            try
            {
                SqlParameter[] searchParams = new SqlParameter[2];
                searchParams[0] = new SqlParameter("@aname", adminid);
                searchParams[1] = new SqlParameter("@password", pwd);

                DataTable searchuserDT = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_CHECK_ADMIN", searchParams).Tables[0];

                if (searchuserDT.Rows.Count > 0)
                {
                    return searchuserDT.Rows.Count;
                }
                else
                {
                    return -1;
                }
            }
            catch
            {
                return -1;
                throw;
            }
        }

        #endregion

        #region IAdminDA Members getFeedback


        public DataTable getFeedbackDA()
        {
            try
            {
                DataTable feedbackDT = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_GET_SITE_FEEDBACK").Tables[0];

                if (feedbackDT.Rows.Count > 0)
                {
                    return feedbackDT;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                return null;
                throw;
            }
        }

        #endregion
    }
}
