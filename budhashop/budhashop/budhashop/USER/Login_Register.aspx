<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true"
    CodeBehind="Login_Register.aspx.cs" Inherits="budhashop.USER.Login_Register" %>

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
<div style="padding-top:35px; width:1000px; height:543px;">

<div id="box_header" style="width:100%;">
    	<h2>Login and New User Registration...</h2>
      
    </div>
   
    <!--Login and Register panel Start-->
    <section id="log_panel" class="box_style">
    
        <!--Login panel Start-->
        <aside id="log_l_panel">
            <div id="loginDiv" style="width: 400px; height: 200px;">
                <section id="login_header">
                    <h3>
                        Login</h3>
                </section>
                <section id="p_f_fields" style="width: 380px; height: 75px;">
                    <div id="p_f_field_area" style="width: 380px; height: 30px;">
                        <div id="p_f_label" style="margin-top: 2px; padding-top: 5px; width: 80px;">
                            Email Id :</div>
                        <div id="but_style" style="height: 20px; padding: 11px 0px 0px 2px; text-align: center;">
                            <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txt_lusername"
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="login"></asp:RequiredFieldValidator>
                        </div>
                        <div id="p_f_field" class="style4" style="padding-top: 4px;">
                            <asp:TextBox ID="txt_lusername" CssClass="p_f_form_style" runat="server" Width="181px"
                                ValidationGroup="login"></asp:TextBox>
                        </div>
                    </div>
                    <div id="p_f_field_area" style="width: 380px; height: 30px;">
                        <div id="p_f_label" style="margin-top: 2px; padding-top: 5px; width: 80px;">
                            Password :</div>
                        <div id="but_style" style="height: 20px; padding: 11px 0px 0px 2px; text-align: center;">
                            <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txt_lpassword"
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="login"></asp:RequiredFieldValidator>
                        </div>
                        <div id="p_f_field" class="style4" style="padding-top: 4px;">
                            <asp:TextBox ID="txt_lpassword" CssClass="p_f_form_style" runat="server" Width="181px"
                                ValidationGroup="login"></asp:TextBox>
                        </div>
                    </div>
                </section>
                <div id="login_links1" style="margin: auto; padding-left: 35px; width: 200px; height: 70px;
                    clear: both;">
                    <asp:HyperLink ID="hyplink_forgotpwd" runat="server" CssClass="l_links1" NavigateUrl="~/USER/ForgotPassword.aspx">Fogot Password?</asp:HyperLink><br />
                    <br />
                    <div id="but_style" style="width: 200px;">
                        <asp:Button ID="btn_login" CssClass="l_go" runat="server" Text="Login" ValidationGroup="login"
                            OnClick="btn_login_Click" />
                        <asp:Button ID="btn_lclr" CssClass="l_go" runat="server" Text="Clear" OnClick="btn_lclr_Click" /><br />
                         <asp:Label ID="lbl_login" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                </div>
            </div>
        </aside>
        <!--Login panel End-->
        <aside id="v_devide"></aside>
        <!-- Register Panel Start-->
        <aside id="log_r_panel">
            <div id="registerDiv" style="width: 500px; height: 390px;">
                <section id="login_header">
                    <h3>
                        Register</h3>
                </section>
                <section id="p_f_fields" style="margin:auto; width: 500px; height: 270px;">
                    <div id="p_f_field_area" style="width: 490px; height: 30px;">
                        <div id="p_f_label" style="margin-top: 2px; padding-top: 5px; width: 150px;">
                            User Name :</div>
                        <div id="but_style" style="height: 20px; padding: 11px 0px 0px 2px; text-align: center;">
                            <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txt_username"
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="register"></asp:RequiredFieldValidator>
                        </div>
                        <div id="p_f_field" class="style4" style="padding-top: 4px;">
                            <asp:TextBox ID="txt_username" CssClass="p_f_form_style" runat="server" Width="181px" ValidationGroup="register"></asp:TextBox>
                        </div>
                    </div>
                    <div id="p_f_field_area" style="width: 490px; height: 35px;">
                        <div id="p_f_label" style="margin-top: 2px; padding-top: 5px; width: 150px;">
                            Email Id :</div>
                        
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                   <div id="but_style" style="height: 20px; padding: 11px 0px 0px 2px; text-align: center;">
                                    <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txt_emailid"
                                        ErrorMessage="*" SetFocusOnError="True" ValidationGroup="register"></asp:RequiredFieldValidator>
                                    </div>
                                    <div id="p_f_field" class="style4" style="padding-top: 4px;">
                                        <asp:TextBox ID="txt_emailid" CssClass="p_f_form_style" runat="server" Width="181px" AutoPostBack="True" OnTextChanged="txt_emailid_TextChanged"
                                            ValidationGroup="register"></asp:TextBox>
                                        <asp:Image ID="imgEmail" runat="server" Visible="false" />
                                        <asp:Label ID="lbl_checkemail" runat="server" ForeColor="Red"></asp:Label>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        
                    </div>
                    <div id="p_f_field_area" style="width: 490px; height: 30px;">
                        <div id="p_f_label" style="margin-top: 2px; padding-top: 5px; width: 150px;">
                            Password :</div>
                        <div id="but_style" style="height: 20px; padding: 11px 0px 0px 2px; text-align: center;">
                            <asp:RequiredFieldValidator ID="rfv5" runat="server" ControlToValidate="txt_password"
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="register"></asp:RequiredFieldValidator>
                        </div>
                        <div id="p_f_field" class="style4" style="padding-top: 4px;">
                            <asp:TextBox ID="txt_password" CssClass="p_f_form_style" runat="server" TextMode="Password" Width="181px" ValidationGroup="register"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="rev2" runat="server" ControlToValidate="txt_password"
                                ErrorMessage="Password Should Contain atleast 5 Characters" SetFocusOnError="True"
                                ValidationExpression="^.*(?=.{5,}).*$" ValidationGroup="register"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div id="p_f_field_area" style="width: 490px; height: 110px;">
                        <div id="p_f_label" style="margin-top: 2px; padding-top: 5px; width: 150px;">
                            Confirm Password :</div>
                        <div id="but_style" style="height: 10px; padding: 11px 0px 0px 2px; text-align: center;">
                            <asp:RequiredFieldValidator ID="rfv6" runat="server" ControlToValidate="txt_cnfmpassword"
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="register"></asp:RequiredFieldValidator>
                        </div>
                        <div id="p_f_field" class="style4" style="padding-top: 4px;">
                            <asp:TextBox ID="txt_cnfmpassword" CssClass="p_f_form_style" runat="server" TextMode="Password" Width="181px"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_password"
                                ControlToValidate="txt_cnfmpassword" ErrorMessage="Passwords Do not Match" SetFocusOnError="True"
                                ValidationGroup="register"></asp:CompareValidator>
                            <asp:Image ID="img_captcha" runat="server" Height="40px" ImageUrl="~/Captcha/JpegImage.aspx"
                                Width="181px" />
                            <asp:ImageButton ID="imgbtn_refreshcaptcha" runat="server" Height="30px" ImageUrl="~/Captcha/Refresh.png"
                                Width="30px" OnClick="imgbtn_refreshcaptcha_Click" />
                        </div>
                    </div>
                    <div id="p_f_field_area" style="width: 490px; height: 50px;">
                        <div id="p_f_label" style="margin-top: 2px; padding-top: 5px; width: 150px;">
                            Enter Text :</div>
                        <div id="but_style" style="height: 20px; padding: 11px 0px 0px 2px; text-align: center;">
                            <asp:RequiredFieldValidator ID="rfv7" runat="server" ControlToValidate="txt_captcha"
                                ErrorMessage="*" SetFocusOnError="True" ValidationGroup="register"></asp:RequiredFieldValidator>
                        </div>
                        <div id="p_f_field" class="style4" style="padding-top: 4px;">
                            <asp:TextBox ID="txt_captcha" CssClass="p_f_form_style" runat="server" Width="181px" ValidationGroup="register"></asp:TextBox>
                            
                        </div><br />
                        <div style="margin:5px 0px 0px 0px;">
                            <asp:Label ID="lbl_captcha" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                    </div>
                </section>
                <div id="login_links1" style="margin: auto; padding-left: 35px; width: 200px; height: 70px;
                    clear: both;">
                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="l_links1" NavigateUrl="~/USER/ForgotPassword.aspx">Fogot Password?</asp:HyperLink><br />
                    <br />
                    <div id="but_style" style="width: 200px;">
                        <asp:Button ID="btn_reg" CssClass="l_go" runat="server" OnClick="btn_reg_Click" Text="Register"
                            ValidationGroup="register" />
                        <asp:Button ID="btn_clr" CssClass="l_go" runat="server" OnClick="btn_clr_Click" Text="Clear" />
                        <br />
                        <asp:Label ID="lbl_register" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                </div>
            </div>
        </aside>
        <!--Register Panel End-->
    </section>
    <!--Login and Register panel End-->
</div>
    <%--<div id="loginDiv" style="width:auto; float:left;">
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
        
    </div>--%>
    <%--<div id="registerDiv" style="width:auto; float:left;">
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
        
    </div>--%>
</asp:Content>
