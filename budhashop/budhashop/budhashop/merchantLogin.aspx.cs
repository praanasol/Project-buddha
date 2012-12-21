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

using InterfacesBS.InterfacesBL;
using BusinessLogicBS;
using BusinessLogicBS.UserClasses;

namespace budhashop
{
    public partial class merchantLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_mId.Focus();
        }

        protected void btn_mLogin_Click(object sender, EventArgs e)
        {
            string id = txt_mId.Text;
            string pwd = CLASS.PasswordEncryption.EncryptIt(txt_mPwd.Text);
            try
            {
                IUser checkmerchant = new UserItems();
                DataTable dt = checkmerchant.checkMerchant(id, pwd);
                if (dt != null)
                {
                    this.Session["MId"] = Convert.ToInt32(dt.Rows[0]["MId"]);
                    Response.Redirect("~/merchantprofile.aspx");
                }
                else
                {
                    lbl_mStatus.Text = HardCodedValues.BuddaResource.LoginFail;
                }
            }
            catch (Exception ex)
            {
                lbl_mStatus.Text = HardCodedValues.BuddaResource.CatchBlockError + ex.Message;
                throw ex;
            }
        }
    }
}
