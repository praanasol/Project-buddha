using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessLogicBS.BusinessClasses
{
    public class ItemsClass:InterfacesBS.InterfacesBL.InterfaceItems
    {

        #region InterfaceItems Members

        public System.Data.DataSet getAllItems()
        {
            try
            {
                InterfacesBS.InterfacesDA.InterfaceItemsDA callDa = new DataAccessBS.ItemClasses.ItemsDA();
                return callDa.getItemCache();
            }
            catch
            {
                
                throw;
            }
                
        }

        #endregion
    }
}
