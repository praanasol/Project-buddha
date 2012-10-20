﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdersPage.aspx.cs" Inherits="budhashop.ADMIN.OrdersPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
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