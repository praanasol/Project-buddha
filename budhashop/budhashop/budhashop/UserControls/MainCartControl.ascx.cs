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
         if (!IsPostBack)
         {
            if (Session["CartPicks"] != null)
            {
                CartDetails = new List<CartItems>();
                CartDetails = (List<CartItems>)Session["CartPicks"];
             
                LoadItems(CartDetails);
            }
          }
           
         }

        private void LoadItems(List<CartItems> Cartinfo)
        {

            DataTable CartDT = new DataTable();//data to be bound to cart datalist
            DataColumn dcId = new DataColumn("ItemId", typeof(int));
            CartDT.Columns.Add(dcId);
            DataColumn dcPath = new DataColumn("ImagePath", typeof(string));
            CartDT.Columns.Add(dcPath);
            DataColumn dcNme = new DataColumn("ItemName", typeof(string));
            CartDT.Columns.Add(dcNme);
            DataColumn dcQy = new DataColumn("Qty", typeof(int));
            CartDT.Columns.Add(dcQy);
            DataColumn dcBr = new DataColumn("BilledRate", typeof(float));
            CartDT.Columns.Add(dcBr);
            DataColumn dcTr = new DataColumn("TotalRate", typeof(float));
            CartDT.Columns.Add(dcTr);

            DataTable dtv = new DataTable();
            InterfacesBS.InterfacesBL.InterfaceItems callCache = new ItemsClass();
            dtv = callCache.getAllItems().Tables[0];
            //create cache for group items and store here and loop throuh groups if groupChk is true in session list


            foreach (object cartObj in Cartinfo)
            {
                CartItems item = cartObj as CartItems;
                int cid = item.ItemId;
                int qty = item.Qty;
                bool grpId = item.GrpChk;

                foreach (DataRow dRow in dtv.Rows)
                {
                    if((int.Parse(dRow["ItemId"].ToString()) == cid))
                    {
                        DataRow dr = CartDT.NewRow();
                        dr[0] = int.Parse(dRow["ItemId"].ToString());
                        dr[1] = dRow["ImagePath"].ToString();
                        dr[2] = dRow["ItemName"].ToString();
                        dr[3] = qty;
                        dr[4] = float.Parse(dRow["BilledRate"].ToString());
                        float totRate = qty * (float.Parse(dRow["BilledRate"].ToString()));
                        dr[5] = totRate;

                        CartDT.Rows.Add(dr);
                    }

                }
              

            }
            if (CartDT != null)
            {
                DataView dv = new DataView();
                PagedDataSource pagedData = new PagedDataSource();
                int rowCnt = CartDT.Rows.Count;
                noOfItemsLbl.Text = rowCnt.ToString();
                dv = CartDT.DefaultView;
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