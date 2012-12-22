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
                int mId = Convert.ToInt32(this.Session["MId"]);
                retrieveMerchant(mId);
            }
            else
            {
                Response.Redirect("../Merchant/login.aspx");
            }
        }

        private void retrieveMerchant(int mId)
        {
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
            int mId = Convert.ToInt32(this.Session["MId"]);
            retrieveMerchant(mId);
        }

        protected void lb_mlogout_Click(object sender, EventArgs e)
        {
            this.Session["MId"] = null;
            Response.Redirect("../Merchant/login.aspx");
        }
    }
}
