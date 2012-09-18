<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="budhashop.homepage" Title="Untitled Page" %>
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
   <div id="box_content" style="overflow:hidden;overflow-x: hidden;
    overflow-y: hidden;">
    <div id ="groupItems" style="height:240px; width:2400px;">
   <script type="text/javascript">
   $('#but2').click(function(){
      $('#groupItems').animate({
        'margin-left': '-=630px'
      });
   });
   $('#but1').click(function(){
      $('#groupItems').animate({
        'margin-left': '+=630px'
      });
   });
</script>
    </div>
    </div>
    </section>

<!--Categories start-->
 <section id="item_area" class="box_style">
  	<div id="box_header">
    	<div id="to_left"><h2>Category 1</h2></div>
      <div id="buttons_area">
        <div id="but" class="but1_style">
                <div id="but_link"><a href="" type="button" target="_self" class="but1">Featured</a></div>

        </div>
        <div id="but" class="but2_style">
                <div id="but_link"><a href="" type="button" target="_self" class="but2" >Featured</a></div>

        </div>
        <div id="but" class="but3_style">
                <div id="but_link"><a href="#" target="_self" class="but3">Featured</a></div>

        </div>
        </div>
    </div>
    <!--Gallery Start-->
    <div id="box_content">
    <!--Category Item part Start-->
    <div id="specialItems">
    
    
    </div>
   
       
    <!--Category Item part End-->
    </div>
    
     </section>
<%--<div id="thumb-tray">
<ul id="thumb-list">
        
</ul>
</div>--%>


</asp:Content>
