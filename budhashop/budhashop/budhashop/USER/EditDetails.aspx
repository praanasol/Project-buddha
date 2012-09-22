<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditDetails.aspx.cs" Inherits="budhashop.USER.EditDetails" %>

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
            width: 176px;
        }
        .style4
        {
            width: 99px;
        }
        .style5
        {
            width: 4px;
        }
        .style6
        {
            width: 15px;
        }
        .style7
        {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div></div>
    <br />
    <table class="style1">
        <tr>
            <td class="style4">
                User Name</td>
            <td class="style5"></td>
            <td class="style2">
            <asp:TextBox ID="txt_uname" runat="server" Width="181px"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:Button ID="btn_retrieve" runat="server" onclick="btn_retrieve_Click" 
                    Text="Retrieve" />
            </td>
            <td class="style7"></td>
        </tr>
        <tr>
            <td class="style4">
                Email Id</td>
            <td class="style5">
            <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="*" 
                ControlToValidate="txt_emailid" SetFocusOnError="True" ValidationGroup="email"></asp:RequiredFieldValidator>
            </td>
            <td class="style2">
            <asp:TextBox ID="txt_emailid" runat="server" 
                Width="181px"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:Button ID="btn_updateemail" runat="server" Text="Update" 
                    ValidationGroup="email" onclick="btn_updateemail_Click" />
            </td>
            <td class="style7">
            <asp:Label ID="lbl_checkemail" runat="server" ForeColor="Red"></asp:Label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txt_emailid" ErrorMessage="Invalid Email Id Format" 
                SetFocusOnError="True" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="email"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Phone Number</td>
            <td class="style5">
            <asp:RequiredFieldValidator ID="rfv2" runat="server" 
                ControlToValidate="txt_phno" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="phno"></asp:RequiredFieldValidator>
            </td>
            <td class="style2">
            <asp:TextBox ID="txt_phno" runat="server" Width="181px"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:Button ID="btn_updatephno" runat="server" Text="Update" 
                    ValidationGroup="phno" />
            </td>
            <td class="style7">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="txt_phno" ErrorMessage="Enter Valid 10 digit Mobile Number" 
                SetFocusOnError="True" ValidationExpression="\d{10}" ValidationGroup="phno"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Address</td>
            <td class="style5">
            <asp:RequiredFieldValidator ID="rfv3" runat="server" 
                ControlToValidate="txt_address" ErrorMessage="*" SetFocusOnError="True" 
                    ValidationGroup="address"></asp:RequiredFieldValidator>
            </td>
            <td class="style2">
            <asp:TextBox ID="txt_address" runat="server" 
                TextMode="MultiLine" ValidationGroup="3" Width="181px"></asp:TextBox>
            </td>
            <td class="style6">
                <asp:Button ID="btn_updateaddress" runat="server" Text="Update" 
                    ValidationGroup="address" />
            </td>
            <td class="style7"></td>
        </tr>
        <tr>
            <td class="style4">
                Active Status</td>
            <td class="style5"></td>
            <td class="style2">
            <asp:CheckBox ID="cb_actvsts" runat="server" />
            </td>
            <td class="style6">
                <asp:Button ID="btn_updateactvsts" runat="server" Text="Update" />
            </td>
            <td class="style7"></td>
        </tr>
    </table>
    </form>
</body>
</html>
