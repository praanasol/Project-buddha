<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginA.aspx.cs" Inherits="budhashop.ADMIN.LoginA" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            Email Id:<asp:RequiredFieldValidator ID="rfv_email" runat="server" 
                ControlToValidate="txt_username" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="submit"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txt_username" runat="server" Width="181px"></asp:TextBox>
            <br />
            Password:<asp:RequiredFieldValidator ID="rfv2" runat="server" 
                ControlToValidate="txt_password" ErrorMessage="*" SetFocusOnError="True" 
                ValidationGroup="submit"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txt_password" runat="server" Width="181px" Text="hi" TextMode="Password"></asp:TextBox>
            <br />
                <asp:Button ID="btn_submit" runat="server" Text="Submit" 
                ValidationGroup="submit" onclick="btn_submit_Click" />
            <br />
                <asp:Label ID="lbl_submit" runat="server" ForeColor="Red"></asp:Label>
            
        </div>
    </form>
</body>
</html>