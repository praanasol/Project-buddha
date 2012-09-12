using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntitiesBS
{
    public class CartItems
    {
        public string ItemId { get; set; }
        public string CatId { get; set; }
        public int Qty { get; set; }
        public bool GrpChk { get; set; }
    }
}
