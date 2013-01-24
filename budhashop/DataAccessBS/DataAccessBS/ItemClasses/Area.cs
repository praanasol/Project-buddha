using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using InterfacesBS.InterfacesDA;
using DataAccessBS.SupportedClasses;

namespace DataAccessBS.ItemClasses
{
    public class Area:IArea
    {
        #region IArea Members

        public System.Data.DataTable GetArea(int areaID)
        {
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = new SqlParameter("@cityID", areaID);
            return DBHelper.ExecuteDataset(DBCommon.ConnectionString, "USP_RETRIEVE_AREAS", sqlParams).Tables[0];
        }

        #endregion
    }
}
