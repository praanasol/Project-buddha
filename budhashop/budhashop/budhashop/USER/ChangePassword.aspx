<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="budhashop.USER.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <table align="center">
            <tr>
                <td>Email Id</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txt_emailid" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txt_emailid" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txt_emailid" ErrorMessage="Invalid Email Id Format" 
                        SetFocusOnError="True" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="1"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Old Password</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txt_oldpwd" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txt_oldpwd" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>New Password</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txt_newpwd" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txt_newpwd" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="txt_newpwd" 
                        ErrorMessage="Password Should Contain atleast 5 Characters" 
                        SetFocusOnError="True" ValidationExpression="^.*(?=.{5,}).*$" 
                        ValidationGroup="1"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Confirm Password</td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txt_cnfrmpwd" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txt_cnfrmpwd" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txt_newpwd" ControlToValidate="txt_cnfrmpwd" 
                        ErrorMessage="Passwords Do not Match" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:Button ID="btn_submit" runat="server" onclick="btn_submit_Click" 
                            Text="Submit" ValidationGroup="1" />
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" 
                        onclick="btn_cancel_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="3" align="center">
                    <asp:Label ID="lbl_submit" ForeColor="Red" Font-Bold="true" runat="server"></asp:Label>
                </td>
            </tr>
        </table>

</asp:Content>       
