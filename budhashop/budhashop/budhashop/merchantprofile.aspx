<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="merchantprofile.aspx.cs" Inherits="budhashop.merchantprofile" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Merchant Profile Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="ProfileDiv">
            <asp:LinkButton ID="lb_mlogout" runat="server" Text="Logout" onclick="lb_mlogout_Click"></asp:LinkButton>
            <br />
            <asp:Label ID="lbl_mName" runat="server" Text="Name:"></asp:Label>
            <asp:TextBox ID="txt_mName" runat="server" ReadOnly="true"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_mType" runat="server" Text="Type:"></asp:Label>
            <asp:TextBox ID="txt_mType" runat="server" ReadOnly="true"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_mAddress" runat="server" Text="Address:"></asp:Label>
            <asp:TextBox ID="txt_mAddress" runat="server" TextMode="MultiLine" ReadOnly="true"></asp:TextBox>
            <br />
            <asp:Label ID="lbl_mPhno" runat="server" Text="Phone Number:"></asp:Label>
            <asp:TextBox ID="txt_mPhno" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
        <p></p>
        <div id="OrdersDiv">
            
            <asp:GridView ID="gv_MerchantOrders" runat="server" AutoGenerateColumns="False" 
                EmptyDataText="No Orders Yet" AllowPaging="True" 
                onpageindexchanging="gv_MerchantOrders_PageIndexChanging" style="text-align:center;">
                <Columns>
                    <asp:TemplateField HeaderText="Item Id">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ItemId" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ItemQty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Purchase Date">
                        <ItemTemplate>
                            <asp:Label ID="lbl_PurchaseDate" runat="server" Text='<%# Eval("Date","{0:dd/MM/yy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            
        </div>
    </form>
</body>
</html>