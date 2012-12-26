<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="profilepage.aspx.cs" Inherits="budhashop.Merchant.profilepage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
            <div style="font-weight:bold; color:Red;">Orders List:</div>
            <asp:GridView ID="gv_MerchantOrders" runat="server" AutoGenerateColumns="False" 
                EmptyDataText="No Orders Yet" AllowPaging="True" 
                onpageindexchanging="gv_MerchantOrders_PageIndexChanging" style="text-align:center;">
                <Columns>
                    <asp:TemplateField HeaderText="Item Id">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ItemId" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ItemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="img_ItemImage" runat="server" Height="40px" ImageUrl='<%# Eval("ImagePath") %>' Width="50px" />
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
        <p></p>
        <div id="LowItemsDiv">
            <div style="font-weight:bold; color:Red;">Items With Quantity Lessthan 5:</div>
            <asp:GridView ID="gv_lowItems" runat="server" AutoGenerateColumns="false" EmptyDataText="No Items with Quantity < 5" 
                AllowPaging="true" OnPageIndexChanging="gv_lowItems_PageIndexChanging" style="text-align:center;">
                <Columns>
                    <asp:TemplateField HeaderText="Item Id">
                        <ItemTemplate>
                            <asp:Label ID="lbl_itemId" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_itemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="img_itemImage" runat="server" Height="40px" ImageUrl='<%# Eval("ImagePath") %>' Width="50px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="lbl_itemQty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <p></p>
        <div id="ItemsDiv">
            <div style="font-weight:bold; color:Red;">Items List:</div>
            <asp:Label ID="lbl_itemSts" runat="server" ForeColor="Orange"></asp:Label>
            <asp:GridView ID="itemGrid" runat="server" AutoGenerateColumns="False" EmptyDataText="No Items" 
            onrowcancelingedit="itemGrid_RowCancelingEdit" 
            onrowediting="itemGrid_RowEditing" onrowupdating="itemGrid_RowUpdating" 
            DataKeyNames="ItemId" AllowPaging="True" 
            onpageindexchanging="itemGrid_PageIndexChanging" style="text-align: center">
            <Columns>
                <asp:TemplateField HeaderText="Action">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lb_update" runat="server" CommandName="Update" 
                            ValidationGroup="update">Update</asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="lb_cancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lb_edit" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item Id">
                    <EditItemTemplate>
                        <asp:Label ID="lbl_editiid" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_iid" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item Name">
                    <EditItemTemplate>
                        <asp:Label ID="lbl_editiname" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_iname" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" Visible="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_editidescr" runat="server" Text='<%# Eval("Description") %>' 
                            TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txt_idescr" runat="server" Text='<%# Eval("Description") %>' 
                            TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <EditItemTemplate>
                        <asp:Image ID="img_editiimage" runat="server" Height="40px" 
                            ImageUrl='<%# Eval("ImagePath") %>' Width="50px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="img_iimage" runat="server" Height="40px" 
                            ImageUrl='<%# Eval("ImagePath") %>' Width="50px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Billed Rate">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_editBR" runat="server" Text='<%# Eval("BilledRate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_billedrate" runat="server" Text='<%# Eval("BilledRate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_editQty" runat="server" Text='<%# Eval("Qty") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_qty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Net Rate">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_editNR" runat="server" Text='<%# Eval("NetRate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_netrate" runat="server" Text='<%# Eval("NetRate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MerchantId" Visible="false">
                    <EditItemTemplate>
                        <asp:Label ID="lbl_editmerchantId" runat="server" Text='<%# Eval("MId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_merchantId" runat="server" Text='<%# Eval("MId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
            
        </div>
    </form>
</body>
</html>