<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="loginpage.aspx.cs" Inherits="budhashop.loginpage" Title="Untitled Page" %>
<%@ Register src="~/UserControls/Userregistrations.ascx" tagname="login_register" tagprefix="tag1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div>
    <tag1:login_register runat="server" />
    
    </div>
</asp:Content>
