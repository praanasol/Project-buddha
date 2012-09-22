<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="budhashop.USER.ForgotPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 5px;
        }
        .style4
        {
            width: 54px;
        }
        .style5
        {
            width: 223px;
        }
        .style8
        {
        }
        .style9
        {
            width: 491px;
        }
        .style10
        {
            width: 90px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <div>
    
        <br />
        <br />
    
        <table class="style1">
            <tr>
                <td class="style10">
                                        Email Id</td>
                <td class="style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txt_femailid" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td class="style4">
            <asp:TextBox ID="txt_femailid" runat="server" 
                Width="181px"></asp:TextBox>
                </td>
                <td class="style9">
                    <asp:Label ID="lbl_femailid" runat="server" ForeColor="Red"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txt_femailid" ErrorMessage="Invalid Email Id Format" 
                        SetFocusOnError="True" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="1"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style10">
                    <br />
                    <br />
                    Enter The Text</td>
                <td class="style3">
                    <br />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txt_captcha" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td class="style4">
                    <asp:Image ID="img_captcha" runat="server" Height="40px" 
                        ImageUrl="~/Captcha/JpegImage.aspx" Width="181px" />
                    <br />
                    <asp:TextBox ID="txt_captcha" runat="server" Width="181px"></asp:TextBox>
                </td>
                <td class="style9">
                    <asp:ImageButton ID="imgbtn_refreshcaptcha" runat="server" Height="20px" 
                        ImageUrl="~/Captcha/Refresh.jpg" onclick="imgbtn_refreshcaptcha_Click" 
                        Width="20px" />
                    <br />
                    <asp:Label ID="lbl_captcha" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style8" colspan="3">
                    <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_fsubmit" runat="server" Text="Submit" onclick="btn_fsubmit_Click" 
                        ValidationGroup="1" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btn_cancel" runat="server" onclick="btn_cancel_Click" 
                        Text="Cancel" />
                </td>
                <td class="style9">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            </table>
    
    </div>
    <p>
            <asp:Label ID="lbl_fsubmit" runat="server" ForeColor="Red"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:HyperLink ID="hyplink_login" runat="server" 
                NavigateUrl="Login_Register.aspx">LogIn</asp:HyperLink>
                </p>
    </form>
</body>
</html>
