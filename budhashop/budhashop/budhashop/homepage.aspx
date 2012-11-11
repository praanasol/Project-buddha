<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="budhashop.homepage" Title="Go Vedic - Online Shoping Cart - Treditional and Natural Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
    
    <script type="text/javascript" src="../script/jquery.pagination.js"></script>
    


    <link href="Styles/pagination.css" rel="stylesheet" type="text/css" />
    

    <script type="text/javascript" src="script/scroll/homePageLoad.js"></script>

        
       
    

    <script>
    var pagination_options = {
      num_edge_entries: 2,
      num_display_entries: 8,
      callback: pageselectCallback,
      items_per_page:8
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
<%--<article style="height:200px;"></article>--%>
 
  <br clear="all" />
  <div id="box_header" style="width:985px;">
    	<h2>Feature Products...</h2>
      
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
