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

namespace budhashop.ADMIN
{
    public partial class EditUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private void searchDT(string uname)
        {
            try
            {
                IAdmin searchusername = new AdminItems();
                DataTable searchuserDT = searchusername.SearchUsers(uname);
                if (searchuserDT != null)
                {
                    userGrid.DataSource = searchuserDT;
                    userGrid.DataBind();
                    lbl_status.Text = "";
                }
                else
                {
                    lbl_status.Text = "No Users Found, Enter Existing User Name";
                    userGrid.DataSource = null;
                    userGrid.DataBind();
                }
            }
            catch (Exception iExp)
            {
                lbl_status.Text = "Error Occured: " + iExp.Message;
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            searchDT(txt_username.Text);
        }

        protected void userGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            userGrid.EditIndex = e.NewEditIndex;
            searchDT(txt_username.Text);
        }

        protected void userGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int userid = Convert.ToInt32(userGrid.DataKeys[e.RowIndex].Value.ToString());
            string username = userGrid.DataKeys[e.RowIndex].Values["UserName"].ToString();
            string password = userGrid.DataKeys[e.RowIndex].Values["PWD"].ToString();
            TextBox newpassword = (TextBox)userGrid.Rows[e.RowIndex].FindControl("txt_editpwd");
            TextBox emailid = (TextBox)userGrid.Rows[e.RowIndex].FindControl("txt_editemailid");
            TextBox phno = (TextBox)userGrid.Rows[e.RowIndex].FindControl("txt_editphno");
            TextBox address = (TextBox)userGrid.Rows[e.RowIndex].FindControl("txt_editaddress");
            CheckBox userstatus = (CheckBox)userGrid.Rows[e.RowIndex].FindControl("cb_editactvsts");

            string encryptedpwd;
            if (password == newpassword.Text)
            {
                encryptedpwd = newpassword.Text;
            }
            else
            {
                encryptedpwd = CLASS.PasswordEncryption.EncryptIt(newpassword.Text);
            }

            BusinessEntitiesBS.UserEntities.userobj UpdateUserObj=new BusinessEntitiesBS.UserEntities.userobj();
            UpdateUserObj.uname=username;
            UpdateUserObj.pwd = encryptedpwd;
            UpdateUserObj.emailid=emailid.Text;
            UpdateUserObj.phno=phno.Text;
            UpdateUserObj.address=address.Text;
            UpdateUserObj.userstatus=userstatus.Checked;

            IAdmin UpdateUsers = new AdminItems();
            int updated = UpdateUsers.UpdateUsers(UpdateUserObj, userid);
            if (updated != -1)
            {
                lbl_status.Text = "Updated Successfully";
                userGrid.EditIndex = -1;
                searchDT(username);
            }
            else
            {
                lbl_status.Text = "Error Occured.. Row Not Updated";
            }
        }

        protected void userGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            userGrid.EditIndex = -1;
            searchDT(txt_username.Text);
        }

        protected void userGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
}
