using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataAccessBS.SupportedClasses;

namespace DataAccessBS.ItemClasses
{
    public class ItemsDA : InterfacesBS.InterfacesDA.InterfaceItemsDA
    {
        #region InterfaceItemsDA Members

        public System.Data.DataSet getItemCache()
        {
            try
            {
                DataSet allListDS = DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_GET_ITEMS_FOR_CACHE");
                if (allListDS.Tables.Count > 0)
                {
                    return allListDS;
                }
                else return null;
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
