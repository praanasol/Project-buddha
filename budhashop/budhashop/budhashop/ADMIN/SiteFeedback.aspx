<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteFeedback.aspx.cs" Inherits="budhashop.ADMIN.SiteFeedback" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Feedback Page</title>
    
    <link href="../Styles/admin.css" rel="stylesheet" type="text/css" />
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
    
        <asp:GridView ID="gv_feedback" runat="server" 
            EmptyDataText="No Feedbacks Found" AllowPaging="True" BackColor="White" 
            BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
            onpageindexchanging="gv_feedback_PageIndexChanging" style="text-align: center">
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <AlternatingRowStyle BackColor="#F7F7F7" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
