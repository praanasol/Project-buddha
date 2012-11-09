<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="LoginA.aspx.cs" Inherits="budhashop.ADMIN.LoginA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        Email Id:<asp:RequiredFieldValidator ID="rfv_email" runat="server" 
            ControlToValidate="txt_username" ErrorMessage="*" SetFocusOnError="True" 
            ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txt_username" runat="server" Width="181px"></asp:TextBox>
        <br />
        Password:<asp:RequiredFieldValidator ID="rfv_pwd" runat="server" 
            ControlToValidate="txt_password" ErrorMessage="*" SetFocusOnError="True" 
            ValidationGroup="submit"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txt_password" runat="server" Width="181px" TextMode="Password"></asp:TextBox>
        <br />
            <asp:Button ID="btn_submit" runat="server" Text="Submit" 
            ValidationGroup="submit" onclick="btn_submit_Click" />
        <br />
            <asp:Label ID="lbl_submit" runat="server" ForeColor="Red"></asp:Label>
        
    </div>
</asp:Content>