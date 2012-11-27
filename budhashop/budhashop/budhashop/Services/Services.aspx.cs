using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Web.Services;
using System.Collections.Generic;
using BusinessEntitiesBS;
using System.Web.Script.Services;
using budhashop.CLASS;
using InterfacesBS.InterfacesBL;
using BusinessLogicBS;
using BusinessLogicBS.BusinessClasses;

namespace budhashop.Services
{
    public partial class Services : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [WebMethod]
        public static string getCatName(string CatId)
        {
            DataTable catgDt = new DataTable();
            budhashop.CLASS.CallCache callCache = new budhashop.CLASS.CallCache();
            DataSet allDataDS = callCache.getCache();
            catgDt = allDataDS.Tables[3];

            var catItem = catgDt.AsEnumerable().First(p => p.Field<long>("CategoryId") == long.Parse(CatId));

            string catName = catItem["CategoryName"].ToString();

            return catName;
        }
        
        [WebMethod]
        public static CatDetails[] FetchCatNames()
        {
            DataTable catgDt = new DataTable();
            budhashop.CLASS.CallCache callCache = new budhashop.CLASS.CallCache();
            DataSet allDataDS = callCache.getCache();
            catgDt = allDataDS.Tables[3];
            
           

            List<CatDetails> details = new List<CatDetails>();

            foreach(DataRow dtrow in catgDt.Rows)
            {

                CatDetails user = new CatDetails();
                user.CatId = dtrow["CategoryId"].ToString();
                user.CatName = dtrow["CategoryName"].ToString();
               

                details.Add(user);

            }

            return details.ToArray();

        }

        [WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static ItemDetails[] SearchItemNames(string searchStr)
        {
           DataTable dt = new DataTable();
            DataTable dtg = new DataTable();
            List<ItemDetails> details = new List<ItemDetails>();
            //InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();
            budhashop.CLASS.CallCache callCache = new budhashop.CLASS.CallCache();

            DataSet allDataDS = callCache.getCache();
            dt = allDataDS.Tables[0];
            dtg = allDataDS.Tables[1];
            var cartItemgrp = dtg.AsEnumerable().Where(p => p.Field<string>("GroupName").ToLower().Contains(searchStr.ToLower())).ToList(); ;
            var cartItem = dt.AsEnumerable().Where(p => p.Field<string>("ItemName").ToLower().Contains(searchStr.ToLower())).ToList(); ;

            foreach (DataRow dtrow in cartItemgrp)
            {
  
                ItemDetails user = new ItemDetails();
                user.ItemId = dtrow["GroupId"].ToString();
                user.ItemName = dtrow["GroupName"].ToString();
               user.ItemDesc = dtrow["Description"].ToString();
               user.ItemPath = dtrow["ImagePath"].ToString();//change this to actual image path when done
                user.ItemPrice = dtrow["BilledRate"].ToString();
                user.ItemQty = dtrow["Qty"].ToString();
                user.CatId = "1";

                
                details.Add(user);

            }
            foreach (DataRow dtrow in cartItem)
            {

                 ItemDetails user = new ItemDetails();
                 user.ItemId = dtrow["ItemId"].ToString();
                 user.ItemName = dtrow["ItemName"].ToString();
                 user.ItemDesc = dtrow["Description"].ToString();
                 user.ItemPath = dtrow["ImagePath"].ToString();
                 user.ItemPrice = dtrow["BilledRate"].ToString();
                 user.ItemQty = dtrow["Qty"].ToString();
                 user.CatId = dtrow["CategoryId"].ToString();

                 details.Add(user);

            }

            return details.ToArray();
        
        }
       
        [WebMethod]
        public static ItemDetails[] BindGrptable()
        {
            DataTable dt = new DataTable();
            List<ItemDetails> details = new List<ItemDetails>();
            //InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();
            budhashop.CLASS.CallCache callCache = new budhashop.CLASS.CallCache();

            DataSet allDataDS = callCache.getCache();
            dt = allDataDS.Tables[1];

            foreach (DataRow dtrow in dt.Rows)
            {
               
                    ItemDetails user = new ItemDetails();
                    user.ItemId = dtrow["GroupId"].ToString();
                    user.ItemName = dtrow["GroupName"].ToString();
                    user.ItemPath = dtrow["ImagePath"].ToString();
                    user.ItemPrice = dtrow["BilledRate"].ToString();
                    user.CatId = "1";
                    details.Add(user);
                
            }

            return details.ToArray();
        }

        [WebMethod]
        public static ItemDetails[] BindDatatable()
        {
            DataTable dt = new DataTable();
            List<ItemDetails> details = new List<ItemDetails>();
            //InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();
            budhashop.CLASS.CallCache callCache = new budhashop.CLASS.CallCache();

            DataSet allDataDS = callCache.getCache();
            dt = allDataDS.Tables[0];

            foreach (DataRow dtrow in dt.Rows)
            {
                bool FeatureChk = bool.Parse(dtrow["FeaturedFlag"].ToString());
                //int category = int.Parse(dtrow["CategoryId"].ToString());
                if (FeatureChk)//&& category == int.Parse(CatgId)
                {
                    ItemDetails user = new ItemDetails();
                    user.ItemId = dtrow["ItemId"].ToString();
                    user.ItemPath = dtrow["ImagePath"].ToString();
                    user.ItemName = dtrow["ItemName"].ToString();
                    user.ItemPrice = dtrow["BilledRate"].ToString();
                    user.CatId = dtrow["CategoryId"].ToString();
                    details.Add(user);
                }
            }

            return details.ToArray();
        }

        [WebMethod]
        public static ItemDetails[] BindItemsData(string CatgId)
        {
            DataTable dt = new DataTable();
            List<ItemDetails> details = new List<ItemDetails>();
            //InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();
            budhashop.CLASS.CallCache callCache = new budhashop.CLASS.CallCache();

            DataSet allDataDS = callCache.getCache();
            dt = allDataDS.Tables[0];

            foreach (DataRow dtrow in dt.Rows)
            {
                
                int category = int.Parse(dtrow["CategoryId"].ToString());
                if (category == int.Parse(CatgId))
                {
                    ItemDetails user = new ItemDetails();
                    user.ItemId = dtrow["ItemId"].ToString();
                    user.ItemPath = dtrow["ImagePath"].ToString();
                    user.ItemName = dtrow["ItemName"].ToString();
                    user.ItemPrice = dtrow["BilledRate"].ToString();
                    user.CatId = dtrow["CategoryId"].ToString();
                    details.Add(user);
                }
            }

            return details.ToArray();
        }

        [WebMethod]
        public static ItemDetails[] itemInfo(string itemId, string grp)
        {
            DataTable dt = new DataTable();
            DataTable dtg = new DataTable();
            List<ItemDetails> details = new List<ItemDetails>();
            //InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();
            budhashop.CLASS.CallCache callCache = new budhashop.CLASS.CallCache();

            DataSet allDataDS = callCache.getCache();
            dt = allDataDS.Tables[0];
            dtg = allDataDS.Tables[1];
            int chk = Int32.Parse(grp.ToString());
            if (chk == 1)
            {
                var cartItem = dtg.AsEnumerable().First(p => p.Field<long>("GroupId") == long.Parse(itemId));
                ItemDetails user = new ItemDetails();
                user.ItemId = cartItem["GroupId"].ToString();
                user.ItemName = cartItem["GroupName"].ToString();
                user.ItemDesc = cartItem["Description"].ToString();
                user.ItemPath = cartItem["ImagePath"].ToString(); //change this to actual image path when done
                user.ItemPrice = cartItem["BilledRate"].ToString();
                user.ItemQty = cartItem["Qty"].ToString();
                user.CatId = "1";

                

                details.Add(user);

            }
            else
            {
                var cartItem = dt.AsEnumerable().First(p => p.Field<long>("ItemId") == long.Parse(itemId));
                ItemDetails user = new ItemDetails();
                user.ItemId = cartItem["ItemId"].ToString();
                user.ItemName = cartItem["ItemName"].ToString();
                user.ItemDesc = cartItem["Description"].ToString();
                user.ItemPath = cartItem["ImagePath"].ToString();
                user.ItemPrice = cartItem["BilledRate"].ToString();
                user.ItemQty = cartItem["Qty"].ToString();
                user.CatId = cartItem["CategoryId"].ToString();

                details.Add(user);

            }

            return details.ToArray();
        }


        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static bool SetSessionValue(string ID, int Type)
        {
            string Name = "CartPicks";
            //string sessionVal = String.Empty;
            List<CartItems> cartItems = new List<CartItems>();


            if (HttpContext.Current.Session[Name] != null)
            {
                try
                {
                    cartItems = (List<CartItems>)HttpContext.Current.Session[Name];
                    CartItems newItem = new CartItems();
                    bool hasItem = cartItems.Any(c => c.ItemId == int.Parse(ID));
                    if (!hasItem)
                    {
                        newItem.ItemId = int.Parse(ID);

                        if (Type == 0)
                        {
                            newItem.CatId = 1;
                            newItem.GrpChk = true;
                        }
                        else
                        {
                            //if (Type == 3)
                            //{
                            //    newItem.CatId = 3;
                            //}
                            //else
                            //{
                            //    newItem.CatId = 5;
                            //}
                            newItem.CatId = Type;
                            newItem.GrpChk = false;
                        }
                        newItem.Qty = 1;
                        cartItems.Add(newItem);


                        HttpContext.Current.Session[Name] = cartItems;

                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch
                {
                    return false;
                    throw;
                }
            }
            else
            {

                return false;
            }
        }
        public class ItemDetails
        {
            public string ItemId { get; set; }
            public string ItemPath { get; set; }
            public string ItemName { get; set; }
            public string ItemPrice { get; set; }
            public string ItemDesc { get; set; }
            public string ItemQty { get; set; }
            public string CatId { get; set; }
        }

        public class CatDetails
        {
            public string CatId { get; set; }
            public string CatName { get; set; }
        }

       
    }
}
