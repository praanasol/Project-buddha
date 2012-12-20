<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="verifyemail.aspx.cs" Inherits="budhashop.Merchant.verifyemail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="emailTxt" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_emailfb" runat="server" 
            ControlToValidate="emailTxt" ErrorMessage="*" SetFocusOnError="True" 
            ToolTip="Email Can not be Empty" ValidationGroup="feedback">Required</asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="rev_emailfb" runat="server" 
            ControlToValidate="emailTxt" ErrorMessage="Enter Valid Email Id" 
            SetFocusOnError="True" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ValidationGroup="feedback">Enter valid email</asp:RegularExpressionValidator>
        <asp:Button ID="verify"
            runat="server" Text="Button" onclick="verify_Click" />
            
            <asp:Label ID="ResultLbl" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
