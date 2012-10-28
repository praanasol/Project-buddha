using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace budhashop.CLASS
{
    internal class CallCache
    {
        DataSet allDataDS;

        internal DataSet getCache()
        {
            allDataDS = new DataSet();

            InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();


            if (System.Web.HttpContext.Current.Cache["CacheItemsObj"] == null)
            {
                allDataDS = allData.getAllItems();
                System.Web.HttpContext.Current.Cache.Insert("CacheItemsObj", allDataDS, null, System.DateTime.Now.AddDays(1), System.Web.Caching.Cache.NoSlidingExpiration);
                return allDataDS;
            }
            else
            {

                allDataDS = (DataSet)System.Web.HttpContext.Current.Cache["CacheItemsObj"];
                return allDataDS;
            }


        }
    }
}
