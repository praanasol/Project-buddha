using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.ServiceModel.Activation;

using System.Data;
using budhashop.CLASS;


namespace budhashop.Services
{
    // NOTE: If you change the class name "searchItems" here, you must also update the reference to "searchItems" in Web.config.
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class searchItems : IsearchItems
    {
        
        public List<SearchAll> GetModels(string model)
        {

            // Data access here to retrieve data for autocomplete box then convert to list
            var searchObj = new SearchAll();
            var fetchItems = (List<SearchAll>)null;

            fetchItems = searchObj.GetSearchList();

            //      var filteredAreas= fetchAreas.Where(m => m.AreaName.ToLower().Contains(areaString.ToLower()));

            List<SearchAll> List = fetchItems.ToList();
            // or however you get the data into list format
            
            return List;
        }

    }
}
