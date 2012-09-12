using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace InterfacesBS.InterfacesBL
{
    public interface InterfaceItems
    {
        DataSet getAllItems();
        DataSet getFeaturedItems();
    }
}
