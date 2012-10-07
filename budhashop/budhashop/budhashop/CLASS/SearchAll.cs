using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;

namespace budhashop.CLASS
{
    public class SearchAll
    {
        public int ID { get; set; }
        
        public string ItemName { get; set; }

        public List<SearchAll> GetSearchList()
        {
            DataTable dt = new DataTable();
            DataTable dtg = new DataTable();
            
            InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();
            DataSet allDataDS = allData.getAllItems();
            dt = allDataDS.Tables[0];
            dtg = allDataDS.Tables[1];

            List<SearchAll> list = new List<SearchAll>();
            int cnt = dt.Rows.Count;
            for (int i = 0; i < cnt; i++)
            {
                // ProjectActivity prj = new ProjectActivity();
                SearchAll prj = new SearchAll();

               // prj.ID = int.Parse(dt.Rows[i]["ItemId"].ToString());
               
                prj.ItemName = dt.Rows[i]["ItemName"].ToString();
                //prj.ActualHours = int.Parse(dt.Rows[i]["ActualHours"].ToString());

                list.Add(prj);

            }
            int cnt2 = dtg.Rows.Count;
            for (int i = 0; i < cnt2; i++)
            {
                
                SearchAll prj = new SearchAll();

                prj.ID = int.Parse(dtg.Rows[i]["GroupId"].ToString());

                prj.ItemName = dtg.Rows[i]["GroupName"].ToString();
                

                list.Add(prj);

            }

            return list.ToList();
        }
    }
}
