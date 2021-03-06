﻿using System;
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

namespace budhashop.UserControls
{
    public partial class login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_emailid1.Attributes.Add("onkeypress", "return controlEnter('" + btn_login1.ClientID + "', event)");
            txt_pwd1.Attributes.Add("onkeypress", "return controlEnter('" + btn_login1.ClientID + "', event)");
            //if (this.Session["currentuser"] != null)
            //{
            //    DataTable dt = (DataTable)this.Session["currentuser"];
            //    logintext.Text = dt.Rows[0]["Email"].ToString();
            //}
            //else
            //{
            //    logintext.Text = "LogIn";
            //}
        }

        protected void lb_logout_Click(object sender, EventArgs e)
        {
            this.Session["currentuser"] = null;
            lbl_result1.Text = "";
            //logintext.Text = "LogIn";
            Response.Redirect("~/homepage.aspx");
        }

        protected void lb_profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER/ProfilePage.aspx");
        }

        protected void lb_orderhistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER/ProfilePage.aspx");
        }

    }
}