<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="budhashop.Merchant.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Merchant Login Page</title>
    <link href="../Styles/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="div1" style="position:absolute; top:200px; left:550px;">
        <asp:Panel ID="merchantloginpanel" DefaultButton="btn_mLogin" runat="server" Width="265px">
            <br />
            <asp:Label ID="lbl_mId" runat="server" Text="Login Id" Width="60px" style="text-align:right;"></asp:Label>
            <asp:RequiredFieldValidator ID="rfv_mId" runat="server" ControlToValidate="txt_mId" ValidationGroup="mlogin" ErrorMessage="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_mId" runat="server" Width="181px" Height="18px" CssClass="txt_boxes"></asp:TextBox>
            <br />
            <asp:RegularExpressionValidator ID="rev_mId" runat="server" ControlToValidate="txt_mId" ValidationExpression="^([a-zA-Z0-9_\-.@#*]*)$" ValidationGroup="mlogin" ErrorMessage="Enter Valid Id" SetFocusOnError="true" style="margin-left:77px;"></asp:RegularExpressionValidator>
            <br />
            <asp:Label ID="lbl_mPwd" runat="server" Text="Password" Width="60px" style="text-align:right;"></asp:Label>
            <asp:RequiredFieldValidator ID="rfv_mPwd" runat="server" ControlToValidate="txt_mPwd" ValidationGroup="mlogin" ErrorMessage="*" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_mPwd" runat="server" TextMode="Password" Width="181px" Height="18px" CssClass="txt_boxes"></asp:TextBox>
            <br />
            <asp:RegularExpressionValidator ID="rev_mPwd" runat="server" ControlToValidate="txt_mPwd" ValidationExpression="^([a-zA-Z0-9_\s\-.@#*]*)$" ValidationGroup="mlogin" ErrorMessage="Enter Valid Password" SetFocusOnError="true" style="margin-left:77px;"></asp:RegularExpressionValidator>
            <br />
            <asp:Button ID="btn_mLogin" runat="server" Text="Submit" ValidationGroup="mlogin" 
                    onclick="btn_mLogin_Click" CssClass="buttons" style="margin-left:100px;" />
            <br />
            <asp:Label ID="lbl_mStatus" runat="server" ForeColor="Red" Font-Bold="true" style="margin-left:40px;"></asp:Label>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
