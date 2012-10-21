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
        //public int ID { get; set; }
        public string value { get; set; }
        public string ItemLink { get; set; }

        public List<SearchAll> GetSearchList()
        {
            DataTable dt = new DataTable();
            DataTable dtg = new DataTable();
            
            //InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();
            budhashop.CLASS.CallCache callCache = new budhashop.CLASS.CallCache();

            DataSet allDataDS = callCache.getCache();
            dt = allDataDS.Tables[0];
            dtg = allDataDS.Tables[1];

            List<SearchAll> list = new List<SearchAll>();
            int cnt = dt.Rows.Count;
            for (int i = 0; i < cnt; i++)
            {
                // ProjectActivity prj = new ProjectActivity();
                SearchAll prj = new SearchAll();

                int id = int.Parse(dt.Rows[i]["ItemId"].ToString());
                int grp = int.Parse(dt.Rows[i]["CategoryId"].ToString());

                prj.value = dt.Rows[i]["ItemName"].ToString();
                prj.ItemLink = "iteminfo.aspx?id=" + id + "&grp=" + grp;
                //prj.ActualHours = int.Parse(dt.Rows[i]["ActualHours"].ToString());

                list.Add(prj);

            }
            int cnt2 = dtg.Rows.Count;
            for (int i = 0; i < cnt2; i++)
            {
                
                SearchAll prj2 = new SearchAll();

                int idg = int.Parse(dtg.Rows[i]["GroupId"].ToString());
                int grpg = 1;
                prj2.value = dtg.Rows[i]["GroupName"].ToString();
                prj2.ItemLink = "iteminfo.aspx?id=" + idg + "&grp=" + grpg; 
                

                list.Add(prj2);

            }

            return list.ToList();
        }
    }
}
