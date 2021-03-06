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

using System.IO;
using System.Drawing;
using InterfacesBS.InterfacesBL;
using BusinessLogicBS.BusinessClasses;

namespace budhashop.ADMIN
{
    public partial class EditItem : System.Web.UI.Page
    {
        public DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbl_status.Text = "";
                getcatgs();
                getItems(Int32.Parse(ddl_catagory.SelectedValue.ToString()));                
            }
        }

        protected void getcatgs()
        {
            try
            {
                IAdmin getCats = new AdminItems();
                DataTable catgDt = getCats.getCatagories();

                ddl_catagory.DataSource = catgDt;
                ddl_catagory.DataTextField = "CategoryName";
                ddl_catagory.DataValueField = "CategoryId";
                ddl_catagory.DataBind();
            }
            catch (Exception cExp)
            {
                throw cExp;
            }
        }

        protected void getItems(int grpCatId)
        {
            try
            {
                IAdmin getItems = new AdminItems();
                DataTable itemDT = getItems.getItems(grpCatId);
                if (itemDT != null)
                {
                    itemGrid.DataSource = itemDT;
                    itemGrid.DataBind();
                }
                else
                {
                    lbl_status.Text = "No Data for items! change the catagory";
                    itemGrid.DataSource = null;
                    itemGrid.DataBind();
                }
            }
            catch (Exception iExp)
            {
                lbl_status.Text = "Error Occured: " + iExp.Message;
            }
        }

        protected void ddl_catagory_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbl_status.Text = "";
            txt_itemname.Text = "Enter Item Name/Id";
            int grpCatId = Int32.Parse(ddl_catagory.SelectedValue.ToString());
            getItems(grpCatId);
        }

        protected void itemGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            itemGrid.EditIndex = e.NewEditIndex;
            if (txt_itemname.Text == "Enter Item Name/Id")
            {                
                int grpCatId = Int32.Parse(ddl_catagory.SelectedValue.ToString());
                getItems(grpCatId);
            }
            else
            {
                searchDT(txt_itemname.Text);
            }
        }

        protected void itemGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            itemGrid.EditIndex = -1;
            if (txt_itemname.Text == "Enter Item Name/Id")
            {
                int grpCatId = Int32.Parse(ddl_catagory.SelectedValue.ToString());
                getItems(grpCatId);
            }
            else
            {                
                searchDT(txt_itemname.Text);
            }
        }

        protected void itemGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int itemid = Convert.ToInt32(itemGrid.DataKeys[e.RowIndex].Value.ToString());
            TextBox itemname=(TextBox)itemGrid.Rows[e.RowIndex].FindControl("txt_iname");
            TextBox description=(TextBox)itemGrid.Rows[e.RowIndex].FindControl("txt_editidescr");
            FileUpload fu_itemimage = (FileUpload)itemGrid.Rows[e.RowIndex].FindControl("fu_iimage");
            TextBox catagoryid=(TextBox)itemGrid.Rows[e.RowIndex].FindControl("txt_cid");
            TextBox billedrate=(TextBox)itemGrid.Rows[e.RowIndex].FindControl("txt_billedrate");
            TextBox quantity = (TextBox)itemGrid.Rows[e.RowIndex].FindControl("txt_qty");
            TextBox netrate = (TextBox)itemGrid.Rows[e.RowIndex].FindControl("txt_netrate");
                        
            //check whether the image is valid or not
            bool isImageValid = checkPhoto(fu_itemimage,Int32.Parse(catagoryid.Text),itemid);
            if (isImageValid)
            {
                //save updated values in database
                BusinessEntitiesBS.ItemEntities.ItemObj UpdateItemObj = new BusinessEntitiesBS.ItemEntities.ItemObj();
                UpdateItemObj.itemName = itemname.Text;
                UpdateItemObj.itemDesc = description.Text;
                UpdateItemObj.itemCatagory = Int32.Parse(catagoryid.Text);
                UpdateItemObj.itemBR = float.Parse(billedrate.Text);
                UpdateItemObj.itemQty = Int32.Parse(quantity.Text);
                UpdateItemObj.itemNR = float.Parse(netrate.Text);

                IAdmin UpdateItems = new AdminItems();
                int updated = UpdateItems.UpdateItems(UpdateItemObj, itemid);
                if (updated != -1)
                {
                    lbl_status.Text = "Updated Successfully";
                    itemGrid.EditIndex = -1;
                    if (txt_itemname.Text == "Enter Item Name/Id")
                    {
                        int grpCatId = Int32.Parse(ddl_catagory.SelectedValue.ToString());
                        getItems(grpCatId);
                    }
                    else
                    {
                        searchDT(txt_itemname.Text);
                    }
                }
                else
                {
                    lbl_status.Text = "Error Occured.. Row Not Updated";
                }
            }
            else
            {
                lbl_status.Text = "Selected file is not an image or it is greater than 1mb";
            }
        }

        protected bool checkPhoto(FileUpload imgFU,int catagoryid,int itemid)
        {
            System.Drawing.Image img = null;//System.Drawing.Image.FromStream(PhotoFU.PostedFile.InputStream);
            
            //Image uploadedImage = null;
            if (imgFU.HasFile && imgFU.FileName != string.Empty && imgFU.FileContent.Length > 0)
            {
                if (imgFU.FileContent.Length <= 1024000)
                {
                    try
                    {
                        img = System.Drawing.Image.FromStream(imgFU.PostedFile.InputStream);
                        if (img.RawFormat.Guid == System.Drawing.Imaging.ImageFormat.Jpeg.Guid ||
                            img.RawFormat.Guid == System.Drawing.Imaging.ImageFormat.Png.Guid ||
                            img.RawFormat.Guid == System.Drawing.Imaging.ImageFormat.Gif.Guid)
                        {
                            //replace the old image with new image
                            string filename = itemid + "Photo.jpg";
                            imgFU.SaveAs(Server.MapPath("~/ItemImages/" + catagoryid + "/" + itemid + "/") + filename);

                            string filePath = Server.MapPath("~/ItemImages/" + catagoryid + "/" + itemid + "/") + filename;
                            string newfileMed = itemid + "Photomedium.jpg";
                            string newfileSmall = itemid + "small.jpg";
                            string resizedImageMed = Server.MapPath("~/ItemImages/" + catagoryid + "/" + itemid + "/") + newfileMed;
                            string resizedImageSmall = Server.MapPath("~/ItemImages/" + catagoryid + "/" + itemid + "/") + newfileSmall;
                            System.Drawing.Image img1 = System.Drawing.Image.FromFile(filePath);

                            System.Drawing.Bitmap bmpD = img1 as Bitmap;

                            Bitmap bmpDriverMed = new Bitmap(bmpD, 512, 372);
                            bmpDriverMed.Save(resizedImageMed, System.Drawing.Imaging.ImageFormat.Jpeg);

                            Bitmap bmpDriverSmall = new Bitmap(bmpD, 170, 126);
                            bmpDriverSmall.Save(resizedImageSmall, System.Drawing.Imaging.ImageFormat.Jpeg);

                            return true;
                        }
                        else
                        {
                            lbl_status.Text = "Selected file is not an image";
                            return false;
                        }
                    }
                    catch (Exception ex)
                    {
                        lbl_status.Text = "Selected file is not an image.<br />" + ex.Message;
                        return false;
                    }
                }
                else
                {
                    lbl_status.Text = "File is too Large. only 1mb allowed";
                    return false;
                }
            }
            else return true;
        }

        protected void itemGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int itemid = Convert.ToInt32(itemGrid.DataKeys[e.RowIndex].Value.ToString());
            IAdmin RemoveItem = new AdminItems();
            int removed = RemoveItem.removeItems(itemid);
            if (removed == -1)
            {
                lbl_status.Text = "Item Removed";
                if (txt_itemname.Text == "Enter Item Name/Id")
                {
                    int grpCatId = Int32.Parse(ddl_catagory.SelectedValue.ToString());
                    getItems(grpCatId);
                }
                else
                {
                    searchDT(txt_itemname.Text);
                }
            }
            else
            {
                lbl_status.Text = "Error Occured while Removing the Item, Try again";
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            string itemname = txt_itemname.Text;
            if (itemname != "Enter Item Name/Id")
            {
                searchDT(itemname);
            }
            else
            {                
                int grpCatId = Int32.Parse(ddl_catagory.SelectedValue.ToString());
                getItems(grpCatId);
                lbl_status.Text = "Please Enter Item Name/Id to search";
            }
        }

        protected void searchDT(string itemname)
        {
            try
            {
                IAdmin searchitemname = new AdminItems();
                DataTable searchitemDT = searchitemname.SearchItems(itemname);
                if (searchitemDT != null)
                {
                    itemGrid.DataSource = searchitemDT;
                    itemGrid.DataBind();
                    lbl_status.Text = "";
                }
                else
                {
                    lbl_status.Text = "No Items Found, Enter Existing Item Name";
                    itemGrid.DataSource = null;
                    itemGrid.DataBind();
                }
            }
            catch (Exception iExp)
            {
                lbl_status.Text = "Error Occured: " + iExp.Message;                
            }
        }

        protected void itemGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            itemGrid.PageIndex = e.NewPageIndex;
            int grpCatId = Int32.Parse(ddl_catagory.SelectedValue.ToString());
            getItems(grpCatId);
        }
    }
}
