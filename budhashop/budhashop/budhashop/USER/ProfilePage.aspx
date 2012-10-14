<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="budhashop.USER.ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .style1
        {
            text-align: center;
        }
        .style43
        {
            text-align: left;
        }
    </style>
    <script type="text/javascript">
    $("#ctl00_cartCtrl_signin").hide();
                              
                              
    
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <table id="tbl" class="style1" align="center">
            <tr>
                <td>
                    Email Id:</td>
                <td>
                    &nbsp;</td>
                <td>
            <asp:TextBox ID="txt_emailid" runat="server" 
                Width="181px" ReadOnly="True"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td class="style43">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Name:</td>
                <td>
            <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="*" 
                ControlToValidate="txt_uname" SetFocusOnError="True" ValidationGroup="name"></asp:RequiredFieldValidator>
                </td>
                <td style="margin-left: 40px">
                <asp:TextBox ID="txt_uname" runat="server" Width="181px"></asp:TextBox>
                </td>
                <td style="margin-left: 40px">
                <asp:Button ID="btn_updateemail" runat="server" Text="Update" 
                    ValidationGroup="name" />
                </td>
                <td style="margin-left: 40px" class="style43">
            <asp:Label ID="lbl_name" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Phone Num:</td>
                <td>
            <asp:RequiredFieldValidator ID="rfv2" runat="server" 
                ControlToValidate="txt_phno" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="phno"></asp:RequiredFieldValidator>
                </td>
                <td>
            <asp:TextBox ID="txt_phno" runat="server" Width="181px"></asp:TextBox>
                </td>
                <td>
                <asp:Button ID="btn_updatephno" runat="server" Text="Update" 
                    ValidationGroup="phno" />
                </td>
                <td class="style43">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="txt_phno" ErrorMessage="Enter Valid 10 digit Mobile Number" 
                SetFocusOnError="True" ValidationExpression="\d{10}" ValidationGroup="phno"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Address:</td>
                <td>
            <asp:RequiredFieldValidator ID="rfv3" runat="server" 
                ControlToValidate="txt_address" ErrorMessage="*" SetFocusOnError="True" 
                    ValidationGroup="address"></asp:RequiredFieldValidator>
                </td>
                <td>
            <asp:TextBox ID="txt_address" runat="server" 
                TextMode="MultiLine" ValidationGroup="3" Width="181px"></asp:TextBox>
                </td>
                <td>
                <asp:Button ID="btn_updateaddress" runat="server" Text="Update" 
                    ValidationGroup="address" />
                </td>
                <td class="style43">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style43" colspan="5">
            <asp:Label ID="lbl_status" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
</asp:Content>
