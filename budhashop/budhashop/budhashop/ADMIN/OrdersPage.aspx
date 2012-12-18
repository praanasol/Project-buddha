<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="budhashop.ADMIN.OrdersPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Orders Page</title>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.2.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <link href="../Styles/admin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    $(function() {
        $( "#txt_datepick" ).datepicker({
            changeMonth: true,
            changeYear: true
        });
    });
    </script>
    
    <style type="text/css">
       .ui-datepicker {
         font-size:12px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div id="top_links">
        
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
    <div class="div1" style="width:auto; float:left;">
    
        <asp:TextBox ID="txt_search" runat="server" placeholder="Enter Purchase Id" CssClass="txt_boxes"></asp:TextBox>
        or
        <asp:TextBox ID="txt_datepick" runat="server" placeholder="Select Date" CssClass="txt_boxes"></asp:TextBox>
        <asp:Button ID="btn_search" runat="server" Text="Search" onclick="btn_search_Click" CssClass="buttons" />
        <br />
        <asp:Label ID="lbl_search" runat="server" ForeColor="Red"></asp:Label>
    
        <br />
        <br />
        
    
    <asp:GridView ID="orderGrid" runat="server" AllowPaging="True" 
             AutoGenerateColumns="False" 
             DataKeyNames="PurchaseId,Uid,NoItems,TotalBilledRate,PurchaseDate,DeliveredFlag,ItemString,ShippingAddress,TypeItem" 
             OnPageIndexChanging="orderGrid_PageIndexChanging" 
             onrowcommand="orderGrid_RowCommand" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
             <%--AllowPaging="true" PageSize ="3" OnPageIndexChanging= "itemGrid_PageIndexChanging">--%>
                
             <RowStyle ForeColor="#000066" />
                
             <Columns>
                 <asp:TemplateField>
                     <ItemTemplate>
                         <asp:LinkButton ID="lb_Show" runat="server" 
                             CommandArgument="<%# Container.DisplayIndex %>" CommandName="show">Full Details</asp:LinkButton>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Purchase Id">
                     <ItemTemplate>
                         <asp:Label ID="lbl_PurchaseId" runat="server" Text='<%# Eval("PurchaseId") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="User Id">
                     <ItemTemplate>
                         <asp:Label ID="lbl_UserId" runat="server" Text='<%# Eval("Uid") %>'></asp:Label>
                         <asp:HiddenField ID="HiddenItemStr" runat="server" Value='<%#Eval("ItemString") %>'/>
                         <asp:HiddenField ID="HiddenAddrStr" runat="server" Value='<%#Eval("ShippingAddress") %>'/>
                         <asp:HiddenField ID="HiddentTypeStr" runat="server" Value='<%#Eval("TypeItem") %>'/>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Quantity">
                     <ItemTemplate>
                         <asp:Label ID="lbl_itemQty" runat="server" Text='<%# Eval("NoItems") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Billed Rate">
                     <ItemTemplate>
                         <asp:Label ID="lbl_totalBR" runat="server" Text='<%# Eval("TotalBilledRate") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Date Purchased">
                     <ItemTemplate>
                         <asp:Label ID="lbl_purchaseDate" runat="server" Text='<%# Eval("PurchaseDate") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Deliverd">
                     <ItemTemplate>
                         <asp:Label ID="lbl_Delivered" runat="server" Text='<%# Eval("DeliveredFlag") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
             </Columns>
             <FooterStyle BackColor="White" ForeColor="#000066" />
             <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
             <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
         </asp:GridView>
    
    </div>
    <div id="itemsDiv" runat="server" visible="false" class="div1" style="width:auto; float:left;">
    <asp:LinkButton ID="closeDetails" runat="server" onclick="closeDetails_Click">Close</asp:LinkButton>
    <div style="width:80px;">
    <asp:Label ID="itemsCount" runat="server"></asp:Label>
    <asp:Label ID="totalBill" runat="server"></asp:Label>
    <asp:Label ID="dateP" runat="server"></asp:Label>
    <asp:Label ID="NameA" runat="server"></asp:Label>
    <asp:Label ID="PhnA" runat="server"></asp:Label>
    <asp:Label ID="AdrA" runat="server"></asp:Label>
    </div>
    <div>
    <asp:GridView ID="SelectedOrderGrid" runat="server" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <RowStyle ForeColor="#000066" />
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
    </div>
    
    </div>
    </form>
</body>
</html>
