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
using BusinessLogicBS.BusinessClasses;

namespace budhashop.UserControls
{
    public partial class MainCartControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //IAdmin getItems = new AdminItems();
            //DataTable itemDT = getItems.getItems(3);
            //LoadItems(itemDT);
        }

        private void LoadItems(DataTable dtv)
        {
            if (dtv != null)
            {
                DataView dv = new DataView();
                PagedDataSource pagedData = new PagedDataSource();
                int rowCnt = dtv.Rows.Count;
                noOfItemsLbl.Text = rowCnt.ToString();
                dv = dtv.DefaultView;
                pagedData.DataSource = dv;
                //pagedData.AllowPaging = true;
                //pagedData.PageSize = 4;
                pagedData.CurrentPageIndex = 0;

                itemCartDL.DataSource = pagedData;
                itemCartDL.DataBind();
            }
            else
            {
                itemCartDL.DataSource = "";
                itemCartDL.DataBind();
            }
        }
    }
}