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
 <div>
 <div style="width:165px; height:500;float:left; padding:10px;font-size:16px;">
 <div class="quicklinks">
 <b>Customer Support: <br />
   +91 8125878727</b><br />
   Contact info
  </div>
  <br />
  <div class="quicklinks">
  <b>Shipping <br />
  Cash on delivery</b>
  </div>
  <br />
  <div class="quicklinks">
  <b>Articles <br />
  Go sandarshan, kahdi lifestyle, vedic philosophy</b>
  </div>
  <br />
  <div style="background-color: #E5B354;
    border: 2px solid #8A0C05;
    border-radius: 5px 5px 5px 5px;-moz-box-shadow:inset 0px 0px 34px 10px #ac7713;
-webkit-box-shadow:inset 0px 0px 34px 10px #ac7713;
box-shadow:inset 0px 0px 34px 10px #ac7713; padding:5px;">
  <b>New Products <br />
  slide show</b>
  </div>
 </div>
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

</div>
  <br clear="all" />
  
<section id="item_area" class="box_style" style="height:585px;">
  	<div style="text-align:center;">
    	<b style="text-align:center;border: 1px solid #F3C46D; padding:0px 5px 5px 5px; border-radius: 0px 0px 5px 5px; font-size:16px">Featured Products</b>
      
    </div>
    <!--Gallery Start-->
   <div id="box_content" style="overflow:hidden; overflow-x: hidden;  overflow-y: hidden; height:630px; width:950px; padding-left:20px; padding-right:10px;">
   
    <div id ="groupItems" style="height:550px; width:950px;">
  
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
