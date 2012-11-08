<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="Login_Register.aspx.cs" Inherits="budhashop.USER.Login_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function() {
            
        });
        function moveCursorToEnd()
        {
            var emailtext = $("#txt_emailid").text();
            $("#txt_emailid").text('');
            $("#txt_emailid").focus();
            $("#txt_emailid").text(emailtext);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="loginDiv" style="width:auto; float:left;">
        Login<br />
        <br />
        Email Id:
            <asp:RequiredFieldValidator ID="rfv1" runat="server" 
                ControlToValidate="txt_lusername" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="login"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_lusername" runat="server" Width="181px" 
                ValidationGroup="login"></asp:TextBox>
        <br />
        Password:
            <asp:RequiredFieldValidator ID="rfv2" runat="server" 
                ControlToValidate="txt_lpassword" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="login"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_lpassword" runat="server" Width="181px" 
                    TextMode="Password" ValidationGroup="login"></asp:TextBox>
        <br />
            <asp:HyperLink ID="hyplink_forgotpwd" runat="server" 
                NavigateUrl="~/USER/ForgotPassword.aspx">Fogot Password?</asp:HyperLink>
        <br />
            <asp:Button ID="btn_login" runat="server" Text="Login" ValidationGroup="login" 
                onclick="btn_login_Click" />
            <asp:Button ID="btn_lclr" runat="server" Text="Clear" 
                onclick="btn_lclr_Click" />
        <br />
            <asp:Label ID="lbl_login" runat="server" ForeColor="Red"></asp:Label>
        
    </div>
    
    <div id="registerDiv" style="width:auto; float:left;">
        Register<br />
        <br />
        User Name:
            <asp:RequiredFieldValidator ID="rfv3" runat="server" 
                ControlToValidate="txt_username" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="register"></asp:RequiredFieldValidator>
        
            <asp:TextBox ID="txt_username" runat="server" Width="181px" 
                ValidationGroup="register"></asp:TextBox>
        <br />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            Email Id:
                <asp:RequiredFieldValidator ID="rfv4" runat="server" 
                    ControlToValidate="txt_emailid" ErrorMessage="*" SetFocusOnError="True" 
                    ValidationGroup="register"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txt_emailid" runat="server" Width="181px" 
                    AutoPostBack="True" ontextchanged="txt_emailid_TextChanged" 
                    ValidationGroup="register"></asp:TextBox>
                <asp:Image ID="imgEmail" runat="server" Visible="false" />
                <asp:Label ID="lbl_checkemail" runat="server" ForeColor="Red"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
        Password:
            <asp:RequiredFieldValidator ID="rfv5" runat="server" 
                ControlToValidate="txt_password" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="register"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_password" runat="server" 
                TextMode="Password" Width="181px" ValidationGroup="register"></asp:TextBox>
            <asp:RegularExpressionValidator ID="rev2" runat="server" 
                ControlToValidate="txt_password" 
                ErrorMessage="Password Should Contain atleast 5 Characters" 
                SetFocusOnError="True" ValidationExpression="^.*(?=.{5,}).*$" 
                ValidationGroup="register"></asp:RegularExpressionValidator>
        <br />
        Confirm Password:
            <asp:RequiredFieldValidator ID="rfv6" runat="server" 
                ControlToValidate="txt_cnfmpassword" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="register"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_cnfmpassword" runat="server" 
                TextMode="Password" Width="181px"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txt_password" ControlToValidate="txt_cnfmpassword" 
                ErrorMessage="Passwords Do not Match" SetFocusOnError="True" 
                ValidationGroup="register"></asp:CompareValidator>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Image ID="img_captcha" runat="server" Height="40px" 
                ImageUrl="~/Captcha/JpegImage.aspx" Width="181px" />
            <asp:ImageButton ID="imgbtn_refreshcaptcha" runat="server" Height="20px" 
                ImageUrl="~/Captcha/Refresh.jpg"  Width="20px" 
                onclick="imgbtn_refreshcaptcha_Click" />
            <br />
        Enter Text:
            <asp:RequiredFieldValidator ID="rfv7" runat="server" 
                ControlToValidate="txt_captcha" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="register"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txt_captcha" runat="server" Width="181px" 
                ValidationGroup="register"></asp:TextBox>
            <asp:Label ID="lbl_captcha" runat="server" ForeColor="Red"></asp:Label>
        <br />
            <asp:Button ID="btn_reg" runat="server" 
                onclick="btn_reg_Click" Text="Register" ValidationGroup="register" />
            <asp:Button ID="btn_clr" runat="server" onclick="btn_clr_Click" Text="Clear" />
        <br />
            <asp:Label ID="lbl_register" runat="server" ForeColor="Red"></asp:Label>
        
    </div>
    
</asp:Content>
