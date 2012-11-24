<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="budhashop.homepage" Title="Go Vedic - Online Shopping Cart - Traditional and Natural Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
    
    <script type="text/javascript" src="../script/jquery.pagination.js"></script>

    <script src="script/coin-slider.min.js" type="text/javascript"></script>


    <link href="Styles/pagination.css" rel="stylesheet" type="text/css" />
    <link href="Styles/coin-slider-styles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="script/scroll/homePageLoad.js"></script>

 
 <%--div for the sliding banner--%>
  <div id='coin-slider'>
    <a href="img01_url" target="_blank">
        <img src="images/banner/banner1.jpg">
        
    </a>
 <a href="img01_url" target="_blank">
        <img src="images/banner/banner2.jpg">
        
    </a>
     <a href="img01_url" target="_blank">
        <img src="images/banner/banner3.jpg">
        
    </a>
     <a href="img01_url" target="_blank">
        <img src="images/banner/banner4.jpg">
        
    </a>
     <a href="img01_url" target="_blank">
        <img src="images/banner/banner5.jpg">
        
    </a>
   
</div>
  <br clear="all" />
  <div id="box_header" style="width:985px;">
    	<h2>Featured Products</h2>
      
    </div>
<section id="item_area" class="box_style" style="height:585px;">
  	
    <!--Gallery Start-->
   <div id="box_content" style="overflow:hidden; overflow-x: hidden;  overflow-y: hidden; height:650px; width:970px; padding-left:20px; padding-right:20px;">
   
    <div id ="groupItems" style="height:580px; width:970px;">
  
          <p id="fetching">
        Fetching Products.... 
    </p>
    
    <br style="clear: both;" />
    <div id="searchresult">
    </div>
    <div id="hiddenresult" style="display: none;">
    </div>
    </div>
    </div>
   
    </section>
     <section id="sort" class="box_style">
        <div id="pages">
            <div id="pagination" class="pagination">
        </div>
    </div>
      </section>



</asp:Content>
