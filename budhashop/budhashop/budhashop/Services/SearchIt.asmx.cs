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
    public class SearchIt : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<SearchAll> FetchItemNames()
        {
            //public List<BusinessLogicAutoRaksha.ServiceClasses.Area> FetchAreaNames(string areaString)
            var searchObj = new SearchAll();
            var fetchItems = (List<SearchAll>)null;
            if (System.Web.HttpContext.Current.Cache["CacheSearchObj"] == null)
            {
                fetchItems = searchObj.GetSearchList();
                System.Web.HttpContext.Current.Cache.Insert("CacheSearchObj", fetchItems, null, System.DateTime.Now.AddDays(1), System.Web.Caching.Cache.NoSlidingExpiration);
            }
            else
            {
                fetchItems = (List<SearchAll>)System.Web.HttpContext.Current.Cache["CacheSearchObj"];
            }
            //      var filteredAreas= fetchAreas.Where(m => m.AreaName.ToLower().Contains(areaString.ToLower()));
            return fetchItems.ToList();
        }
    }
}
