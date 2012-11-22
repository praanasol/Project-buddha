<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertPage.aspx.cs" Inherits="budhashop.ADMIN.InsertPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div id="top links" style="float:right; background-color:Menu;">
        
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
    <div>
    <!-- Catagory part -->
        <asp:Label ID="CatagoryLbl" runat="server" Text="Add Catogory"></asp:Label>
      <br />
        <asp:Label ID="catNmeLbl" runat="server" Text="Name"></asp:Label>
        <asp:TextBox Id="CatagoryTxt" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="catRFV" ControlToValidate="CatagoryTxt" ValidationGroup="catVG" runat="server" >Enter name.</asp:RequiredFieldValidator>
         <asp:Label ID="catDescLbl" runat="server" Text="Description"></asp:Label>
        <textarea Id="catDescTxt" runat="server" cols="0" rows="3"></textarea>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="catDescTxt" ValidationGroup="catVG" runat="server" >Enter description.</asp:RequiredFieldValidator>
        <asp:Label ID="catStatus" runat="server" Text="Active Status"></asp:Label>
        <asp:CheckBox ID="catStatusCb" runat="server" />
        <asp:Label ID="catMsgLbl" runat="server" Text=""></asp:Label>
        
             
        <asp:Button ID="CatagoryBtn" Text="AddCatagory" CausesValidation="true" 
            ValidationGroup="catVG" runat="server" onclick="CatagoryBtn_Click" />
    
    </div>
    <p></p>
    <p></p>
    
    <div>
     <!-- items part -->
    <asp:Label ID="ItemLbl" runat="server" Text="Add Item"></asp:Label>
    <br />
        <div>
        <asp:Label ID="NameLbl" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="ItemTxt" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="itemNmeRFV" ControlToValidate="ItemTxt" ValidationGroup="itemVG" runat="server" >Enter name.</asp:RequiredFieldValidator>
        
        <asp:Label ID="descLbl" runat="server" Text="Description"></asp:Label>
        <textarea Id="descTxt" runat="server" cols="0" rows="3"></textarea>
         <asp:RequiredFieldValidator ID="itemDescRFV" ControlToValidate="descTxt" ValidationGroup="itemVG" runat="server" >Enter Description.</asp:RequiredFieldValidator>
        
         <asp:Label ID="catLbl" runat="server" Text="Catagory"></asp:Label>
        <asp:DropDownList ID="CatagoryDDL" runat="server">
                   <%--onselectedindexchanged="CatagoryDDL_SelectedIndexChanged">--%>
           
           </asp:DropDownList>
           <asp:Label ID="ImageLbl" runat="server" Text="Add Image"></asp:Label>
            <asp:FileUpload ID="itemImageFU" runat="server"/>
            <asp:RegularExpressionValidator id="imageREV" runat="server" ErrorMessage="upload Only images" 
            ValidationExpression="([^\s]+(\.(?i)(jpeg|JPEG|jpg|JPG|jpeg|jpe|JPE|png|PNG|gif|GIF))$)"
           
            ControlToValidate="itemImageFU" ValidationGroup="itemVG">Upload only images</asp:RegularExpressionValidator>
             <asp:RequiredFieldValidator ID="imageRFV" ControlToValidate="itemImageFU" ValidationGroup="itemVG" runat="server" >Select image.</asp:RequiredFieldValidator>
            <%--onselectedindexchanged="CatagoryDDL_SelectedIndexChanged">--%>
            <p></p>
            <div>
            <asp:Label ID="qtyLbl" runat="server" Text="Quantity"></asp:Label>
            <asp:TextBox ID="qtyTxt" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="itemQtyRFV" ControlToValidate="qtyTxt" ValidationGroup="itemVG" runat="server" >Enter Quantity.</asp:RequiredFieldValidator>
        
            <asp:Label ID="brateLbl" runat="server" Text="Billed Rate"></asp:Label>
            <asp:TextBox ID="brateTxt" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="itemBrRFV" ControlToValidate="brateTxt" ValidationGroup="itemVG" runat="server" >Enter billed rate.</asp:RequiredFieldValidator>
        
            <asp:Label ID="netRateLbl" runat="server" Text="Net Rate"></asp:Label>
            <asp:TextBox ID="netRateTxt" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="itemNrRFV" ControlToValidate="netRateTxt" ValidationGroup="itemVG" runat="server" >Enter net rate.</asp:RequiredFieldValidator>
            
             <asp:Label ID="statusLbl" runat="server" Text="Active Status"></asp:Label>
             <asp:CheckBox ID="CheckBoxSts" runat="server" />
             </div>
            <p></p>
        <asp:Button ID="ItemBtn" runat="server" Text="Add Item" CausesValidation="true" ValidationGroup="itemVG" onclick="ItemBtn_Click" />
        <asp:Label ID="ItemMessageLbl" runat="server" />
        </div>
    </div>
    <p></p>
    <p></p>
     <!-- Groups part -->
     <div>
     <asp:Label ID="grpLbl" runat="server" Text="Add Groups"></asp:Label>
     <p></p>
     <asp:Label ID="grpNameLbl" runat="server" Text="Name"></asp:Label>
     <asp:TextBox ID="grpNameTxt" runat="server"></asp:TextBox>
    
        <asp:RequiredFieldValidator ID="grpNmeRFV" ControlToValidate="grpNameTxt" 
             ValidationGroup="grpVG" runat="server" >Enter name.</asp:RequiredFieldValidator>
        
      <asp:Label ID="grpDesclbl" runat="server" Text="Description"></asp:Label>
       <asp:TextBox ID="grpDescTxt" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="grpDescRFV" ControlToValidate="grpDescTxt" 
             ValidationGroup="grpVG" runat="server" >Enter Description.</asp:RequiredFieldValidator>
        
           <asp:Label ID="grpImageLbl" runat="server" Text="Add Image"></asp:Label>
            <asp:FileUpload ID="grpImageFU" runat="server"/>
            <asp:RegularExpressionValidator id="grpimageREV" runat="server" ErrorMessage="upload Only images" 
            ValidationExpression="^.+(.jpg|.JPG|.gif|.GIF|.jpeg|.JPEG|.png|.PNG|.bmp|.BMP)$"
           
            ControlToValidate="grpImageFU" ValidationGroup="grpVG">Upload only images</asp:RegularExpressionValidator>
             <asp:RequiredFieldValidator ID="grpimageRFV" ControlToValidate="grpImageFU" 
             ValidationGroup="grpVG" runat="server" >Select image.</asp:RequiredFieldValidator>
         <br />
         <br />
      <asp:Label ID="grpCatLbl" runat="server" Text="Catagory"></asp:Label>
        <asp:DropDownList ID="grpCatDDL" runat="server" AutoPostBack = "true"  
             onselectedindexchanged="grpCatDDL_SelectedIndexChanged"> </asp:DropDownList>
     <div>
      <asp:Label ID="grpItemsIbl" runat="server" Text="Add Items to group from grid"></asp:Label>
      <!-- Items datagrid to add items selecting all at a time -->
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txt_itemname" placeholder="Enter Item Name/Id" runat="server" Width="168px"></asp:TextBox>
        <asp:Button ID="btn_search" runat="server" Text="Search" 
            onclick="btn_search_Click" />        
         <asp:GridView ID="itemGrid" runat="server" AllowPaging="True" 
             AutoGenerateColumns="False" 
             DataKeyNames="ItemID,ItemName,Qty,BilledRate,NetRate" 
             OnPageIndexChanging="itemGrid_PageIndexChanging" 
             onrowcommand="itemGrid_RowCommand" PageSize="5">
             <%--AllowPaging="true" PageSize ="3" OnPageIndexChanging= "itemGrid_PageIndexChanging">--%>
                
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
         </asp:GridView>
         <br />
         
         <asp:GridView ID="SelectedItemGrid" runat="server">
         </asp:GridView>
         
         <br />
     </div>
    
     <p></p>
     <div>
            <asp:Label ID="grpDiscountLbl" runat="server" Text="Discount"></asp:Label>
            <asp:TextBox ID="grpDiscountTxt" runat="server"></asp:TextBox>
            <asp:Label ID="grpChkLbl" runat="server" Text="Active Status"></asp:Label>
            <asp:CheckBox ID="grpCb" runat="server" />
            <asp:Label ID="grpStatusLbl" runat="server" Text="Fixed Group Status"></asp:Label>
            <asp:CheckBox ID="grpStatusCb" runat="server" />
            
          <asp:Label ID="grpQtyLbl" runat="server" Text="Quantity"></asp:Label>
            <asp:TextBox ID="grpQtyTxt" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="grpQtyRFV" ControlToValidate="grpQtyTxt" 
             ValidationGroup="grpVG" runat="server" >Enter Quantity.</asp:RequiredFieldValidator>
        
      </div>
       <p></p>
             <asp:Button ID="grpSubmitBtn" runat="server" Text="Add Group" 
             onclick="grpSubmitBtn_Click" ValidationGroup="grpVG" />
            
            <asp:Label ID="grpMsgLbl" runat="server" ForeColor="Red" 
             style="font-weight: 700"></asp:Label>  
     </div>
    </form>
</body>
</html>
