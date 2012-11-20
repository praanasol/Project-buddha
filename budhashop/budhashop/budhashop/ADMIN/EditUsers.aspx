<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUsers.aspx.cs" Inherits="budhashop.ADMIN.EditUsers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
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
    
        <asp:TextBox ID="txt_username" placeholder="Enter UserName/EmailId/UserId"
                                        runat="server" Width="200px" Height="25px"></asp:TextBox>
        <asp:Button ID="btn_search" runat="server" Text="Search" 
            onclick="btn_search_Click" />        
    
    </div>
    <asp:Label ID="lbl_status" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    <br />
    <asp:GridView ID="userGrid" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" GridLines="Vertical" 
        onrowcancelingedit="userGrid_RowCancelingEdit" 
        onrowdeleting="userGrid_RowDeleting" onrowediting="userGrid_RowEditing" 
        onrowupdating="userGrid_RowUpdating" DataKeyNames="Uid,UserName,PWD">
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <Columns>
            <asp:TemplateField HeaderText="Action">
                <EditItemTemplate>
                    &nbsp;<asp:LinkButton ID="lb_update" runat="server" CommandName="Update" 
                        ValidationGroup="1">Update</asp:LinkButton>
&nbsp;
                    <asp:LinkButton ID="lb_cancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lb_edit" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                    &nbsp;
                    <asp:LinkButton ID="lb_remove" runat="server" CommandName="Delete">Remove</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User Id">
                <EditItemTemplate>
                    <asp:Label ID="lbl_edituid" runat="server" Text='<%# Eval("Uid") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_uid" runat="server" Text='<%# Eval("Uid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="User Name">
                <EditItemTemplate>
                    <asp:Label ID="lbl_edituname" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_uname" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password">
                <EditItemTemplate>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txt_editpwd" ErrorMessage="*" ToolTip="Can Not be Empty" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txt_editpwd" runat="server" Text='<%# Eval("PWD") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="txt_editpwd" ErrorMessage="*" SetFocusOnError="True" 
                        ToolTip="Password Should Contain atleast 7 Characters" 
                        ValidationExpression="^.*(?=.{7,}).*$" ValidationGroup="1"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_pwd" runat="server" Text='<%# Eval("PWD") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email Id">
                <EditItemTemplate>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txt_editemailid" ErrorMessage="*" ToolTip="Can Not be Empty" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txt_editemailid" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txt_editemailid" ErrorMessage="*" SetFocusOnError="True" 
                        ToolTip="Invalid Email Id Format" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="1"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_emailid" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone Number">
                <EditItemTemplate>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txt_editphno" ErrorMessage="*" ToolTip="Can Not be Empty" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txt_editphno" runat="server" Text='<%# Eval("Phone") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="txt_editphno" ErrorMessage="*" SetFocusOnError="True" 
                        ToolTip="Enter Valid 10 digit Mobile Number" ValidationExpression="\d{10}" 
                        ValidationGroup="1"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_phno" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address">
                <EditItemTemplate>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txt_editaddress" ErrorMessage="*" ToolTip="Can Not be Empty" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txt_editaddress" runat="server" Text='<%# Eval("Address") %>' 
                        TextMode="MultiLine"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:TextBox ID="txt_address" runat="server" ReadOnly="True" 
                        Text='<%# Eval("Address") %>' TextMode="MultiLine"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Active Status">
                <EditItemTemplate>
                    <asp:CheckBox ID="cb_editactvsts" runat="server" 
                        Checked='<%# Eval("ActvSts") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="cb_actvsts" runat="server" Checked='<%# Eval("ActvSts") %>' 
                        Enabled="False" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="Gainsboro" />
    </asp:GridView>
    </form>
</body>
</html>
