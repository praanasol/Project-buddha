<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="shippingdetails.aspx.cs" Inherits="budhashop.shippingdetails" Title="Shipping Details - Govedic.com - online shopping - traditional and natural products." %>
<%@ Register src="~/UserControls/areaAutoComplete.ascx" tagname="areaAC" tagprefix="uc_ac" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
<uc_ac:areaAC ID="areaAc" runat="server" />
<div style="width:60%; height:auto; padding:40px; margin:60px 0 60px 165px ; font-weight:normal;background:none repeat scroll 0 0 #efdb97;border: 2px solid #F3C46D;
    border-radius: 5px 5px 5px 5px;
    ">
<b style="font-size:16px;">Shipping Details:</b>
<br /><br />
<p style="font-size:14px;">We only accept orders that exceed Rs. 500/- <b style="font-size:16px;color:Black;"></b> .</p>
<br /><br />
<p style="font-size:14px;">Free shipping for orders that exceed Rs. 1000/-  <b style="font-size:16px;color:Black;"></b></p>
<br /><br />
<p style="font-size:14px;">Cash on delivery. Shipping charges are priced according to distance that is to be covered. And have to be given to our carriers saperatly.</p><br /><br />

<p style="font-size:14px;">Customers will be informed about their order and we will confirm your purchase via phone and proceed further. 
</p><br /><br />
<p style="font-size:14px;">At present we are operating only in Hyderabad and our services are limited to Hyderabad City.</p><br /><br />
<br /><br />
You can <a class="link2" href="../contactus.aspx">contact us </a> for any other details.



</div>
    
</asp:Content>
