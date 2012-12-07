using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntitiesBS.UserEntities
{
    public class OrderItems
    {

        public int userid { get; set; }
        public string purchaseDate { get; set; }
        public string cartItems { get; set; }
        public string ShippingAdr { get; set; }
        public float totalBill { get; set; }
        public float totalNetBill { get; set; }
        public int totalItems { get; set; }
        public string TypeItem { get; set; }
    }
}
