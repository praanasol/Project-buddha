<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true"
    CodeBehind="ForgotPassword.aspx.cs" Inherits="budhashop.USER.ForgotPassword" Title="Forgot password  - Go Vedic - Online Shopping - Traditional and Natural Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style6
        {
            margin-top: 3px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            color: #dc8619;
            font-weight: bold;
            text-decoration: none;
            height: 40px;
            width: 101px;
        }
        .style7
        {
            margin-top: 3px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 13px;
            color: #dc8619;
            font-weight: bold;
            text-decoration: none;
            height: 50px;
            width: 101px;
        }
        .style8
        {
            width: 182px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="forgotpwdpanel" DefaultButton="btn_fsubmit" runat="server">
        <div style="height:400px;">
            <table cellpadding="0" cellspacing="0" width="450" border="0" class="main_box_style" style="margin-top:100px; margin-left:260px;">
             
            <tr>
                <td align="center" valign="middle" colspan="4" style="height: 40px;"><h3>Forgot Password: </h3><br />Password will be sent to your registered email id.</td>
         
            </tr>
            <tr>
                <td align="center" valign="middle" style="margin-left:20px;">
                      <table cellpadding="0" cellspacing="0" width="440" border="0">
            
                <tr>
                    <td align="right" valign="top" class="style7">
                        <br />
                       <h3 style="font-size:12px;">Enter Email id :</h3>
                    </td>
                    <td align="center" valign="middle">
                        &nbsp;</td>
                    <td align="left" valign="middle" class="style8">
                        <br />
                        <asp:TextBox ID="txt_femailid" CssClass="login_form_style" runat="server" Width="180px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfv1" runat="server" Font-Bold="true"
                            ControlToValidate="txt_femailid" ErrorMessage="Empty Field" SetFocusOnError="True" 
                            ValidationGroup="1"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev1" runat="server" 
                            ControlToValidate="txt_femailid" ErrorMessage="Invalid Email Id Format" 
                            SetFocusOnError="True" style="margin-left:-65px;" Font-Bold="true"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="1"></asp:RegularExpressionValidator>
                    </td>
                    <td align="left" valign="middle">
                        <asp:Label ID="lbl_femailid" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="middle" class="style7">
                        <br />
                        <h3 style="font-size:12px;">Enter the text :</h3>
                    </td>
                    <td align="left" valign="middle">
                        &nbsp;</td>
                    <td align="left" valign="middle" class="style8">
                        <asp:Image ID="img_captcha" runat="server" Height="40px" ImageUrl="~/Captcha/JpegImage.aspx"
                            Width="181px" />
                        <br />
                        <asp:TextBox ID="txt_captcha" CssClass="login_form_style" runat="server" Width="180px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="rfv2" runat="server" Font-Bold="true"
                                      ControlToValidate="txt_captcha" ErrorMessage="Empty Field" SetFocusOnError="True" 
                                      ValidationGroup="1"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev2" runat="server"
                            ControlToValidate="txt_captcha" ErrorMessage="Enter Correct Captcha" 
                            SetFocusOnError="True" style="margin-left:-65px;" Font-Bold="true"
                            ValidationExpression="^[a-zA-Z0-9]+$" 
                            ValidationGroup="1"></asp:RegularExpressionValidator>
                    </td>
                    <td align="left" valign="top">
                        <asp:ImageButton ID="imgbtn_refreshcaptcha" runat="server" Height="30px" ImageUrl="~/Captcha/Refresh.png"
                            OnClick="imgbtn_refreshcaptcha_Click" Width="30px" />
                        <br />
                        <br />
                        <asp:Label ID="lbl_captcha" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
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
                                
                            </tr>
                        </table>
                    </td>
                   
                </tr>
                <tr>
                    <td colspan="3" style="height: 15px;">
                        <asp:Label ID="lbl_fsubmit" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
            </table>
                </td>
            </tr>
        </table>
        </div>
    </asp:Panel>
</asp:Content>
