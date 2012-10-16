<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="budhashop.USER.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <table align="center">
            <tr>
                <td>Email Id</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txt_femailid" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txt_femailid" runat="server" 
                        Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="lbl_femailid" runat="server" ForeColor="Red"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txt_femailid" ErrorMessage="Invalid Email Id Format" 
                        SetFocusOnError="True" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="1"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    <br />
                    Enter The Text</td>
                <td>
                    <br />
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txt_captcha" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Image ID="img_captcha" runat="server" Height="40px" 
                        ImageUrl="~/Captcha/JpegImage.aspx" Width="181px" />
                    <br />
                    <asp:TextBox ID="txt_captcha" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:ImageButton ID="imgbtn_refreshcaptcha" runat="server" Height="20px" 
                        ImageUrl="~/Captcha/Refresh.jpg" onclick="imgbtn_refreshcaptcha_Click" 
                        Width="20px" />
                    <br />
                    <asp:Label ID="lbl_captcha" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button ID="btn_fsubmit" runat="server" Text="Submit" onclick="btn_fsubmit_Click" 
                                ValidationGroup="1" />
                    <asp:Button ID="btn_cancel" runat="server" onclick="btn_cancel_Click" 
                        Text="Cancel" />
                    <asp:HyperLink ID="hyplink_login" runat="server" NavigateUrl="Login_Register.aspx" style="float:right;">LogIn >></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="lbl_fsubmit1" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
    </table>

</asp:Content>
