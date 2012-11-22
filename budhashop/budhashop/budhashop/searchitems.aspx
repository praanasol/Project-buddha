<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="searchitems.aspx.cs" Inherits="budhashop.searchitems" Title="Search results - Go Vedic - Online Shopping - Traditional and Natural Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
    
    <script type="text/javascript" src="../script/jquery.pagination.js"></script>
    
    <link href="Styles/pagination.css" rel="stylesheet" type="text/css" />

    <script src="script/searchItemsPage.js" type="text/javascript"></script>
    

<div id="searchStr" style="height:16px; padding:25px; font-size:16px;"></div>
<br clear="all" />
<section id="middlebody" style="height:550px"> 
    <!--Cort items Start-->
    
    <!--Cort items End--> 
    <!--Items Start-->
    <%--<aside id="right_col" class="in_box_style"> --%>
      <!--Categories Start-->
      <%--<section id="inner_item_area">
        <section id="scroll_buttons">
          <aside id="to_left"><a href="" id="pj_prev" target="_self" class="scroll_arrow_l" ><!--<img src="images/left_arrow.png" width="50" height="50" alt="Button" title="Button">--></a></aside>
          <aside id="to_right"><a href="" id="pj_next" target="_self" class="scroll_arrow_r"><!--<img src="images/left_arrow.png" width="50" height="50" alt="Button" title="Button">--></a></aside>
        </section>--%>
        <!--Gallery Start-->
        <div id="item_area" class="box_style" style="overflow:hidden; overflow-x: hidden;  overflow-y: hidden; height:600px; width:970px; padding-left:20px; "> 
        
        <div id = "itemsBox">
          <p id="fetching">
        Fetching Products.... 
    </p>
    
    <br style="clear: both;" />
    <div id="searchresult">
    </div>
    <div id="hiddenresult" style="display: none;">
    </div>
       
          <script id="catTemplate" type="text/x-jquery-tmpl">
        <div class="result">
    <p>
            <b>${title}</b>
            <br />
            <img src="${media.m}" />
        </p>
    </div>
    </script>

          </div>
        </div>
        <!--Gallery End--> 
         
      </section>
      <!--Categories End-->
	 
	  
   <%-- </aside>--%>
	
	  
    <!--Items End--> 
 
   <section id="sort" class="box_style">
	  <div id="pages">
        <div id="pagination" class="pagination">
    </div>
    </div>
      </section>
  <!--Middle Body End--> 
</asp:Content>
