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

using System.IO;
using System.Drawing;
using InterfacesBS.InterfacesBL;
using BusinessLogicBS;
using BusinessLogicBS.BusinessClasses;

namespace budhashop.ADMIN
{
    public partial class InsertPage : System.Web.UI.Page
    {
        private DataTable dtt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable SelectedItemDT = new DataTable();
                SelectedItemDT.Columns.Add("ItemId");
                SelectedItemDT.Columns.Add("ItemName");
                SelectedItemDT.Columns.Add("Quantity");
                SelectedItemDT.Columns.Add("BilledRate");
                SelectedItemDT.Columns.Add("Net Rate");
                this.ViewState["SelectedItemDT"] = SelectedItemDT;

                getcatgs();
                getItems(Int32.Parse(grpCatDDL.SelectedValue.ToString()));                
            }
        }

        private void getcatgs()
        {
            try
            {
                IAdmin getCats = new AdminItems();
                DataTable catgDt = getCats.getCatagories();

                CatagoryDDL.DataSource = catgDt;
                CatagoryDDL.DataTextField = "CategoryName";
                CatagoryDDL.DataValueField = "CategoryId";
                CatagoryDDL.DataBind();

                grpCatDDL.DataSource = catgDt;
                grpCatDDL.DataTextField = "CategoryName";
                grpCatDDL.DataValueField = "CategoryId";
                grpCatDDL.DataBind();

            }
            catch (Exception cExp)
            {
                ItemMessageLbl.Text = HardCodedValues.BuddaResource.CatchBlockError + cExp.Message;
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
                    grpMsgLbl.Text = HardCodedValues.BuddaResource.ItemsNull;
                    itemGrid.DataSource = null;
                    itemGrid.DataBind();
                }
            }
            catch (Exception iExp)
            {
                grpMsgLbl.Text =HardCodedValues.BuddaResource.CatchBlockError + iExp.Message;
            }
        }

        protected void CatagoryBtn_Click(object sender, EventArgs e)
        {
            string catName = CatagoryTxt.Text;
            string catDesc = catDescTxt.InnerText.ToString();
            bool catStatus = catStatusCb.Checked;

            BusinessEntitiesBS.Catagory_Entities.catagoryObj catObj = new BusinessEntitiesBS.Catagory_Entities.catagoryObj();

            catObj.catagoryName = catName;
            catObj.catagoryDesc = catDesc;
            catObj.catagoryStatus = catStatus;

            try
            {

                IAdmin catInsert = new AdminItems();

                int insertCatChk = catInsert.insertCatagory(catObj);
                
                if (insertCatChk != -1)
                {
                    string NewDir = Server.MapPath("~/ItemImages/" + insertCatChk);
                    try
                    {
                        // Check if directory exists
                        if (!Directory.Exists(NewDir))
                        {
                            // Create the directory.
                            Directory.CreateDirectory(NewDir);
                            catMsgLbl.Text = HardCodedValues.BuddaResource.CatogoryAdd;

                        }
                    }
                    catch (IOException _ex)
                    {
                        catMsgLbl.Text = HardCodedValues.BuddaResource.FloderError + _ex.Message;
                    }

                }
                else
                {
                    catMsgLbl.Text = HardCodedValues.BuddaResource.CatogoryNotAdded;
                    catMsgLbl.ForeColor = System.Drawing.Color.Red;
                }
                ClearCache();
            }
            catch (Exception exp)
            {
                //throw exp;
                catMsgLbl.Text = HardCodedValues.BuddaResource.ConnectionError + exp.Message;
                catMsgLbl.ForeColor = System.Drawing.Color.Red;
            }


        }

        protected void ItemBtn_Click(object sender, EventArgs e)
        {
            bool resFU = checkPhoto(itemImageFU);
            if (resFU)
            {
                try
                {

                    BusinessEntitiesBS.ItemEntities.ItemObj itemValues = new BusinessEntitiesBS.ItemEntities.ItemObj();

                    itemValues.itemName = ItemTxt.Text;
                    itemValues.itemDesc = descTxt.InnerText.ToString();
                    itemValues.itemCatagory = Int32.Parse(CatagoryDDL.SelectedValue);

                    itemValues.itemImagePath = itemImageFU.FileName.ToString();

                    itemValues.itemQty = Int32.Parse(qtyTxt.Text);
                    itemValues.itemBR = float.Parse(brateTxt.Text);
                    itemValues.itemNR = float.Parse(netRateTxt.Text);
                    itemValues.itemStatus = CheckBoxSts.Checked;

                    IAdmin insertItem = new AdminItems();
                    int itemId = insertItem.insertItems(itemValues);
                    if (itemId != -1)
                    {
                        //create folder for item images and save images. show result
                        string NewDir = Server.MapPath("~/ItemImages/" + Int32.Parse(CatagoryDDL.SelectedValue) + "/" + itemId);
                        try
                        {
                            // Check if directory exists
                            if (!Directory.Exists(NewDir))
                            {
                                // Create the directory.
                                Directory.CreateDirectory(NewDir);

                            }
                        }
                        catch (IOException _ex)
                        {
                            ItemMessageLbl.Text = HardCodedValues.BuddaResource.CatchBlockError + _ex.Message;
                        }

                        //string filename = Path.GetFileName(PhotoFU.FileName);
                        string filename = itemId + "Photo.jpg";
                        itemImageFU.SaveAs(Server.MapPath("~/ItemImages/" + Int32.Parse(CatagoryDDL.SelectedValue) + "/" + itemId + "/") + filename);

                        string filePath = Server.MapPath("~/ItemImages/" + Int32.Parse(CatagoryDDL.SelectedValue) + "/" + itemId + "/") + filename;
                        string newfileMed = itemId + "Photomedium.jpg";
                        string newfileSmall = itemId + "small.jpg";
                        string resizedImageMed = Server.MapPath("~/ItemImages/" + Int32.Parse(CatagoryDDL.SelectedValue) + "/" + itemId + "/") + newfileMed;
                        string resizedImageSmall = Server.MapPath("~/ItemImages/" + Int32.Parse(CatagoryDDL.SelectedValue) + "/" + itemId + "/") + newfileSmall;
                        System.Drawing.Image img = System.Drawing.Image.FromFile(filePath);

                        System.Drawing.Bitmap bmpD = img as Bitmap;

                        Bitmap bmpDriverMed = new Bitmap(bmpD, 500, 500);
                        bmpDriverMed.Save(resizedImageMed, System.Drawing.Imaging.ImageFormat.Jpeg);

                        Bitmap bmpDriverSmall = new Bitmap(bmpD, 150, 150);
                        bmpDriverSmall.Save(resizedImageSmall, System.Drawing.Imaging.ImageFormat.Jpeg);

                        ItemMessageLbl.Text = HardCodedValues.BuddaResource.ItemAdd;

                    }
                    else
                    {
                        ItemMessageLbl.Text = HardCodedValues.BuddaResource.AddItemFail;
                    }
                    ClearCache();
                
                }
                catch (Exception iExp)
                {
                    ItemMessageLbl.Text = HardCodedValues.BuddaResource.CatchBlockError + iExp.Message;
                }

            }



        }

        private bool checkPhoto(FileUpload imgFU)
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
                            return true;
                        }
                        else
                        {
                            ItemMessageLbl.Text = HardCodedValues.BuddaResource.ImageFileError;
                            return false;
                        }
                    }
                    catch (Exception ex)
                    {
                        ItemMessageLbl.Text = HardCodedValues.BuddaResource.ImageFileError + ex.Message;
                        return false;
                    }

                }
                else
                {
                    ItemMessageLbl.Text = HardCodedValues.BuddaResource.ImageSizeError;
                    return false;

                }

            }
            else return false;


        }

        protected void grpCatDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            grpMsgLbl.Text = "";
            txt_itemname.Text = "";
            int grpCatId = Int32.Parse(grpCatDDL.SelectedValue.ToString());
            getItems(grpCatId);
        }

        protected void grpSubmitBtn_Click(object sender, EventArgs e)
        {
            if (grpImageFU.FileName != string.Empty && grpImageFU.FileContent.Length <= 1024000)
            {
                //bool flagItem;                
                float billedrate = 0, netrate = 0;

                DataTable grpItemsDt = new DataTable();
                DataColumn dc = new DataColumn("GrpItem", typeof(int));
                grpItemsDt.Columns.Add(dc);

                foreach (GridViewRow dRow in SelectedItemGrid.Rows)
                {
                    string nrate = dRow.Cells[4].Text.ToString();
                    string brate = dRow.Cells[3].Text.ToString();
                    billedrate += float.Parse(brate);
                    netrate += float.Parse(nrate);

                    int itemId = Convert.ToInt32(dRow.Cells[0].Text.ToString());

                    DataRow dr = grpItemsDt.NewRow();
                    dr[0] = itemId;

                    grpItemsDt.Rows.Add(dr);
                }

                string grpItemString = "";
                bool first = true;
                if (grpItemsDt.Rows.Count > 0)
                {
                    foreach (DataRow iRow in grpItemsDt.Rows)
                    {
                        if (first)
                        {
                            grpItemString += int.Parse(iRow["GrpItem"].ToString());
                            first = false;
                        }
                        else
                        {
                            grpItemString += "," + int.Parse(iRow["GrpItem"].ToString());
                        }

                    }

                    float discount = float.Parse(grpDiscountTxt.Text);
                    billedrate -= (billedrate * (discount / 100));
                    netrate = (netrate - (netrate * (discount / 100)));

                    BusinessEntitiesBS.GroupEntities.grpObj grpValus = new BusinessEntitiesBS.GroupEntities.grpObj();

                    grpValus.grpName = grpNameTxt.Text.ToString();
                    grpValus.grpDesc = grpDescTxt.Text.ToString();
                    grpValus.grpBR = billedrate;
                    grpValus.grpNR = netrate;
                    //grpValus.grpBR =  float.Parse(grpBrTxt.Text.ToString());
                    //grpValus.grpNR = float.Parse(grpNrTxt.Text.ToString());
                    grpValus.grpStatus = grpCb.Checked;
                    grpValus.fixedGrp = grpStatusCb.Checked;
                    grpValus.Quantity = Int32.Parse(grpQtyTxt.Text.ToString());
                    //item string
                    grpValus.itemIdStr = grpItemString;

                    IAdmin insertGroup = new AdminItems();
                    int grpId = insertGroup.insertGroup(grpValus);
                    if (grpId != -1)
                    {
                        //create folder for item images and save images. show result
                        string NewDir = Server.MapPath("~/GroupImages/" + "/" + grpId);
                        try
                        {
                            // Check if directory exists
                            if (!Directory.Exists(NewDir))
                            {
                                // Create the directory.
                                Directory.CreateDirectory(NewDir);
                            }
                        }
                        catch (IOException _ex)
                        {
                            grpMsgLbl.Text = HardCodedValues.BuddaResource.FloderError + _ex.Message;
                        }
                        string filename = grpId + "Photo.jpg";
                        grpImageFU.SaveAs(Server.MapPath("~/GroupImages/" + "/" + grpId + "/") + filename);

                        string filePath = Server.MapPath("~/GroupImages/" + "/" + grpId + "/") + filename;
                        string newfileMed = grpId + "Photomedium.jpg";
                        string newfileSmall = grpId + "small.jpg";
                        string resizedImageMed = Server.MapPath("~/GroupImages/" + "/" + grpId + "/") + newfileMed;
                        string resizedImageSmall = Server.MapPath("~/GroupImages/" + "/" + grpId + "/") + newfileSmall;
                        System.Drawing.Image img = System.Drawing.Image.FromFile(filePath);

                        System.Drawing.Bitmap bmpD = img as Bitmap;

                        Bitmap bmpDriverMed = new Bitmap(bmpD, 500, 500);
                        bmpDriverMed.Save(resizedImageMed, System.Drawing.Imaging.ImageFormat.Jpeg);

                        Bitmap bmpDriverSmall = new Bitmap(bmpD, 150, 150);
                        bmpDriverSmall.Save(resizedImageSmall, System.Drawing.Imaging.ImageFormat.Jpeg);

                        grpMsgLbl.Text =HardCodedValues.BuddaResource.GroupAdd;

                    }
                    else
                    {
                        grpMsgLbl.Text = HardCodedValues.BuddaResource.GroupNotAdded;
                    }
                }
                else
                {
                    grpMsgLbl.Text = HardCodedValues.BuddaResource.ItemSelect;
                }
            }
            else
            {
                grpMsgLbl.Text = HardCodedValues.BuddaResource.ImageSizeError;
            }
            ClearCache();

        }

        private void searchDT(string itemname, int catid)
        {
            try
            {
                IAdmin searchitemname = new AdminItems();
                DataTable searchitemDT = searchitemname.SearchItems(itemname, catid);
                if (searchitemDT != null)
                {
                    itemGrid.DataSource = searchitemDT;
                    itemGrid.DataBind();
                    grpMsgLbl.Text = "";
                }
                else
                {
                    grpMsgLbl.Text =HardCodedValues.BuddaResource.NoItemError;
                    itemGrid.DataSource = null;
                    itemGrid.DataBind();
                }
            }
            catch (Exception iExp)
            {
                grpMsgLbl.Text = HardCodedValues.BuddaResource.CatchBlockError + iExp.Message;
            }
        }

        protected void btn_search_Click(object sender, EventArgs e)
        {
            string itemname = txt_itemname.Text;
            int grpCatId = Int32.Parse(grpCatDDL.SelectedValue.ToString());
            if (itemname != "")
            {
                searchDT(itemname, grpCatId);
            }
            else
            {
                getItems(grpCatId);
                grpMsgLbl.Text = HardCodedValues.BuddaResource.EnterID;
            }
        }

        protected void itemGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            itemGrid.PageIndex = e.NewPageIndex;
            int grpCatId = Int32.Parse(grpCatDDL.SelectedValue.ToString());
            if (txt_itemname.Text == "")
            {
                getItems(grpCatId);
            }
            else
            {
                searchDT(txt_itemname.Text, grpCatId);
            }
        }

        protected void itemGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            dtt = (DataTable)this.ViewState["SelectedItemDT"];

            DataRow row;

            if (e.CommandName.Equals("Add"))
            {
                int index = Convert.ToInt32(e.CommandArgument.ToString());
                //GridViewRow gvr = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
                //int index = gvr.RowIndex;
                string ItemId = itemGrid.DataKeys[index].Value.ToString();
                string ItemName = itemGrid.DataKeys[index]["ItemName"].ToString();
                string ItemQty = itemGrid.DataKeys[index]["Qty"].ToString();
                string ItemBR = itemGrid.DataKeys[index]["BilledRate"].ToString();
                string ItemNR = itemGrid.DataKeys[index]["NetRate"].ToString();

                bool isexist = false;

                foreach (DataRow drr in dtt.Rows)
                {
                    string ItemId1 = drr["ItemId"].ToString();
                    if (ItemId == ItemId1)
                    {
                        isexist = true;
                        break;
                    }
                }

                if (isexist)
                {
                    Response.Write("<script language='javascript'>alert(\"" + HardCodedValues.BuddaResource.ItemRepeat + "\");</script>");
                }
                else
                {
                    row = dtt.NewRow();
                    row["ItemId"] = ItemId;
                    row["ItemName"] = ItemName;
                    row["Quantity"] = ItemQty;
                    row["BilledRate"] = ItemBR;
                    row["Net Rate"] = ItemNR;
                    dtt.Rows.Add(row);
                    SelectedItemGrid.DataSource = dtt;
                    SelectedItemGrid.DataBind();
                }
            }
        }

        private void ClearCache()
        {
            System.Web.HttpContext.Current.Cache.Remove("CacheItemsObj");
        }

        protected void lb_logout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("../ADMIN/LoginA.aspx");
        }
    
    }
}
