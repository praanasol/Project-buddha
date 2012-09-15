<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditItem.aspx.cs" Inherits="budhashop.ADMIN.EditItem" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
           
        <br />
        Select Catagory:
        <asp:DropDownList ID="ddl_catagory" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ddl_catagory_SelectedIndexChanged">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txt_itemname" Text="Enter Item Name/Id"
                                        onfocus="if(this.value=='Enter Item Name/Id')this.value='';"
                                        onblur="if(this.value=='')this.value='Enter Item Name/Id';"
                                        runat="server" Width="168px"></asp:TextBox>
        <asp:Button ID="btn_search" runat="server" Text="Search" 
            onclick="btn_search_Click" />        
        <br />
        <br />
        <asp:Label ID="lbl_status" runat="server" ForeColor="Red" 
            style="font-weight: 700"></asp:Label>
        <br />
        <asp:GridView ID="itemGrid" runat="server" AutoGenerateColumns="False" 
            onrowcancelingedit="itemGrid_RowCancelingEdit" onrowdeleting="itemGrid_RowDeleting" 
            onrowediting="itemGrid_RowEditing" onrowupdating="itemGrid_RowUpdating" 
            DataKeyNames="ItemId" AllowPaging="True" 
            onpageindexchanging="itemGrid_PageIndexChanging" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            ForeColor="Black" GridLines="Vertical">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
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
                        <asp:TextBox ID="txt_iname" runat="server" Text='<%# Eval("ItemName") %>' 
                            Height="22px" Width="128px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" 
                            ControlToValidate="txt_iname" ErrorMessage="*" SetFocusOnError="True" 
                            ValidationGroup="update"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_iname" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_editidescr" runat="server" 
                            Text='<%# Eval("Description") %>' TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv2" runat="server" 
                            ControlToValidate="txt_editidescr" ErrorMessage="*" SetFocusOnError="True" 
                            ValidationGroup="update"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txt_idescr" runat="server" 
                            Text='<%# Eval("Description") %>' 
                            TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <EditItemTemplate>
                        <asp:FileUpload ID="fu_iimage" runat="server" Width="150px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="img_iimage" runat="server" Height="40px" 
                            ImageUrl='<%# Eval("ImagePath") %>' Width="50px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Catagory Id">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_cid" runat="server" Text='<%# Eval("CategoryId") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv3" runat="server" 
                            ControlToValidate="txt_cid" ErrorMessage="*" SetFocusOnError="True" 
                            ValidationGroup="update"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_cid" runat="server" Text='<%# Eval("CategoryId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Billed Rate">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_billedrate" runat="server" 
                            Text='<%# Eval("BilledRate") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv4" runat="server" 
                            ControlToValidate="txt_billedrate" ErrorMessage="*" SetFocusOnError="True" 
                            ValidationGroup="update"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_billedrate" runat="server" Text='<%# Eval("BilledRate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_qty" runat="server" Text='<%# Eval("Qty") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv5" runat="server" 
                            ControlToValidate="txt_qty" ErrorMessage="*" SetFocusOnError="True" 
                            ValidationGroup="update"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_qty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Net Rate">
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_netrate" runat="server" Text='<%# Eval("NetRate") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv6" runat="server" 
                            ControlToValidate="txt_netrate" ErrorMessage="*" SetFocusOnError="True" 
                            ValidationGroup="update"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_netrate" runat="server" Text='<%# Eval("NetRate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lb_update" runat="server" CommandName="Update" 
                            ValidationGroup="update">Update</asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="lb_cancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lb_edit" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                        &nbsp;
                        <asp:LinkButton ID="lb_remove" runat="server" CommandName="Delete"                                    
                            
                            OnClientClick="return confirm('Are you Sure you want to Remove this Item');">Remove</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
           
    </div>
    </form>
</body>
</html>
