<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="merchantLogin.aspx.cs" Inherits="budhashop.merchantLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Merchant Login Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="merchantloginpanel" DefaultButton="btn_mLogin" runat="server">
            <br />
            <asp:Label ID="lbl_mId" runat="server" Text="Login Id:"></asp:Label>
            <asp:RequiredFieldValidator ID="rfv_mId" runat="server" ControlToValidate="txt_mId" ValidationGroup="mlogin" ErrorMessage="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_mId" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="rev_mId" runat="server" ControlToValidate="txt_mId" ValidationExpression="^([a-zA-Z0-9_\-.@#*]*)$" ValidationGroup="mlogin" ErrorMessage="Enter Valid Id" SetFocusOnError="true"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Label ID="lbl_mPwd" runat="server" Text="Password:"></asp:Label>
            <asp:RequiredFieldValidator ID="rfv_mPwd" runat="server" ControlToValidate="txt_mPwd" ValidationGroup="mlogin" ErrorMessage="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_mPwd" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RegularExpressionValidator ID="rev_mPwd" runat="server" ControlToValidate="txt_mPwd" ValidationExpression="^([a-zA-Z0-9_\s\-.@#*]*)$" ValidationGroup="mlogin" ErrorMessage="Enter Valid Password" SetFocusOnError="true"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Button ID="btn_mLogin" runat="server" Text="Submit" ValidationGroup="mlogin" onclick="btn_mLogin_Click" />
            <br />
            <asp:Label ID="lbl_mStatus" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
        </asp:Panel>
    </form>
</body>
</html>