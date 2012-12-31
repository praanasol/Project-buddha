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

namespace budhashop.Merchant
{
    public partial class profilepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["MId"] != null)
            {
                if (!IsPostBack)
                {
                    getMerchantItems();
                    retrieveMerchant();
                    BindLowItems();
                }
                else
                {
                    lbl_itemSts.Text = "";
                    lbl_search.Text = "";
                }
            }
            else
            {
                Response.Redirect("../Merchant/login.aspx");
            }
        }

        private void retrieveMerchant()
        {
            int mId = Convert.ToInt32(this.Session["MId"]);
            InterfacesBS.InterfacesBL.IUser getmerchant = new BusinessLogicBS.UserClasses.UserItems();
            DataSet merchantDS = getmerchant.getMerchant(mId);
            DataTable dt = merchantDS.Tables[0];
            if (dt != null)
            {
                txt_mName.Text = dt.Rows[0]["MName"].ToString();
                txt_mType.Text = dt.Rows[0]["MType"].ToString();
                txt_mAddress.Text = dt.Rows[0]["MAddress"].ToString();
                txt_mPhno.Text = dt.Rows[0]["MPhNo"].ToString();

                DataTable merchantOrderDt = merchantDS.Tables[1];
                //merchantOrderDt.DefaultView.Sort = "Date Desc";
                if (merchantOrderDt != null)
                {
                    merchantOrderDt.Columns.Add("ItemName");
                    merchantOrderDt.Columns.Add("ImagePath");
                    foreach (DataRow dr in merchantOrderDt.Rows)
                    {
                        int itemId = Convert.ToInt32(dr["ItemId"]);
                        DataSet itemData = new DataSet();
                        if (System.Web.HttpContext.Current.Cache["CacheItemsObj"] == null)
                        {
                            CLASS.CallCache getcache = new budhashop.CLASS.CallCache();
                            itemData = getcache.getCache();
                        }
                        else
                        {
                            itemData = (DataSet)System.Web.HttpContext.Current.Cache["CacheItemsObj"];
                        }
                        var itemDetails = itemData.Tables[0].AsEnumerable().First(p => p.Field<long>("ItemId") == itemId);
                        dr["ItemName"] = itemDetails["ItemName"].ToString();
                        dr["ImagePath"] = itemDetails["ImagePath"].ToString();
                    }
                }
                gv_MerchantOrders.DataSource = merchantOrderDt;
                gv_MerchantOrders.DataBind();
            }
            else
            {
                Response.Redirect("../Merchant/login.aspx");
            }
        }

        protected void gv_MerchantOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_MerchantOrders.PageIndex = e.NewPageIndex;
            retrieveMerchant();
        }

        protected void lb_mlogout_Click(object sender, EventArgs e)
        {
            this.Session["MId"] = null;
            Response.Redirect("../Merchant/login.aspx");
        }

        private void getMerchantItems()
        {
            int mId = Convert.ToInt32(this.Session["MId"]);
            DataSet itemData = new DataSet();
            if (System.Web.HttpContext.Current.Cache["CacheItemsObj"] == null)
            {
                CLASS.CallCache getcache = new budhashop.CLASS.CallCache();
                itemData = getcache.getCache();
            }
            else
            {
                itemData = (DataSet)System.Web.HttpContext.Current.Cache["CacheItemsObj"];
            }
            DataTable dt = itemData.Tables[0];
            DataRow[] merchantItems = dt.Select("MId = '" + mId + "'");
            DataTable merchantItemsDt = null;
            if (merchantItems.Length > 0)
            {
                merchantItemsDt = merchantItems.CopyToDataTable();
            }
            itemGrid.DataSource = merchantItemsDt;
            itemGrid.DataBind();
        }

        protected void itemGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            itemGrid.PageIndex = e.NewPageIndex;
            getMerchantItems();
        }

        protected void itemGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            itemGrid.EditIndex = -1;
            getMerchantItems();
        }

        protected void itemGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            itemGrid.EditIndex = e.NewEditIndex;
            getMerchantItems();
        }

        protected void itemGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int itemid = Convert.ToInt32(itemGrid.DataKeys[e.RowIndex].Value.ToString());

            float itemBR = float.Parse(((TextBox)itemGrid.Rows[e.RowIndex].FindControl("txt_editBR")).Text);
            int itemQty = Int32.Parse(((TextBox)itemGrid.Rows[e.RowIndex].FindControl("txt_editQty")).Text);
            float itemNR = float.Parse(((TextBox)itemGrid.Rows[e.RowIndex].FindControl("txt_editNR")).Text);
            try
            {
                InterfacesBS.InterfacesBL.IUser updateItems = new BusinessLogicBS.UserClasses.UserItems();
                bool isupdated = updateItems.updateMerchantItems(itemid, itemBR, itemQty, itemNR);
                if (isupdated == true)
                {
                    lbl_itemSts.Text = HardCodedValues.BuddaResource.UpdateSuccess;
                    ClearCache();
                    itemGrid.EditIndex = -1;
                    getMerchantItems();
                    BindLowItems();
                }
                else
                {
                    lbl_itemSts.Text = HardCodedValues.BuddaResource.UpdateFail;
                }
            }
            catch (Exception ex)
            {
                lbl_itemSts.Text = HardCodedValues.BuddaResource.CatchBlockError + ex.Message;
                throw ex;
            }
        }

        private void ClearCache()
        {
            System.Web.HttpContext.Current.Cache.Remove("CacheItemsObj");
        }

        private void BindLowItems()
        {
            int filterQty = 5;//to display items with Quantity<5
            DataTable dt = (DataTable)itemGrid.DataSource;
            DataTable lowItemsTable = null;
            if (dt != null)
            {
                DataRow[] dr = dt.Select("Qty < '" + filterQty + "'");
                if (dr.Length > 0)
                {
                    lowItemsTable = dr.CopyToDataTable();
                }
            }
            gv_lowItems.DataSource = lowItemsTable;
            gv_lowItems.DataBind();
        }

        protected void gv_lowItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_lowItems.PageIndex = e.NewPageIndex;
            BindLowItems();
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            txt_search.Text = "";
            hdn_itemId.Value = "0";
            searchOrders();
        }

        protected void btn_search1_Click(object sender, EventArgs e)
        {
            if (hdn_itemId.Value != "0" && txt_search.Text != "")
            {
                searchOrders();
            }
            else
            {
                lbl_search.Text = "Please Select Items from list";
            }
        }

        private void searchOrders()
        {
            int mId = Convert.ToInt32(this.Session["MId"]);
            string startDate = txt_datepick1.Text;
            string endDate = txt_datepick2.Text;
            int itemIdSearched = Convert.ToInt32(hdn_itemId.Value);
            try
            {
                InterfacesBS.InterfacesBL.IUser searchOrders = new BusinessLogicBS.UserClasses.UserItems();
                DataTable merchantOrderDt = searchOrders.searchMerchantOrders(mId, itemIdSearched, startDate, endDate);
                if (merchantOrderDt != null)
                {
                    merchantOrderDt.Columns.Add("ItemName");
                    merchantOrderDt.Columns.Add("ImagePath");
                    foreach (DataRow dr in merchantOrderDt.Rows)
                    {
                        int itemId = Convert.ToInt32(dr["ItemId"]);
                        DataSet itemData = new DataSet();
                        if (System.Web.HttpContext.Current.Cache["CacheItemsObj"] == null)
                        {
                            CLASS.CallCache getcache = new budhashop.CLASS.CallCache();
                            itemData = getcache.getCache();
                        }
                        else
                        {
                            itemData = (DataSet)System.Web.HttpContext.Current.Cache["CacheItemsObj"];
                        }
                        var itemDetails = itemData.Tables[0].AsEnumerable().First(p => p.Field<long>("ItemId") == itemId);
                        dr["ItemName"] = itemDetails["ItemName"].ToString();
                        dr["ImagePath"] = itemDetails["ImagePath"].ToString();
                    }
                    searchDiv.Visible = false;
                    btn_refresh.Visible = true;
                }
                gv_MerchantOrders.Visible = false;
                gv_MerchantOrdersSearch.DataSource = merchantOrderDt;
                gv_MerchantOrdersSearch.DataBind();
                hdn_itemId.Value = "0";
            }
            catch (Exception ex)
            {
                lbl_search.Text = HardCodedValues.BuddaResource.CatchBlockError + ex.Message;
            }
        }

        protected void gv_MerchantOrdersSearch_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_MerchantOrdersSearch.PageIndex = e.NewPageIndex;
            searchOrders();
        }

        protected void btn_refresh_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void btn_ClearCache_Click(object sender, EventArgs e)
        {
            System.Web.HttpContext.Current.Cache.Remove("CacheItemsObj");
            Response.Redirect(Request.RawUrl);
        }
    }
}
