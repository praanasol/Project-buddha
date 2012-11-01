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

namespace budhashop.USER
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["currentuser"] != null)
            {
                getOrders();

                DataSet allDataDS = new DataSet();

                InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();


                if (System.Web.HttpContext.Current.Cache["CacheItemsObj"] == null)
                {
                    allDataDS = allData.getAllItems();
                    System.Web.HttpContext.Current.Cache.Insert("CacheItemsObj", allDataDS, null, System.DateTime.Now.AddDays(1), System.Web.Caching.Cache.NoSlidingExpiration);
                }
            }
            else
            {
                Response.Redirect("~/homepage.aspx");
            }
        }

        protected void getOrders()
        {
            DataTable dt = (DataTable)this.Session["currentuser"];
            string userid = dt.Rows[0]["Uid"].ToString();
            try
            {
                BusinessLogicBS.UserClasses.UserItems getOrders = new BusinessLogicBS.UserClasses.UserItems();
                DataTable orderDT = getOrders.getUserOrders(userid);

                if (orderDT != null)
                {
                    orderGrid.DataSource = orderDT;
                    orderGrid.DataBind();
                }
                else
                {
                    //grpMsgLbl.Text = "No Data for items! change the catagory";
                    orderGrid.DataSource = null;
                    orderGrid.DataBind();
                }
            }
            catch (Exception iExp)
            {
                throw iExp;
            }
        }

        protected void orderGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            orderGrid.PageIndex = e.NewPageIndex;
            getOrders();
        }

        public class ItemDetails
        {
            public string ItemId { get; set; }
            public string ItemPath { get; set; }
            public string ItemName { get; set; }
            public string BilledRate { get; set; }

            public string ItemQty { get; set; }
            public string TotalRate { get; set; }
        }

        [WebMethod]
        public static ItemDetails[] GetOrderedItems(string itemString)
        {
            DataSet itemData = new DataSet();
            itemData = (DataSet)System.Web.HttpContext.Current.Cache["CacheItemsObj"];
            DataTable dt = itemData.Tables[0];
            DataTable dtg = itemData.Tables[1];

            List<ItemDetails> totalDetails = new List<ItemDetails>();

            var itemsArray = itemString.Split(';');
            for (var i = 0; i < itemsArray.Length - 1; i++)
            {
                var items = itemsArray[i].Split(',');
                int itemId = int.Parse(items[0].ToString());
                int qty = int.Parse(items[1].ToString());

                var itemDetails = dt.AsEnumerable().First(p => p.Field<long>("ItemId") == itemId);
                if (itemDetails == null)
                {
                    itemDetails = dtg.AsEnumerable().First(p => p.Field<long>("ItemId") == itemId);
                }

                if (itemDetails != null)
                {
                    ItemDetails details = new ItemDetails();
                    details.ItemId = itemDetails["ItemId"].ToString();
                    details.ItemPath = itemDetails["ImagePath"].ToString();
                    details.ItemName = itemDetails["ItemName"].ToString();
                    details.ItemQty = qty.ToString();
                    float blrte = float.Parse(itemDetails["BilledRate"].ToString());
                    details.BilledRate = blrte.ToString();
                    float totRate = qty * (float.Parse(itemDetails["BilledRate"].ToString()));
                    details.TotalRate = totRate.ToString(); ;

                    totalDetails.Add(details);
                }

            }
            return totalDetails.ToArray();
        }
    }
}
