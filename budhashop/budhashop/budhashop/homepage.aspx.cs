﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.Services;
using System.Collections.Generic;
using BusinessEntitiesBS;

namespace budhashop
{
    public partial class homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet allDataDS = new DataSet();
            
            InterfacesBS.InterfacesBL.InterfaceItems allData = new BusinessLogicBS.BusinessClasses.ItemsClass();
            
            
            if (System.Web.HttpContext.Current.Cache["CacheItemsObj"] == null)
            {
                allDataDS = allData.getAllItems();
                System.Web.HttpContext.Current.Cache.Insert("CacheItemsObj", allDataDS, null, System.DateTime.Now.AddDays(1), System.Web.Caching.Cache.NoSlidingExpiration);
            }
            
           
        }
        

       
    }
}
