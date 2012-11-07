<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Userregistrations.ascx.cs" Inherits="budhashop.UserControls.Userregistrations" %>
<style type="text/css">

        .style5
        {
            width: 100%;
        background-color: #CCCCFF;
    }
        .style18
        {
            text-align: justify;
            width: 9px;
        }
        .style17
        {
            text-align: justify;
            width: 130px;
        }
        .style15
        {
            text-align: justify;
        }
        .style14
        {
            text-align: justify;
        }
        .style22
    {
        height: 13px;
        text-align: left;
        font-family: "Comic Sans MS";
        font-size: larger;
        color: #FF00FF;
        width: 140px;
    }
    .style24
    {
        text-align: left;
    }
    .style26
    {
        text-align: justify;
        width: 29px;
    }
    .style27
    {
        text-align: left;
    }
    .style28
    {
        text-align: justify;
        width: 3px;
    }
    .style29
    {
        text-align: left;
        width: 81px;
    }
        .style30
    {
        text-align: left;
        font-family: "Comic Sans MS";
        font-size: larger;
        color: #FF00FF;
        font-weight: bold;
    }
    .style31
    {
        text-align: left;
        font-family: "Comic Sans MS";
        font-size: x-large;
        color: #FF00FF;
        font-weight: bold;
    }
    .style32
    {
        font-size: x-large;
    }
        .style33
    {
        text-align: justify;
        width: 140px;
    }
        .style34
    {
        text-align: left;
        font-family: "Comic Sans MS";
        font-size: larger;
        color: #FF00FF;
        font-weight: bold;
        width: 116px;
    }
        .style35
    {
        text-align: justify;
        width: 116px;
    }
        </style>
<body>
<section id="item_area" class="bg_style1">
    <%--<section id="log_panel" class="box_style">
        <!--Login Panel start-->
        <aside id="log_l_panel">
            <div id="p_f_data" class="p_f_box_style">
                            <section id="login_header"><h3>Forgot Password</h3></section>
                            <section id="p_f_fields">
                                <div id="p_f_field_area">
                                    <div id="p_f_label">
                                         User Name<br />
            (or)
            Email Id :<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                ControlToValidate="txt_lusername" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="4"></asp:RequiredFieldValidator></div>
                                    <div id="p_f_field" class="style4">
                                        <asp:TextBox ID="TextBox1" runat="server" Width="181px"></asp:TextBox>
                                    </div>
                                </div>
                                <div id="p_f_field_area">
                                    <div id="p_f_label">
                                        Password :<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                ControlToValidate="txt_lpassword" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="4"></asp:RequiredFieldValidator></div>
                                    <div id="p_f_field" class="style4">
                                        <asp:TextBox ID="TextBox2" runat="server" Width="181px" 
                TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div id="to_right" style="margin:40px 0px 0px 13px;"> <asp:HyperLink ID="hyplink_forgotpwd" runat="server" 
                NavigateUrl="~/USER/ForgotPassword.aspx">Fogot Password?</asp:HyperLink></div>
                             </section>
                             
                             <div id="login_links" style="margin:auto; padding:10px 0px 0px 0px; width:430px; height:60px;">
                                <div id="but_style" style="margin-left:180px;">
                             <asp:Button ID="btn_login" runat="server" Text="Login" ValidationGroup="4" 
                onclick="btn_login_Click" />
                             <asp:Button ID="btn_lclr" runat="server" Text="Clear" 
                onclick="btn_lclr_Click" />
                             </div>
                             
                             </div>
                             
                                    </div>
        </aside>
        <!--Login Panel End-->
        <!--Register Panel Start-->
        <aside id="log_r_panel">
        
        </aside>
        <!--Register Panel End-->
    </section>--%>
    
    
</section>
<table class="style5">
    <tr>
        <td class="style30" colspan="3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="style32">&nbsp; LogIn</span></td>
        <td class="style22">
            </td>
        <td class="style34">
            &nbsp;</td>
        <td class="style30">
            &nbsp;</td>
        <td class="style31" rowspan="2">
            Register</td>
        <td class="style30">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style29" rowspan="2">
            User Name<br />
            (or)
            Email Id</td>
        <td class="style28" rowspan="2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                ControlToValidate="txt_lusername" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="4"></asp:RequiredFieldValidator>
        </td>
        <td class="style26" rowspan="2">
            <asp:TextBox ID="txt_lusername" runat="server" Width="181px"></asp:TextBox>
        </td>
        <td class="style33" rowspan="2">
            &nbsp;</td>
        <td class="style35">
            &nbsp;</td>
        <td class="style18">
            &nbsp;</td>
        <td class="style15">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style35">
            User Name</td>
        <td class="style18">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ControlToValidate="txt_username" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="1"></asp:RequiredFieldValidator>
        </td>
        <td class="style17">
            <asp:TextBox ID="txt_username" runat="server" Width="181px" ValidationGroup="1"></asp:TextBox>
        </td>
        <td class="style15">
            <asp:Button ID="btn_chkuser" runat="server" onclick="btn_chkuser_Click" 
                Text="Check Availability" ValidationGroup="1" Width="115px" 
                EnableTheming="True" />
            <asp:Label ID="lbl_checkuser" runat="server" ForeColor="Red"></asp:Label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txt_username" ErrorMessage="Must Contain 5-20 Charaters" 
                SetFocusOnError="True" ValidationExpression="^[a-zA-Z0-9_.]{5,20}$" 
                ValidationGroup="1"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style29">
            Password</td>
        <td class="style28">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                ControlToValidate="txt_lpassword" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="4"></asp:RequiredFieldValidator>
        </td>
        <td class="style26">
            <asp:TextBox ID="txt_lpassword" runat="server" Width="181px" 
                TextMode="Password"></asp:TextBox>
        </td>
        <td class="style33">
            &nbsp;</td>
        <td class="style35">
            Email ID</td>
        <td class="style18">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                ControlToValidate="txt_emailid" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="2"></asp:RequiredFieldValidator>
        </td>
        <td class="style17">
            <asp:TextBox ID="txt_emailid" runat="server" 
                ValidationGroup="2" Width="181px" Enabled="False"></asp:TextBox>
        </td>
        <td class="style15">
            <asp:Button ID="btn_chkemail" runat="server" Enabled="False" onclick="btn_chkemail_Click" 
                Text="Check Availability" ValidationGroup="2" Width="115px" />
            <asp:Label ID="lbl_checkemail" runat="server" ForeColor="Red"></asp:Label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="txt_emailid" ErrorMessage="Invalid Email Id Format" 
                SetFocusOnError="True" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="2"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style24" colspan="3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="hyplink_forgotpwd" runat="server" 
                NavigateUrl="~/USER/ForgotPassword.aspx">Fogot Password?</asp:HyperLink>
        </td>
        <td class="style33">
            &nbsp;</td>
        <td class="style35">
            Password</td>
        <td class="style18">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                ControlToValidate="txt_password" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="3"></asp:RequiredFieldValidator>
        </td>
        <td class="style17">
            <asp:TextBox ID="txt_password" runat="server" 
                TextMode="Password" Width="181px" ValidationGroup="3" Enabled="False"></asp:TextBox>
        </td>
        <td class="style14">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                ControlToValidate="txt_password" 
                ErrorMessage="Password Should Contain atleast 7 Characters" 
                SetFocusOnError="True" ValidationExpression="^.*(?=.{7,}).*$" 
                ValidationGroup="3"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style24" colspan="3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_login" runat="server" Text="Login" ValidationGroup="4" 
                onclick="btn_login_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_lclr" runat="server" Text="Clear" 
                onclick="btn_lclr_Click" />
        </td>
        <td class="style33">
            </td>
        <td class="style35">
            Confirm Password</td>
        <td class="style18">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                ControlToValidate="txt_cnfmpassword" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="3"></asp:RequiredFieldValidator>
        </td>
        <td class="style17">
            <asp:TextBox ID="txt_cnfmpassword" runat="server" 
                TextMode="Password" Width="181px" ValidationGroup="3" Enabled="False"></asp:TextBox>
        </td>
        <td class="style15">
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="txt_password" ControlToValidate="txt_cnfmpassword" 
                ErrorMessage="Passwords Do not Match" SetFocusOnError="True" 
                ValidationGroup="3"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="style27" colspan="3">
            <asp:Label ID="lbl_login" runat="server" ForeColor="Red"></asp:Label>
        </td>
        <td class="style33">
            &nbsp;</td>
        <td class="style35">
            Phone Number</td>
        <td class="style18">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                ControlToValidate="txt_phno" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="3"></asp:RequiredFieldValidator>
        </td>
        <td class="style17">
            <asp:TextBox ID="txt_phno" runat="server" Width="181px" ValidationGroup="3" 
                Enabled="False"></asp:TextBox>
        </td>
        <td class="style14">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                ControlToValidate="txt_phno" ErrorMessage="Enter Valid 10 digit Mobile Number" 
                SetFocusOnError="True" ValidationExpression="\d{10}" ValidationGroup="3"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style29">
            &nbsp;</td>
        <td class="style28">
            &nbsp;</td>
        <td class="style26">
            &nbsp;</td>
        <td class="style33">
            &nbsp;</td>
        <td class="style35">
            Address</td>
        <td class="style18">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                ControlToValidate="txt_address" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="3"></asp:RequiredFieldValidator>
        </td>
        <td class="style17">
            <asp:TextBox ID="txt_address" runat="server" 
                TextMode="MultiLine" ValidationGroup="3" Enabled="False" Width="181px"></asp:TextBox>
        </td>
        <td class="style14">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style29">
            &nbsp;</td>
        <td class="style28">
            &nbsp;</td>
        <td class="style26">
            &nbsp;</td>
        <td class="style33">
            &nbsp;</td>
        <td class="style35">
            <br />
            Enter The text</td>
        <td class="style18">
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                ControlToValidate="txt_captcha" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="3"></asp:RequiredFieldValidator>
        </td>
        <td class="style17">
            <asp:Image ID="img_captcha" runat="server" Height="40px" 
                ImageUrl="~/Captcha/JpegImage.aspx" Width="181px" />
            <br />
            <asp:TextBox ID="txt_captcha" runat="server" Width="181px" Enabled="False"></asp:TextBox>
        </td>
        <td class="style14">
            <asp:ImageButton ID="imgbtn_refreshcaptcha" runat="server" Height="20px" 
                ImageUrl="~/Captcha/Refresh.jpg"  Width="20px" 
                onclick="imgbtn_refreshcaptcha_Click" />
            <br />
            <asp:Label ID="lbl_captcha" runat="server" ForeColor="Red"></asp:Label>
            <br />
        </td>
    </tr>
    <tr>
        <td class="style29">
            &nbsp;</td>
        <td class="style28">
            &nbsp;</td>
        <td class="style26">
            &nbsp;</td>
        <td class="style33">
            &nbsp;</td>
        <td class="style35">
            Active Status</td>
        <td class="style18">
            &nbsp;</td>
        <td class="style17">
            <asp:CheckBox ID="cb_userstatus" runat="server" />
        </td>
        <td class="style14">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style29" rowspan="2">
            &nbsp;</td>
        <td class="style28" rowspan="2">
            &nbsp;</td>
        <td class="style26" rowspan="2">
            &nbsp;</td>
        <td class="style33" rowspan="2">
            &nbsp;</td>
        <td class="style14" colspan="3" rowspan="2">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_reg" runat="server" Enabled="False" 
                onclick="btn_reg_Click" Text="Register" ValidationGroup="3" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btn_clr" runat="server" onclick="btn_clr_Click" Text="Clear" />
        </td>
        <td class="style14">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style14">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style29">
            &nbsp;</td>
        <td class="style28">
            &nbsp;</td>
        <td class="style26">
            &nbsp;</td>
        <td class="style33">
            &nbsp;</td>
        <td class="style14" colspan="4">
            <asp:Label ID="lbl_register" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
</table>
</body>
