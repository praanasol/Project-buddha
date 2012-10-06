using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.ServiceModel.Activation;
using budhashop.CLASS;

namespace budhashop.Services
{
    // NOTE: If you change the interface name "IsearchItems" here, you must also update the reference to "IsearchItems" in Web.config.
    [ServiceContract(Namespace = "GetAutoCompleteService")]
    
    public interface IsearchItems
    {
        [OperationContract]
        List<SearchAll> GetModels(string model);
    }
}
