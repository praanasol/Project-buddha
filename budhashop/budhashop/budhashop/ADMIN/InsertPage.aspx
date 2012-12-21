<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="InsertPage.aspx.cs" Inherits="budhashop.ADMIN.InsertPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Insert Items Page</title>
    
    <link href="../Styles/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div id="top_links">
    <asp:LinkButton ID="HyperLink1" runat="server" 
            onclick="lb_clear_cache">Clear Cache-&gt;</asp:LinkButton>
    &nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="hyplink_insertItems" runat="server" 
            NavigateUrl="~/ADMIN/InsertPage.aspx">Insert Items-&gt;</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="hyplink_editItems" runat="server" 
            NavigateUrl="~/ADMIN/EditItems.aspx">Edit Items-&gt;</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="hyplink_editUsers" runat="server" 
            NavigateUrl="~/ADMIN/EditUsers.aspx">Edit Users-&gt;</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="hyplink_ordersList" runat="server" 
            NavigateUrl="~/ADMIN/OrdersPage.aspx">Orders List-&gt;</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;
        <asp:HyperLink ID="hyplink_siteFeedbacks" runat="server" 
            NavigateUrl="~/ADMIN/SiteFeedback.aspx">Site Feedbacks-&gt;</asp:HyperLink>
    &nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="lb_logout" runat="server" onclick="lb_logout_Click">LogOut-&gt</asp:LinkButton>
        
    </div>
    <br />
    <br />
    <div class="div1">
    <!-- Catagory part -->
        <asp:Label ID="CatagoryLbl" runat="server" Text="Add Catogory" 
            CssClass="lbl_heading" Font-Underline="True"></asp:Label>
      <br />
        <asp:Label ID="catNmeLbl" runat="server" Text="Name"></asp:Label>
        <asp:TextBox Id="CatagoryTxt" runat="server" CssClass="txt_boxes" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="catRFV" ControlToValidate="CatagoryTxt" ValidationGroup="catVG" runat="server" SetFocusOnError="true">Enter name.</asp:RequiredFieldValidator>
         <asp:Label ID="catDescLbl" runat="server" Text="Description"></asp:Label>
        <textarea Id="catDescTxt" runat="server" cols="0" rows="3" class="txt_boxes" style="margin-top:-15px; margin-bottom:-20px;"></textarea>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="catDescTxt" ValidationGroup="catVG" runat="server" SetFocusOnError="true">Enter description.</asp:RequiredFieldValidator>
        <asp:Label ID="catStatus" runat="server" Text="Active Status"></asp:Label>
        <asp:CheckBox ID="catStatusCb" runat="server" />
        <asp:Label ID="catMsgLbl" runat="server" Text=""></asp:Label>
        <p></p>
        <asp:Button ID="CatagoryBtn" Text="Add Catagory" CausesValidation="true" CssClass="buttons" 
            ValidationGroup="catVG" runat="server" onclick="CatagoryBtn_Click" />
    
    </div>
    <p></p>
    <p></p>
    
    <div class="div2">
     <!-- Sub Catagory part -->
    <asp:Label ID="SubCatLbl" runat="server" Text="Add Sub Catagory" 
            CssClass="lbl_heading" Font-Underline="True"></asp:Label>
    <br />
    <br>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    Catagory:<asp:DropDownList ID="ddl_Catagory" runat="server" CssClass="txt_boxes" style="width:auto;" 
                        onselectedindexchanged="ddl_Catagory_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;
                    Sub Catagory Name:
                    <asp:TextBox ID="txt_SubCatName" runat="server" ontextchanged="txt_SubCatName_TextChanged" AutoPostBack="true" CssClass="txt_boxes"></asp:TextBox>
                    <asp:Image ID="img_SubCatName" runat="server" Visible="false" />
                    <asp:Label ID="lbl_SubCatName" runat="server" ForeColor="Red"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txt_SubCatName" ErrorMessage="Enter Name" 
                        SetFocusOnError="True" ValidationGroup="subcatVG"></asp:RequiredFieldValidator>
                </ContentTemplate>
            </asp:UpdatePanel>
            <p></p>
            <asp:Button ID="btn_subcatagory" runat="server" onclick="btn_subcatagory_Click" 
                Text="Add Sub Catagory" ValidationGroup="subcatVG" CssClass="buttons" />
            <asp:Label ID="lbl_subCatStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        </div>
    </div>
    <p></p>
    <p></p>
    
    <div class="div2">
     <!-- Sub Catagory part -->
    <asp:Label ID="MerchantLbl" runat="server" Text="Add Merchant" 
            CssClass="lbl_heading" Font-Underline="True"></asp:Label>
    <br />
        <div>
            Name:
            <asp:RequiredFieldValidator ID="rfv_mName" runat="server" ControlToValidate="txt_mName" ValidationGroup="merchantVG" ErrorMessage="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_mName" runat="server" CssClass="txt_boxes"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            Type:
            <asp:DropDownList ID="ddl_mType" runat="server" CssClass="txt_boxes" style="width:auto;">
                <asp:ListItem Text="Distributor"></asp:ListItem>
                <asp:ListItem Text="Supplier"></asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            Phone number:
            <asp:RequiredFieldValidator ID="rfv_mPhno" runat="server" ControlToValidate="txt_mPhno" ValidationGroup="merchantVG" ErrorMessage="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_mPhno" runat="server" CssClass="txt_boxes"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            Address:
            <asp:RequiredFieldValidator ID="rfv_mAddress" runat="server" ControlToValidate="txt_mAddress" ValidationGroup="merchantVG" ErrorMessage="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <textarea Id="txt_mAddress" runat="server" cols="0" rows="3" class="txt_boxes" style="margin-top:-15px; margin-bottom:-20px;"></textarea>
            <p></p>
            Login Id:
            <asp:RequiredFieldValidator ID="rfv_mLoginId" runat="server" ControlToValidate="txt_mLoginId" ValidationGroup="merchantVG" ErrorMessage="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_mLoginId" runat="server" CssClass="txt_boxes"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            Password:
            <asp:RequiredFieldValidator ID="rfv_mPwd" runat="server" ControlToValidate="txt_mPwd" ValidationGroup="merchantVG" ErrorMessage="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_mPwd" runat="server" CssClass="txt_boxes"></asp:TextBox>
            <p></p>
            <asp:Button ID="btn_merchant" runat="server" Text="Add Merchant" ValidationGroup="merchantVG" CssClass="buttons" OnClick="btn_merchant_Click" />
            <asp:Label ID="lbl_merchantStatus" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
        </div>
    </div>
    <p></p>
    <p></p>
    
    <div class="div1">
     <!-- items part -->
    <asp:Label ID="ItemLbl" runat="server" Text="Add Item" CssClass="lbl_heading" 
            Font-Underline="True"></asp:Label>
    <br />
        <div>
            <asp:Label ID="catLbl" runat="server" Text="Catagory"></asp:Label>
            <asp:DropDownList ID="CatagoryDDL" runat="server" AutoPostBack="true"
                   onselectedindexchanged="CatagoryDDL_SelectedIndexChanged" CssClass="txt_boxes" style="width:auto;">
            </asp:DropDownList>
         <asp:Label ID="lbl_subCat" runat="server" Text="Sub Catagory" style="margin-left:5px;"></asp:Label>
         <asp:DropDownList ID="SubCatagoryDDL" runat="server" CssClass="txt_boxes" style="width:auto;"></asp:DropDownList>
        <asp:Label ID="lbl_merchant" runat="server" Text="Merchant" style="margin-left:5px;"></asp:Label>
        <asp:DropDownList ID="MerchantDDL" runat="server" CssClass="txt_boxes" style="width:auto;"></asp:DropDownList>
        <asp:Label ID="NameLbl" runat="server" Text="Name" Width="70px" style="margin-left:1px; text-align:right;"></asp:Label>
        <asp:TextBox ID="ItemTxt" runat="server" CssClass="txt_boxes" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="itemNmeRFV" ControlToValidate="ItemTxt" ValidationGroup="itemVG" runat="server" ErrorMessage="Enter name." SetFocusOnError="true"></asp:RequiredFieldValidator>
        
        <asp:Label ID="descLbl" runat="server" Text="Description"  Width="70px" style="margin-left:28px;"></asp:Label>
        <textarea Id="descTxt" runat="server" cols="0" rows="3" class="txt_boxes" style="margin-top:-25px;"></textarea>
         <asp:RequiredFieldValidator ID="itemDescRFV" ControlToValidate="descTxt" ValidationGroup="itemVG" runat="server" ErrorMessage="Enter Description." SetFocusOnError="true"></asp:RequiredFieldValidator>
        
         
           <p></p>
           
            <div>
            <asp:Label ID="qtyLbl" runat="server" Text="Quantity"></asp:Label>
            <asp:TextBox ID="qtyTxt" runat="server" CssClass="txt_boxes"></asp:TextBox>
             <asp:RequiredFieldValidator ID="itemQtyRFV" ControlToValidate="qtyTxt" ValidationGroup="itemVG" runat="server" ErrorMessage="Enter Quantity." SetFocusOnError="true"></asp:RequiredFieldValidator>
        
            <asp:Label ID="brateLbl" runat="server" Text="Billed Rate" Width="70px" style="margin-left:19px; text-align:right;"></asp:Label>
            <asp:TextBox ID="brateTxt" runat="server" CssClass="txt_boxes"></asp:TextBox>
             <asp:RequiredFieldValidator ID="itemBrRFV" ControlToValidate="brateTxt" ValidationGroup="itemVG" runat="server" ErrorMessage="Enter billed rate." SetFocusOnError="true"></asp:RequiredFieldValidator>
        
            <asp:Label ID="netRateLbl" runat="server" Text="Net Rate"  Width="70px" style="text-align:right;"></asp:Label>
            <asp:TextBox ID="netRateTxt" runat="server" CssClass="txt_boxes"></asp:TextBox>
            <asp:RequiredFieldValidator ID="itemNrRFV" ControlToValidate="netRateTxt" ValidationGroup="itemVG" runat="server" ErrorMessage="Enter net rate." SetFocusOnError="true"></asp:RequiredFieldValidator>
            
             </div>
            <p></p>
            <asp:Label ID="typeLbl" runat="server" Text="Type" Width="51px"></asp:Label>
            <asp:TextBox ID="typeTxt" runat="server" CssClass="txt_boxes"></asp:TextBox>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="itemVG"
                SetFocusOnError="true" ErrorMessage="Enter Type" ControlToValidate="typetxt"></asp:RequiredFieldValidator>--%>
             <asp:Label ID="statusLbl" runat="server" Text="Active Status" style="margin-left:15px;"></asp:Label>
             <asp:CheckBox ID="CheckBoxSts" runat="server" />
            <asp:Label ID="ImageLbl" runat="server" Text="Add Image"  Width="70px" style="margin-left:15px;"></asp:Label>
            <asp:FileUpload ID="itemImageFU" runat="server" CssClass="file_upload"/>
            <asp:RegularExpressionValidator id="imageREV" runat="server" ErrorMessage="upload Only images" 
            ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF|.jpeg|.JPEG|.png|.PNG|.bmp|.BMP)$"
            ControlToValidate="itemImageFU" ValidationGroup="itemVG" SetFocusOnError="true"></asp:RegularExpressionValidator>
             <asp:RequiredFieldValidator ID="imageRFV" ControlToValidate="itemImageFU" ValidationGroup="itemVG" runat="server" ErrorMessage="Select image." SetFocusOnError="true"></asp:RequiredFieldValidator>
            <%--onselectedindexchanged="CatagoryDDL_SelectedIndexChanged">--%>
        <p></p>
        <asp:Button ID="ItemBtn" runat="server" Text="Add Item" CausesValidation="true" ValidationGroup="itemVG" onclick="ItemBtn_Click" CssClass="buttons" />
        <asp:Label ID="ItemMessageLbl" Font-Bold="true" ForeColor="Red" runat="server" />
        </div>
    </div>
    <p></p>
    <p></p>
     <!-- Groups part -->
     <div class="div2">
     <asp:Label ID="grpLbl" runat="server" Text="Add Groups" CssClass="lbl_heading" 
             Font-Underline="True"></asp:Label>
     <p></p>
     <asp:Label ID="grpNameLbl" runat="server" Text="Name"></asp:Label>
     <asp:TextBox ID="grpNameTxt" runat="server" CssClass="txt_boxes"></asp:TextBox>
    
        <asp:RequiredFieldValidator ID="grpNmeRFV" ControlToValidate="grpNameTxt" 
             ValidationGroup="grpVG" runat="server" SetFocusOnError="true" >Enter name.</asp:RequiredFieldValidator>
        
      <asp:Label ID="grpDesclbl" runat="server" Text="Description"></asp:Label>
       <asp:TextBox ID="grpDescTxt" runat="server" CssClass="txt_boxes"></asp:TextBox>
         <asp:RequiredFieldValidator ID="grpDescRFV" ControlToValidate="grpDescTxt" 
             ValidationGroup="grpVG" runat="server" SetFocusOnError="true" >Enter Description.</asp:RequiredFieldValidator>
        
           <asp:Label ID="grpImageLbl" runat="server" Text="Add Image"></asp:Label>
            <asp:FileUpload ID="grpImageFU" runat="server" CssClass="file_upload"/>
            <asp:RegularExpressionValidator id="grpimageREV" runat="server" ErrorMessage="upload Only images" 
            ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF|.jpeg|.JPEG|.png|.PNG|.bmp|.BMP)$"
            ControlToValidate="grpImageFU" ValidationGroup="grpVG" SetFocusOnError="true">Upload only images</asp:RegularExpressionValidator>
             <asp:RequiredFieldValidator ID="grpimageRFV" ControlToValidate="grpImageFU" 
             ValidationGroup="grpVG" runat="server" SetFocusOnError="true" >Select image.</asp:RequiredFieldValidator>
         <br />
         <br />
      <asp:Label ID="grpCatLbl" runat="server" Text="Catagory"></asp:Label>
        <asp:DropDownList ID="grpCatDDL" runat="server" AutoPostBack = "true"  
             onselectedindexchanged="grpCatDDL_SelectedIndexChanged" CssClass="txt_boxes" style="width:auto;"> </asp:DropDownList>
     <p></p>
     <div>
      <asp:Label ID="grpItemsIbl" runat="server" Text="Add Items to group from grid"></asp:Label>
      <!-- Items datagrid to add items selecting all at a time -->
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txt_itemname" placeholder="Enter Item Name/Id" runat="server" CssClass="txt_boxes"></asp:TextBox>
        <asp:Button ID="btn_search" runat="server" Text="Search" ValidationGroup="itemSearch" 
            onclick="btn_search_Click" CssClass="buttons" />
        <asp:RequiredFieldValidator ID="rfv_search" runat="server" ControlToValidate="txt_itemname" ValidationGroup="itemSearch" ErrorMessage="Empty Search!" SetFocusOnError="true"></asp:RequiredFieldValidator>        
        <div>
        <div style="width:30%; float:left;">
            <p></p>
             <asp:GridView ID="itemGrid" runat="server" AllowPaging="True" 
                 AutoGenerateColumns="False" 
                 DataKeyNames="ItemID,ItemName,Qty,BilledRate,NetRate" 
                 OnPageIndexChanging="itemGrid_PageIndexChanging" 
                 onrowcommand="itemGrid_RowCommand" PageSize="5" BackColor="White" 
                 BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                 <%--AllowPaging="true" PageSize ="3" OnPageIndexChanging= "itemGrid_PageIndexChanging">--%>
                    
                 <RowStyle ForeColor="#000066" />
                    
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="lb_add" runat="server" 
                                 CommandArgument="<%# Container.DisplayIndex %>" CommandName="Add">Add</asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Item Id">
                         <ItemTemplate>
                             <asp:Label ID="lbl_itemId" runat="server" Text='<%# Eval("ItemID") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Item Name">
                         <ItemTemplate>
                             <asp:Label ID="lbl_itemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Quantity">
                         <ItemTemplate>
                             <asp:Label ID="lbl_itemQty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Billed Rate">
                         <ItemTemplate>
                             <asp:Label ID="lbl_itemBR" runat="server" Text='<%# Eval("BilledRate") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Net Rate">
                         <ItemTemplate>
                             <asp:Label ID="lbl_itemNR" runat="server" Text='<%# Eval("NetRate") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
                 <FooterStyle BackColor="White" ForeColor="#000066" />
                 <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                 <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
             </asp:GridView>
         </div>
         <br />
         <div style="width:70%; float:left;">
             <asp:GridView ID="SelectedItemGrid" runat="server" BackColor="White" 
                 BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                 <RowStyle ForeColor="#000066" />
                 <FooterStyle BackColor="White" ForeColor="#000066" />
                 <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                 <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
             </asp:GridView>
         </div>
         </div>
     </div>
     <br style="clear:both;"/>
    
     <p></p>
     <div>
            <asp:Label ID="grpDiscountLbl" runat="server" Text="Discount"></asp:Label>
            <asp:TextBox ID="grpDiscountTxt" runat="server" CssClass="txt_boxes"></asp:TextBox>
            <asp:Label ID="grpChkLbl" runat="server" Text="Active Status"></asp:Label>
            <asp:CheckBox ID="grpCb" runat="server" />
            <asp:Label ID="grpStatusLbl" runat="server" Text="Fixed Group Status"></asp:Label>
            <asp:CheckBox ID="grpStatusCb" runat="server" />
            
          <asp:Label ID="grpQtyLbl" runat="server" Text="Quantity"></asp:Label>
            <asp:TextBox ID="grpQtyTxt" runat="server" CssClass="txt_boxes"></asp:TextBox>
             <asp:RequiredFieldValidator ID="grpQtyRFV" ControlToValidate="grpQtyTxt" 
             ValidationGroup="grpVG" runat="server" SetFocusOnError="true" >Enter Quantity.</asp:RequiredFieldValidator>
        
      </div>
       <p></p>
             <asp:Button ID="grpSubmitBtn" runat="server" Text="Add Group" 
             onclick="grpSubmitBtn_Click" ValidationGroup="grpVG" CssClass="buttons" />
            
            <asp:Label ID="grpMsgLbl" runat="server" ForeColor="Red" 
             style="font-weight: 700"></asp:Label>  
     </div>
    </form>
</body>
</html>
