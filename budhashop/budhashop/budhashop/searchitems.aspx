<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="searchitems.aspx.cs" Inherits="budhashop.searchitems" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
    
    <script type="text/javascript" src="../script/jquery.pagination.js"></script>
    


    
    <style type="text/css" media="screen">
        
        .pagination
        {
        	
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
            display: block;
            float: left;
            padding: 0.3em 0.5em;
            margin-right: 2px;
            margin-bottom: 2px;
            width: 30px;
            height: 30px;
        }
        .pagination .current
        {
            background: #26B;
            color: #fff;
            border: solid 1px #AAE;
        }
        .pagination .current.prev, .pagination .current.next
        {
            color: #999;
            border-color: #999;
            background: #fff;
        }
    </style>

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
  
//     $(document).ready(function(){   
//    var url = "http://api.flickr.com/services/feeds/groups_pool.gne?id=44124373027@N01&lang=en-us&format=json&jsoncallback=?";
// 
//        // Grab some flickr images of cats
//        $.getJSON(url, function (data) {
//            // Format the data using the catTemplate template
//            $("#catTemplate").tmpl(data.items).appendTo("#hiddenresult");
//            initPagination();
//	    //
//		  $("#fetching").hide();
//        });
//    });
    </script>
<script type="text/javascript">
var search1 = function() {
  var s = window.location.search.substr(1),
    p = s.split(/\&/), l = p.length, kv, r = {};
  if (l === 0) {return false;}
  while (l--) {
    kv = p[l].split(/\=/);
    r[kv[0]] = decodeURIComponent(kv[1] || '') || true;
  }
  return r;
}();
var srch = "";
if(search1.q != null){
 srch = search1.q;
 
}

$.ajax({
type: "POST",
contentType: "application/json; charset=utf-8",
url: "Services/Services.aspx/SearchItemNames",
data: "{'searchStr':'"+ srch +"'}",
dataType: "json",
success: function(data) {

for (var i = 0; i < data.d.length; i++) {
 $("#hiddenresult").append('<aside id="category_box" class="category_box_style"><div id="img_placeholder"><a href="fullDetails.aspx?id='+ data.d[i].ItemId+'&grp='+ data.d[i].CatId+'" target="_self"><img src="'+ data.d[i].ItemPath+'" alt="Items" title="'+data.d[i].ItemName+'" width="175" height="180" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="category_header"><a href="fullDetails.aspx?id='+ data.d[i].ItemId+'&grp=3" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div class="style2" style="margin-top:8px;">Rs.'+data.d[i].ItemPrice+'</div></div> </div></div> </aside>');

}
$("#searchStr").append('<b>Search results for "'+ srch +'":</b>');
initPagination();
	    //
		  $("#fetching").hide();
},
error: function(result) {
alert("Error");
}
});


</script>
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
        <div id="item_area" class="box_style" style="height:520px;"> 
        
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
	  <section id="sort">
        <div id="pagination" class="pagination">
    </div>
      </section>
	  
   <%-- </aside>--%>
	
	  
    <!--Items End--> 
  </section>
  <!--Middle Body End--> 
</asp:Content>
