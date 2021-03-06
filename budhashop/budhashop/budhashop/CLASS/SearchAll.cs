﻿using System;
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
    internal class SearchAll
    {
        //public int ID { get; set; }
        public string value { get; set; }
        public string ItemLink { get; set; }
        public int ItemId { get; set; }

        internal List<SearchAll> GetSearchList()
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
                prj.ItemLink = "../fulldetails.aspx?id=" + id + "&grp=" + grp;
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
                prj2.ItemLink = "../fulldetails.aspx?id=" + idg + "&grp=" + grpg; 
                

                list.Add(prj2);

            }

            return list.ToList();
        }

        internal List<SearchAll> GetItemsList(int mId)
        {
            List<SearchAll> list = new List<SearchAll>();
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
            DataRow[] dr = itemData.Tables[0].Select("MId = '" + mId + "'");
            if (dr.Length > 0)
            {
                foreach (DataRow dtr in dr)
                {
                    SearchAll prj = new SearchAll();
                    prj.ItemId = Convert.ToInt32(dtr["ItemId"].ToString());
                    prj.value = dtr["ItemName"].ToString();
                    list.Add(prj);
                }
            }
            return list.ToList();
        }
    }
}
