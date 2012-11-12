<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true"
    CodeBehind="ForgotPassword.aspx.cs" Inherits="budhashop.USER.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="height:500px;">
    <table cellpadding="0" cellspacing="0" width="450" border="0" class="bg_style2" style="margin-top:100px; margin-left:300px;">
     
    <tr>
        <td align="center" valign="middle" colspan="4" style="height: 40px;"><h2 style="color:#f08b11;">Forgot Password</h2></td>
    </tr>
    <tr>
        <td align="center" valign="middle" style="margin-left:20px;">
              <table cellpadding="0" cellspacing="0" width="440" border="0">
    
        <tr>
            <td align="right" valign="middle" style="height: 40px;" class="style1">
                Email Id :
            </td>
            <td align="center" valign="middle">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_femailid"
                    ErrorMessage="*" SetFocusOnError="True" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
            <td align="left" valign="middle">
                <asp:TextBox ID="txt_femailid" CssClass="login_form_style" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td align="center" valign="middle">
                <asp:Label ID="lbl_femailid" runat="server" ForeColor="Red"></asp:Label>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_femailid"
                    ErrorMessage="Invalid Email Id Format" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ValidationGroup="1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right" valign="middle" style="height: 50px;" class="style1">
                Enter The Text :
            </td>
            <td align="left" valign="middle">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_captcha"
                    ErrorMessage="*" SetFocusOnError="True" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
            <td align="left" valign="middle">
                <asp:Image ID="img_captcha" runat="server" Height="40px" ImageUrl="~/Captcha/JpegImage.aspx"
                    Width="181px" />
                <br />
                <asp:TextBox ID="txt_captcha" CssClass="login_form_style" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td align="left" valign="middle">
                <asp:ImageButton ID="imgbtn_refreshcaptcha" runat="server" Height="20px" ImageUrl="~/Captcha/Refresh.jpg"
                    OnClick="imgbtn_refreshcaptcha_Click" Width="20px" />
                <br />
                <asp:Label ID="lbl_captcha" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="middle" colspan="4" style="padding-left:10px; height: 50px;">
                <table cellpadding="0" cellspacing="0" width="  230" border="0">
                    <tr>
                        <td align="right" valign="middle" style="height: 40px;">
                            <asp:Button ID="btn_fsubmit" runat="server" CssClass="l_go" Text="Submit" OnClick="btn_fsubmit_Click"
                                ValidationGroup="1" />
                        </td>
                        <td align="left" valign="middle" style="padding-left: 10px;">
                            <asp:Button ID="btn_cancel" runat="server" CssClass="l_go" OnClick="btn_cancel_Click" Text="Cancel" />
                        </td>
                        <td align="right" valign="middle" id="login_links">
                            
                                <asp:HyperLink ID="hyplink_login" runat="server" NavigateUrl="Login_Register.aspx"
                                Style="float: right;" CssClass="l_links">LogIn...</asp:HyperLink>
                            
                        </td>
                    </tr>
                </table>
            </td>
           
        </tr>
        <tr>
            <td colspan="3" style="height: 15px;">
                <asp:Label ID="lbl_fsubmit" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
        </td>
    </tr>
</table>
</div>
</asp:Content>
