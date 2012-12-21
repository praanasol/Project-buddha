using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntitiesBS.ItemEntities
{
    public class ItemObj
    {
        public string itemName { get; set; }
        public string itemDesc { get; set; }
        public string itemImagePath { get; set; }
        public int itemCatagory { get; set; }
        public float itemBR { get; set; }
        public float itemNR { get; set; }
        public int itemQty { get; set; }
        public bool itemStatus { get; set; }
        public bool featuredFlag { get; set; }
        public string itemType { get; set; }
        public int itemSubCatId { get; set; }
        public int merchantId { get; set; }
    }
}
