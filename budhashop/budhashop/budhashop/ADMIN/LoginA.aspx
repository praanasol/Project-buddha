<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginA.aspx.cs" Inherits="budhashop.ADMIN.LoginA" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Login Page</title>
    
    <link href="../Styles/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="div1" style="position:absolute; top:200px; left:550px;">
        <asp:Panel ID="merchantloginpanel" DefaultButton="btn_submit" runat="server" Width="265px">
            <br />
                <asp:Label ID="lbl_email" runat="server" Text="Email Id" Width="60px" style="text-align:right;"></asp:Label>
                <asp:RequiredFieldValidator ID="rfv_email" runat="server" 
                    ControlToValidate="txt_username" ErrorMessage="*" SetFocusOnError="True" 
                    ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txt_username" runat="server" Width="181px" Height="18px" CssClass="txt_boxes"></asp:TextBox>
            <br />
            <br />
                <asp:Label ID="lbl_pwd" runat="server" Text="Password" Width="60px" style="text-align:right;"></asp:Label>
                <asp:RequiredFieldValidator ID="rfv2" runat="server" 
                    ControlToValidate="txt_password" ErrorMessage="*" SetFocusOnError="True" 
                    ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txt_password" runat="server" Width="181px" Height="18px" TextMode="Password" CssClass="txt_boxes"></asp:TextBox>
            <br />
            <br />
                <asp:Button ID="btn_submit" runat="server" Text="Submit" 
                    ValidationGroup="submit" onclick="btn_submit_Click" CssClass="buttons" style="margin-left:100px;" />
            <br />
                <asp:Label ID="lbl_submit" runat="server" ForeColor="Red" style="margin-left:45px;"></asp:Label>
        </asp:Panel>    
        </div>
    </form>
</body>
</html>