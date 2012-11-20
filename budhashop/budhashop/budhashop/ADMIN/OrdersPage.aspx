<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="budhashop.ADMIN.OrdersPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.2.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js" type="text/javascript"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />
    
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
        
    </div>
    <br />
    <br />
    <div>
    
        <asp:TextBox ID="txt_search" runat="server" placeholder="Enter Purchase Id"></asp:TextBox>
        or
        <asp:TextBox ID="txt_datepick" runat="server" placeholder="Select Date"></asp:TextBox>
        <asp:Button ID="btn_search" runat="server" Text="Search" onclick="btn_search_Click" />
        <br />
        <asp:Label ID="lbl_search" runat="server"></asp:Label>
    
        <br />
        <br />
        
    
    <asp:GridView ID="orderGrid" runat="server" AllowPaging="True" 
             AutoGenerateColumns="False" 
             DataKeyNames="PurchaseId,Uid,NoItems,TotalBilledRate,PurchaseDate,DeliveredFlag,ItemString,ShippingAddress" 
             OnPageIndexChanging="orderGrid_PageIndexChanging" 
             onrowcommand="orderGrid_RowCommand" PageSize="10">
             <%--AllowPaging="true" PageSize ="3" OnPageIndexChanging= "itemGrid_PageIndexChanging">--%>
                
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
         </asp:GridView>
    
    </div>
    <div id="itemsDiv" runat="server" visible="false">
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
    <asp:GridView ID="SelectedOrderGrid" runat="server">
    </asp:GridView>
    </div>
    
    </div>
    </form>
</body>
</html>
