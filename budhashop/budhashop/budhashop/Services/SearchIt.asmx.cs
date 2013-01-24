using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Web.Script.Services;
using budhashop.CLASS;
using System.Collections.Generic;

namespace budhashop.Services
{
    /// <summary>
    /// Summary description for SearchIt
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    internal class SearchIt : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<SearchAll> FetchItemNames()
        {
            //public List<BusinessLogicAutoRaksha.ServiceClasses.Area> FetchAreaNames(string areaString)
            var searchObj = new SearchAll();
            var fetchItems = (List<SearchAll>)null;
           // var items = (List<SearchAll>)null;
            

            fetchItems = searchObj.GetSearchList();//items.Where(str => str.SearchString.ToLower().Contains(prefixText.ToLower())); 
                
            //      var filteredAreas= fetchAreas.Where(m => m.AreaName.ToLower().Contains(areaString.ToLower()));
            return fetchItems.ToList();
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<SearchAll> FetchMerchantItemNames()
        {
            DataTable mdt = (DataTable)this.Session["MId"];
            int mId = Convert.ToInt32(mdt.Rows[0]["MId"].ToString());
            var searchObj = new SearchAll();
            var fetchItems = (List<SearchAll>)null;
            fetchItems = searchObj.GetItemsList(mId);
            return fetchItems.ToList();
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<BusinessLogicBS.ServiceClasses.Area> FetchAreaNames()
        {
            //public List<BusinessLogicAutoRaksha.ServiceClasses.Area> FetchAreaNames(string areaString)
            var area = new BusinessLogicBS.ServiceClasses.Area();
            var fetchAreas = (List<BusinessLogicBS.ServiceClasses.Area>)null;
            if (System.Web.HttpContext.Current.Cache["CacheAreasObj"] == null)
            {
                fetchAreas = area.GetAreaList();
                System.Web.HttpContext.Current.Cache.Insert("CacheAreasObj", fetchAreas, null, System.DateTime.Now.AddDays(10), System.Web.Caching.Cache.NoSlidingExpiration);
            }
            else
            {
                fetchAreas = (List<BusinessLogicBS.ServiceClasses.Area>)System.Web.HttpContext.Current.Cache["CacheAreasObj"];
            }
            //      var filteredAreas= fetchAreas.Where(m => m.AreaName.ToLower().Contains(areaString.ToLower()));
            return fetchAreas.ToList();
        }
    }
}
