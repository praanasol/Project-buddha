<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="budhashop.homepage" Title="Go Vedic - Online Shopping - Traditional and Natural Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" src="script/jquery.tmpl.min.js"></script>
    
    <script type="text/javascript" src="../script/jquery.pagination.js"></script>

    <script src="script/coin-slider.min.js" type="text/javascript"></script>


    <link href="Styles/pagination.css" rel="stylesheet" type="text/css" />
    <link href="Styles/coin-slider-styles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="script/scroll/homePageLoad.js"></script>

  <script src="script/jquery.cycle.all.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {

$('#side-info').show();
$('#col3').show();

$('#slideshow3').cycle({
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
 <aside id="side-info" style="display:none; padding-left:100px;">
 
 <section>
  <div id='coin-slider'>
    <a href="../itemspage.aspx?catid=17" target="_blank">
        <img src="images/banner/banner1.jpg">
        
    </a>
 <a href="../articleHome.aspx" target="_blank">
        <img src="images/banner/banner2.jpg">
        
    </a>
     
     <a href="../articleHome.aspx" target="_blank">
        <img src="images/banner/banner4.jpg">
        
    </a>
     <a href="../homepage.aspx" target="_blank">
        <img src="images/banner/banner5.jpg">
        
    </a>
   
</div>
</section>
</aside>
  <br clear="all" />
  
<section id="item_area" class="box_style" style="height:650px;">
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
      <section id="col3" style=" display:none; padding-left:50px;" >
      
      <div class="quicklinks" style="height:140px;width:300px;float:left;font-size:12px;margin-top:15px;padding:40px 20px 0px 20px; ">
      <p>GoVedic.com is born out of an idea that traditional way of life that prospered in ancient vedic India can be induced in morden lifestyle as an alternative.
      GoVedic.com is essentially an online store of products that support vedic tradition for shopping online at your leisure and from the comfort of your home.
    <br /><br /><a href="../about.aspx" class="link2">More About Us</a></p>
  
    </div>
    <div class="quicklinks" style="height:140px;width:300px;float:left;font-size:12px;margin:15px 30px 10px 10px;padding:40px 20px 0px 20px; ">
      <p>
At present we are operating only in Hyderabad and our services are limited to Hyderabad City.<br /><br />Cash on delivery. Shipping charges extra. <b style="padding-top:15px; padding-left:13px;">We only accept orders exceeding Rs. 500/-</b>
Free shipping for orders more than Rs. 1000/-<br /><br /> <a href="../shippingdetails.aspx" class="link2" >More Details</a></p>
  
    </div>
   
     <div style="width:165px; height:180;float:left;margin:10px; padding:1px;font-size:16px; ">
  <div id="slideshow2" class="quicklinks" style="height:180px;  text-align:center;background:none repeat scroll 0 0 #962824;color:#EFD787; border: 2px solid #7E1B1B;">
  <div style="padding:5px;"><div><a href="http://www.govedic.com/fullDetails.aspx?id=80&grp=17"><img src="images/featured5/80small.jpg" alt="featured Product" /></a></div><div><b>Karela Ras</b></div></div>
  <div style="padding:5px;"><div><a href="http://www.govedic.com/fullDetails.aspx?id=121&grp=17"><img src="images/featured5/121small.jpg" alt="featured Product" /></a></div><div><b>Herbi T Lemon</b></div></div>
  <div style="padding:5px;"><div><a href="http://www.govedic.com/fullDetails.aspx?id=33&grp=17"><img src="images/featured5/33small.jpg" alt="featured Product" /></a></div><div><b>Amla juice</b></div></div>
  <div style="padding:5px;"><div><a href="http://www.govedic.com/fullDetails.aspx?id=62&grp=17"><img src="images/featured5/62small.jpg" alt="featured Product" /></a></div><div><b>Prana Shakti</b></div></div>
  <div style="padding:5px;"><div><a href="http://www.govedic.com/fullDetails.aspx?id=53&grp=17"><img src="images/featured5/53small.jpg" alt="featured Product" /></a></div><div><b>Desi Cow Ghee</b></div></div>
  
  </div>
  
 </div>
   
  
  <%--<div class="quicklinks">
  <b>Articles</b>
  
  </div>--%>
 </section>



</asp:Content>
