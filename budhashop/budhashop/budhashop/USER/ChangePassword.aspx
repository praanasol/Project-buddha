<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="budhashop.USER.ChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
        .style3
        {
            width: 1px;
        }
        .style4
        {
            width: 175px;
        }
        .style5
        {
            width: 285px;
        }
        .style6
        {
            width: 113px;
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
                <td class="style6">
                    Email Id</td>
                <td class="style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txt_emailid" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txt_emailid" runat="server" Width="181px"></asp:TextBox>
                </td>
                <td class="style5">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txt_emailid" ErrorMessage="Invalid Email Id Format" 
                        SetFocusOnError="True" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="1"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    Old Password</td>
                <td class="style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txt_oldpwd" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txt_oldpwd" runat="server" TextMode="Password" Width="181px"></asp:TextBox>
                </td>
                <td class="style5">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    New Password</td>
                <td class="style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txt_newpwd" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txt_newpwd" runat="server" TextMode="Password" Width="181px"></asp:TextBox>
                </td>
                <td class="style5">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                ControlToValidate="txt_newpwd" 
                ErrorMessage="Password Should Contain atleast 7 Characters" 
                SetFocusOnError="True" ValidationExpression="^.*(?=.{7,}).*$" 
                ValidationGroup="1"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style6">
                    Confirm Password</td>
                <td class="style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txt_cnfrmpwd" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td class="style4">
                    <asp:TextBox ID="txt_cnfrmpwd" runat="server" TextMode="Password" Width="181px"></asp:TextBox>
                </td>
                <td class="style5">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txt_newpwd" ControlToValidate="txt_cnfrmpwd" 
                        ErrorMessage="Passwords Do not Match" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:CompareValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2" colspan="5">
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_submit" runat="server" onclick="btn_submit_Click" 
                        Text="Submit" ValidationGroup="1" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" 
                        onclick="btn_cancel_Click" />
                </td>
            </tr>
            <tr>
                <td class="style2" colspan="5">
                    <asp:Label ID="lbl_submit" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
