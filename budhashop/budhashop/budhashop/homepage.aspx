<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="budhashop.homepage" Title="Go Vedic - Online Shopping - Traditional and Natural Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
    
    <script type="text/javascript" src="../script/jquery.pagination.js"></script>

    <script src="script/coin-slider.min.js" type="text/javascript"></script>


    <link href="Styles/pagination.css" rel="stylesheet" type="text/css" />
    <link href="Styles/coin-slider-styles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="script/scroll/homePageLoad.js"></script>

  <script src="script/jquery.cycle.all.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {

$('#side-info').show();
$('#slideshow').cycle({
    fx:     'scrollUp', 
     
    delay:  -2000 // choose your transition type, ex: fade, scrollUp, shuffle, etc...
});
$('#slideshow2').cycle({
    fx:     'scrollLeft', 
     
    delay:  -4000 // choose your transition type, ex: fade, scrollUp, shuffle, etc...
});

});
</script> 
 <%--div for the sliding banner--%>
 <div id="side-info" style="display:none;">
 <div style="width:165px; height:500;float:left; padding:10px;font-size:16px;">
 <div class="quicklinks">
 <b>Customer Support: <br />
   +91 8125878727</b><br />
   <a class="link1" href="contactus.aspx">Contact info</a>
  </div>
  <br />
  <div id="slideshow" class="quicklinks" style="height:45px;">
  <b style="text-align:center; margin-left:30px;"> > Rs.750 <br />free shipping</b>
  <b style="text-align:center; margin-left:30px;">Cash on delivery</b>
  <b style="text-align:center; margin-left:30px;">Presently, only for hyderabad</b>
  </div>
  <br />
  <div id="slideshow2" class="quicklinks" style="height:90px;">
  <b>New products</b>
  <b>New product <br /> - product 1 -</b>
  <b>New product <br /> - product 2 -</b>
  <b>New product<br /> - product 3 -</b>
  <b>New product<br /> - product 4 -</b>
  <b>New product<br /> - product 5 -</b>
  </div>
  <br />
  <div class="quicklinks">
  <b>Articles</b>
  
  </div>
 </div>
  <div id='coin-slider'>
    <a href="../itemspage.aspx?catid=1" target="_blank">
        <img src="images/banner/banner1.jpg">
        
    </a>
 <a href="../itemspage.aspx?catid=2" target="_blank">
        <img src="images/banner/banner2.jpg">
        
    </a>
     <a href="../itemspage.aspx?catid=3" target="_blank">
        <img src="images/banner/banner3.jpg">
        
    </a>
     <a href="../itemspage.aspx?catid=4" target="_blank">
        <img src="images/banner/banner4.jpg">
        
    </a>
     <a href="../homepage.aspx" target="_blank">
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
