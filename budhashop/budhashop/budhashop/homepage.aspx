<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="budhashop.homepage" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" src="script/scroll/homePageLoad.js">



</script>
 <%--Call for json to update in cart--%>
<%--<script type="text/javascript" src="script/CartJSONCall.js"></script>--%>
<article style="height:200px;"></article>
  <br clear="all" />
<section id="item_area" class="box_style" style="height:730px;">
  	<div id="box_header">
    	<div id="to_left"><h2>Featured </h2></div>
      
    </div>
    <!--Gallery Start-->
   <div id="box_content" style="overflow:hidden; overflow-x: hidden;  overflow-y: hidden; height:650px; width:970px;">
   
    <div id ="groupItems" style="height:650px; width:970px;">
   <script type="text/javascript">
   $('#but2').click(function(){
   var grpWidth = $('#groupItems').css("margin-left").replace("px","");
   if(grpWidth == -970){$('#but2').css("display","none");}
     if(grpWidth == -2910){$('#but2').css("display","none"); return;}
     else{
     
      $('#groupItems').animate({
        'margin-left': '-=970px'
      },1500);
      $('#but1').css("display","inherit")
      }
      return false;
   });
   $('#but1').click(function(){
   var grpWidth = $('#groupItems').css("margin-left").replace("px","");
   if(grpWidth == -970){$('#but1').css("display","none");}
     if(grpWidth == 0){$('#but1').css("display","none");return;}
     else{
      $('#groupItems').animate({
        'margin-left': '+=970px'
      },1500);
      $('#but2').css("display","inherit");
      }
      return false;
   });
</script>
    </div>
    </div>
    </section>



</asp:Content>
