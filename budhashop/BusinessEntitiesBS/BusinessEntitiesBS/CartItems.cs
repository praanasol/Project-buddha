using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BusinessEntitiesBS
{
    public class CartItems
    {
        private int itemId; 
        private int catId;
        private int qty;
        private bool grpChk;
        
        public int ItemId { get{ return itemId; } set { itemId = value; } }
        public int CatId { get { return catId; } set { catId = value; } }
        public int Qty { get { return qty; } set { qty = value; } }
        public bool GrpChk { get { return grpChk; } set { grpChk = value; } }
    }
}
