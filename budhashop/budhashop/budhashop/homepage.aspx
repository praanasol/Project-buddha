﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="budhashop.homepage" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" src="script/scroll/homePageLoad.js">



</script>
 <%--Call for json to update in cart--%>
<script type="text/javascript" src="script/CartJSONCall.js"></script>

<section id="item_area" class="box_style">
  	<div id="box_header">
    	<div id="to_left"><h2>Category 1</h2></div>
      <div id="buttons_area">
        <div id="but" class="but1_style">
                <div id="but_link"><a href="#" id="but1" target="_self" class="but1">Featured</a></div>

        </div>
        <div id="but" class="but2_style">
                <div id="but_link"><a href="#" id="but2" target="_self" class="but2">Featured</a></div>

        </div>
        <div id="but" class="but3_style">
                <div id="but_link"><a href="#" target="_self" class="but3">Featured</a></div>

        </div>
        </div>
    </div>
    <!--Gallery Start-->
   <div id="box_content" style="overflow:hidden;overflow-x: hidden;overflow-y: hidden; ">
    <div id ="groupItems" style="height:240px; width:2400px;">
   <script type="text/javascript">
   $('#but2').click(function(){
   var grpWidth = $('#groupItems').css("margin-left").replace("px","");
     if(grpWidth == -1940){return;}
     else{
      $('#groupItems').animate({
        'margin-left': '-=970px'
      });
      }
      return false;
   });
   $('#but1').click(function(){
   var grpWidth = $('#groupItems').css("margin-left").replace("px","");
     if(grpWidth == 0){return;}
     else{
      $('#groupItems').animate({
        'margin-left': '+=970px'
      });
      }
      return false;
   });
</script>
    </div>
    </div>
    </section>

<!--Categories start-->
 <section id="item_area" class="box_style">
  	<div id="box_header">
    	<div id="to_left"><h2>Category 2</h2></div>
      <div id="buttons_area">
        <div id="but" class="but1_style">
                <div id="but_link"><a href="#" id="cBut1" type="button" target="_self" class="but1">Featured</a></div>

        </div>
        <div id="but" class="but2_style">
                <div id="but_link"><a href="#" id="cBut2" type="button" target="_self" class="but2" >Featured</a></div>

        </div>
        <div id="but" class="but3_style">
                <div id="but_link"><a href="#" target="_self" class="but3">Featured</a></div>

        </div>
        </div>
    </div>
    <!--Gallery Start-->
    <div id="box_content" style="overflow:hidden;overflow-x: hidden;
    overflow-y: hidden;padding-right:10px;">
    <!--Category Item part Start-->
    <div id="specialItems" style="height:240px; width:2400px;">
    <script type="text/javascript">
   $('#cBut2').click(function(){
   var c2Width = $('#specialItems').css("margin-left").replace("px","");
     if(c2Width == -1940){return;}
     else{
      $('#specialItems').animate({
        'margin-left': '-=970px'
      });
      }
      return false;
   });
   $('#cBut1').click(function(){
    var c2Width = $('#specialItems').css("margin-left").replace("px","");
     if(c2Width == 0){return;}
     else{
      $('#specialItems').animate({
        'margin-left': '+=970px'
      });
      }
      return false;
   });
</script>
    
    </div>
   
       
    <!--Category Item part End-->
    </div>
    
  </section>
<%--<div id="thumb-tray">
<ul id="thumb-list">
        
</ul>
</div>--%>
<!--Categories start-->
 <section id="item_area" class="box_style">
  	<div id="box_header">
    	<div id="to_left"><h2>Category 3</h2></div>
      <div id="buttons_area">
        <div id="but" class="but1_style">
                <div id="but_link"><a href="#" id="oBut1" type="button" target="_self" class="but1">Featured</a></div>

        </div>
        <div id="but" class="but2_style">
                <div id="but_link"><a href="#" id="oBut2" type="button" target="_self" class="but2" >Featured</a></div>

        </div>
        <div id="but" class="but3_style">
                <div id="but_link"><a href="#" target="_self" class="but3">Featured</a></div>

        </div>
        </div>
    </div>
    <!--Gallery Start-->
    <div id="box_content" style="overflow:hidden;overflow-x: hidden;
    overflow-y: hidden;padding-right:10px;">
    <!--Category Item part Start-->
    <div id="EcoItems" style="height:240px; width:2400px;">
    <script type="text/javascript">
   $('#oBut2').click(function(){
   var c3Width = $('#EcoItems').css("margin-left").replace("px","");
     if(c3Width == -1940){return;}
     else{
      $('#EcoItems').animate({
        'margin-left': '-=970px'
      });
      }
      return false;
   });
   $('#oBut1').click(function(){
   var c3Width = $('#EcoItems').css("margin-left").replace("px","");
     if(c3Width == 0){return;}
     else{
      $('#EcoItems').animate({
        'margin-left': '+=970px'
      });
      }
      return false;
   });
</script>
    
    </div>
   
       
    <!--Category Item part End-->
    </div>
    
  </section>

</asp:Content>
