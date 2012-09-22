<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="budhashop.UserControls.login" %>
<style type="text/css">


        .style5
        {
            width: 100%;
        }
        .style35
    {
    }
    .style36
    {
        width: 6px;
    }
    .style37
    {
        width: 176px;
    }
    .style38
    {
    }
    .style39
    {
    }
    .style40
    {
        font-size: x-large;
        color: #FF00FF;
        font-weight: bold;
        font-family: "Comic Sans MS";
    }
    .style41
    {
        width: 77px;
    }
</style>
<div>
    <br />
    <table class="style5">
        <tr>
            <td class="style40" colspan="4">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LogIn</td>
        </tr>
        <tr>
            <td class="style41">
            User Name<br />
            (or)
            Email Id</td>
            <td class="style36">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                ControlToValidate="txt_lusername" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
            <td class="style37">
            <asp:TextBox ID="txt_lusername" runat="server" Width="181px"></asp:TextBox>
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="style41">
                Password</td>
            <td class="style36">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                ControlToValidate="txt_lpassword" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
            <td class="style37">
            <asp:TextBox ID="txt_lpassword" runat="server" Width="181px" 
                TextMode="Password"></asp:TextBox>
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="style35" colspan="3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="hyplink_forgotpwd" runat="server" 
                NavigateUrl="~/USER/ForgotPassword.aspx">Fogot Password?</asp:HyperLink>
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="style38" colspan="3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_login" runat="server" Text="Login" ValidationGroup="1" 
                onclick="btn_login_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_lclr" runat="server" Text="Clear" 
                onclick="btn_lclr_Click" />
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="style39" colspan="4">
            <asp:Label ID="lbl_login" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</div>

