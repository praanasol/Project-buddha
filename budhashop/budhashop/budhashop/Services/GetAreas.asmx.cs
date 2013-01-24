using System.Collections.Generic;
using System.Linq;
using System.Web.Services;
using BusinessLogicBS;
using System.Web.Script.Services;

namespace budhashop.Services
{
    /// <summary>
    /// Summary description for GetAreas
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class GetAreas : System.Web.Services.WebService
    {
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
