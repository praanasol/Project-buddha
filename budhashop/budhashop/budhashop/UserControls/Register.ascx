<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Register.ascx.cs" Inherits="budhashop.UserControls.Register" %>


<table id="RegisterControl">
    <tr>
        <td style="text-align: center">
            New User Registration</td>
    </tr>
    <tr>
        <td style="text-align: center">
    <asp:TextBox ID="txt_emailid" runat="server" Placeholder="Email Id" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
    <asp:TextBox ID="txt_pwd" runat="server" TextMode="Password" placeholder="Password" 
                Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
    <asp:TextBox ID="txt_confirmpwd" runat="server" TextMode="Password" 
                placeholder="Confirm Password" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
    <asp:Button ID="btn_register" runat="server" Text="Register" />
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
    <a href="#" id="hyplink_login">Login</a>
        </td>
    </tr>
</table>
