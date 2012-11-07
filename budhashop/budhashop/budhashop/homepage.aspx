<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="budhashop.homepage" Title="Go Vedic - Online Shoping Cart - Treditional and Natural Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
    
    <script type="text/javascript" src="../script/jquery.pagination.js"></script>
    


    
    <style type="text/css" media="screen">
       
        
        .pagination
        {
        	margin:5px 0px 0px 0px;
            font-size: 14px;
        }
        .pagination a
        {
            text-decoration: none;
            border: solid 1px #AAE;
            color: #15B;
        }
        .pagination a, .pagination span
        {
        	margin:auto;
            display:inline;
            padding:5px 5px;
            margin-top:4px;
            margin-left:5px;
            margin-right: 2px;
            margin-bottom: 2px;
            width: 30px;
            height: 30px;
        }
        .pagination .current
        {
            margin:0px 5px;
            color: #fff;
            background:#f39112;
	        border:#f39112 solid 2px;
	        border-radius:5px;
        }
        .pagination .current.prev, .pagination .current.next
        {
        	margin:0px 0px 0px 0px;
            font-family:"Arial", Gadget, sans-serif;
	font-size:13px;
	color:#364700;
	font-weight:bold;
	text-decoration:none;
	background:#f39112;
	background: -webkit-gradient(linear, 0 0, 0 bottom, from(#fe7e28), to(#d85702));
    background: -moz-linear-gradient(#fe7e28, #d85702);
    background: linear-gradient(#fe7e28, #d85702);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fe7e28', endColorstr='#d85702');
	border:#364700 solid 2px;
	border-radius:5px;
        }
    </style>
    <script type="text/javascript" src="script/scroll/homePageLoad.js">



</script>

    <script>
    var pagination_options = {
      num_edge_entries: 2,
      num_display_entries: 8,
      callback: pageselectCallback,
      items_per_page:10
    }

    function pageselectCallback(page_index, jq){
      var items_per_page = pagination_options.items_per_page;
      var offset = page_index * items_per_page;
      var new_content = $('#hiddenresult aside.category_box_style').slice(offset, offset + items_per_page).clone();
      $('#searchresult').empty().append(new_content);
      return false;
    }

    function initPagination() {
      var num_entries = $('#hiddenresult aside.category_box_style').length;
      // Create pagination element
      $("#pagination").pagination(num_entries, pagination_options);
    }
    </script>


 <%--Call for json to update in cart--%>
<%--<script type="text/javascript" src="script/CartJSONCall.js"></script>--%>
<article style="height:200px;"></article>
  <br clear="all" />
<section id="item_area" class="box_style" style="height:550px;">
  	<div id="box_header">
    	<div id="to_left"><h2>Featured Products</h2></div>
      
    </div>
    <!--Gallery Start-->
   <div id="box_content" style="overflow:hidden; overflow-x: hidden;  overflow-y: hidden; height:650px; width:970px;">
   
    <div id ="groupItems" style="height:550px; width:970px;">
  
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
     <section id="sort" class="bg_style1">
        <div id="pages">
            <div id="pagination" class="pagination">
        </div>
    </div>
      </section>



</asp:Content>
