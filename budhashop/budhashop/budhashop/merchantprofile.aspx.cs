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

namespace budhashop
{
    public partial class merchantprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["MId"] != null)
            {
                int mId = Convert.ToInt32(this.Session["MId"]);
                retrieveMerchant(mId);
                retriveMerchantOrders(mId);
            }
            else
            {
                Response.Redirect("~/merchantLogin.aspx");
            }
        }

        private void retrieveMerchant(int mId)
        {
            InterfacesBS.InterfacesBL.IUser getmerchant = new BusinessLogicBS.UserClasses.UserItems();
            DataTable dt = getmerchant.getMerchant(mId);
            if (dt != null)
            {
                txt_mName.Text = dt.Rows[0]["MName"].ToString();
                txt_mType.Text = dt.Rows[0]["MType"].ToString();
                txt_mAddress.Text = dt.Rows[0]["MAddress"].ToString();
                txt_mPhno.Text = dt.Rows[0]["MPhNo"].ToString();
            }
            else
            {
                Response.Redirect("~/merchantLogin.aspx");
            }
        }

        private void retriveMerchantOrders(int mId)
        {
            DataTable merchantOrderDt = new DataTable();
            merchantOrderDt.Columns.Add("ItemId");
            merchantOrderDt.Columns.Add("Qty");
            merchantOrderDt.Columns.Add("Date", typeof(DateTime));

            DataSet itemData = new DataSet();
            if (System.Web.HttpContext.Current.Cache["CacheItemsObj"] == null)
            {
                InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();
                itemData = allData.getAllItems();
            }
            else
            {
                itemData = (DataSet)System.Web.HttpContext.Current.Cache["CacheItemsObj"];
            }
            DataTable dt = itemData.Tables[0];

            InterfacesBS.InterfacesBL.IUser getOrders = new BusinessLogicBS.UserClasses.UserItems();
            DataTable orderDt = getOrders.getMerchantOrders();

            foreach (DataRow dr in dt.Rows)
            {
                string itemMId = dr["MId"].ToString();
                if (itemMId == mId.ToString())
                {
                    string itemId = dr["ItemId"].ToString();
                    if (orderDt != null)
                    {
                        foreach (DataRow dtr in orderDt.Rows)
                        {
                            if (itemId == dtr["ItemId"].ToString())
                            {
                                DataRow dtrow = merchantOrderDt.NewRow();
                                dtrow["ItemId"] = dtr["ItemId"];
                                dtrow["Qty"] = dtr["Qty"];
                                dtrow["Date"] = dtr["Date"];
                                merchantOrderDt.Rows.Add(dtrow);
                            }
                        }
                    }
                }
            }
            merchantOrderDt.DefaultView.Sort = "Date Desc";
            gv_MerchantOrders.DataSource = merchantOrderDt;
            gv_MerchantOrders.DataBind();
        }

        protected void gv_MerchantOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_MerchantOrders.PageIndex = e.NewPageIndex;
            int mId = Convert.ToInt32(this.Session["MId"]);
            retriveMerchantOrders(mId);
        }

        protected void lb_mlogout_Click(object sender, EventArgs e)
        {
            this.Session["MId"] = null;
            Response.Redirect("~/merchantLogin.aspx");
        }
    }
}
