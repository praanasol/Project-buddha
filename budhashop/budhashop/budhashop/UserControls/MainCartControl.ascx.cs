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
using System.Collections.Generic;
using BusinessEntitiesBS;

namespace budhashop.UserControls
{
    public partial class MainCartControl : System.Web.UI.UserControl
    {
        public List<CartItems> CartDetails;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CartPicks"] != null)
            {
                CartDetails = new List<CartItems>();
                CartDetails = (List<CartItems>)Session["CartPicks"];
                LoadItems(CartDetails);
            }
           
        }

        private void LoadItems(List<CartItems> Cartinfo)
        {
            DataTable dtv = new DataTable();
            InterfacesBS.InterfacesBL.InterfaceItems callCache = new ItemsClass();
            dtv = callCache.getAllItems().Tables[0];

            DataTable CartDT = new DataTable();//data to be bound to cart datalist
          

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