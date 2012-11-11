<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="itemspage.aspx.cs" Inherits="budhashop.itemspage" Title="Untitled Page" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.min.js"></script>
    
    <script type="text/javascript" src="../script/jquery.pagination.js"></script>
    


    

    <link href="Styles/pagination.css" rel="stylesheet" type="text/css" />

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
$(document).ready(function() {
var catID = 3;


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
if(search1.catid != null)
{
catID = search1.catid;
}




if(catID == 1){

$.ajax({
type: "POST",
contentType: "application/json; charset=utf-8",
url: "Services/Services.aspx/BindGrptable",
data: "{}",
dataType: "json",
success: function(data) {
for (var i = 0; i < data.d.length; i++) {


 $("#hiddenresult").append('<aside id="category_box" class="category_box_style"><div id="img_placeholder"><a href="fullDetails.aspx?id='+ data.d[i].ItemId+'&grp='+ data.d[i].CatId+'" target="_self"><img src="'+ data.d[i].ItemPath+'" alt="Items" title="'+data.d[i].ItemName+'" width="175" height="180" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="category_header"><a href="fullDetails.aspx?id='+ data.d[i].ItemId+'&grp=3" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div class="style2" style="margin-top:8px;">Rs.'+data.d[i].ItemPrice+'</div></div> </div></div> </aside>');
}
initPagination();
	    //
		  $("#fetching").hide();
},
error: function(result) {
alert("Error");
}
});

}
else{


$.ajax({
type: "POST",
contentType: "application/json; charset=utf-8",
url: "Services/Services.aspx/BindItemsData",
data: "{'CatgId':'"+ catID +"'}",
dataType: "json",
success: function(data) {

 for (var i = 0; i < data.d.length; i++) {


 $("#hiddenresult").append('<aside id="category_box" class="category_box_style"><div id="img_placeholder"><a href="fullDetails.aspx?id='+ data.d[i].ItemId+'&grp='+ data.d[i].CatId+'" target="_self"><img src="'+ data.d[i].ItemPath+'" alt="Items" title="'+data.d[i].ItemName+'" width="175" height="180" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="category_header"><a href="fullDetails.aspx?id='+ data.d[i].ItemId+'&grp=3" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div class="style2" style="margin-top:8px;">Rs.'+data.d[i].ItemPrice+'</div></div> </div></div> </aside>');

 
 }
 initPagination();
	    //
		  $("#fetching").hide();
 


},
error: function(result) {
alert("Error");
}
});
}
 
 $.ajax({
type: "POST",
contentType: "application/json; charset=utf-8",
url: "Services/Services.aspx/getCatName",
data: "{'CatId':'"+ catID +"'}",
dataType: "json",
success: function(data) {
$("#catStr").append('<b>'+data.d+'</b>');
 
 
 
},
error: function(result) {
alert("Error");
}
});
});

</script>
<div id="catStr" style="height:16px; padding:25px; font-size:16px;"></div>


<section id="middlebody"> 
    <!--Cort items Start-->
    <%--<aside id="left_col" class="in_box_style"> 
    <div style="height:60px;"><div id="but"><a href="" id="but1" type="button" target="_self" class="but2" style="display:none;"><</a></div>
      <div id="but"><a href="" id="but2" type="button" target="_self" class="but2">></a></div>
       
    
      </div>
      <div style="width:180px; height:750px;position:absolute; overflow:hidden; overflow-x: hidden;  overflow-y: hidden; ">   
    <div id="otherItemBox" style="width:180px; height:750px;">
    <script type="text/javascript">
   $('#but2').click(function(){
   var grpWidth = $('#otherItemBox').css("height").replace("px","");
   if(grpWidth == 1500){$('#but2').css("display","none");}
     if(grpWidth == 2250){$('#but2').css("display","none"); return;}
     else{
     
      $('#otherItemBox').animate({
        marginTop: '-=750px',
        height: '+=750px'
        
      },1200);
      $('#but1').css("display","inherit")
      }
      return false;
   });
   $('#but1').click(function(){
   var grpWidth = $('#otherItemBox').css("height").replace("px","");
   if(grpWidth == 1500){$('#but1').css("display","none");}
     if(grpWidth == 750){$('#but1').css("display","none");return;}
     else{
      $('#otherItemBox').animate({
        marginTop: '+=750px',
        height: '-=750px'
        
      },1200);
      $('#but2').css("display","inherit");
      }
      return false;
   });
</script>
    </div>
    </div>  
    
    </aside>--%>
    <!--Cort items End--> 
    <!--Items Start-->
    <aside > 
      <!--Categories Start-->
      <section>
        <div id="box_header" style="width:985px;">
    	<h2>Items...</h2>
      
    </div>
        <!--Gallery Start-->
        <div id="item_area" class="box_style" style="overflow:hidden; overflow-x: hidden;  overflow-y: hidden; height:600px; width:970px; padding-left:20px; "> 
        
        <div id = "itemsBox">
          <p id="fetching">
        Fetching items.... 
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

         <%-- <!--Category Item part Start-->
          <aside id="inner_category_box" class="category_box_style">
            <div id="category_header"><a href="#" target="_self" class="link1">Name</a></div>
            <div id="img_placeholder"><a href="#" target="_self"><img src="images/img.gif" alt="Items" title="Items" width="151" height="151" border="0"></a></div>
            <div id="category_bottom_row">
              <div id="category_bottom_links">
                <div id="to_left" class="style2" style="margin-top:8px;">Rs. 150</div>
                <div id="to_left">
                  <div id="add" class="add_style">
                    <div id="add_link"><a href="#" target="_self" class="add">ADD</a></div>
                  </div>
                </div>
              </div>
            </div>
          </aside>
           <aside id="category_box" class="category_box_style" style="width:180px; height:230"><div id="category_header"><a href="#" target="_self" class="link1">Name</a></div><div id="img_placeholder"><a href="#" target="_self"><img src="images/img.gif" alt="Items" title="Items" width="120" height="120" border="0"></a></div><div id="category_bottom_row" style="width:180px"><div id="category_bottom_links" ><div id="to_left" class="style2" style="margin-top:8px;">Rs. 150</div><div id="to_left"><div id="add" class="add_style" style="width:80px; height:30px;"><div id="add_link" ><a href="#" target="_self" class="add">ADD</a></div></div></div></div></div></aside>
          <!--Category Item part End--> --%>
          
          </div>
        </div>
        <!--Gallery End--> 
         
      </section>
      <!--Categories End-->
	  <!-- Sorting Section Start-->
	  <section id="sort" class="box_style">
	  <div id="pages">
         <div id="pagination" class="pagination">
         </div>
         </div>
      </section>
      <%--<section id="sort">
        <div id="sort_items"> <a href="#" target="_self">A</a> <a href="#" target="_self">B</a> <a href="#" target="_self">C</a> <a href="#" target="_self">D</a> <a href="#" target="_self">E</a> <a href="#" target="_self">F</a> <a href="#" target="_self">G</a> <a href="#" target="_self">H</a> <a href="#" target="_self">I</a> <a href="#" target="_self">J</a> <a href="#" target="_self">K</a> <a href="#" target="_self">L</a> <a href="#" target="_self">M</a> <a href="#" target="_self">N</a> <a href="#" target="_self">O</a> <a href="#" target="_self">P</a> <a href="#" target="_self">Q</a> <a href="#" target="_self">R</a> <a href="#" target="_self">S</a> <a href="#" target="_self">T</a> <a href="#" target="_self">U</a> <a href="#" target="_self">V</a> <a href="#" target="_self">W</a> <a href="#" target="_self">X</a> <a href="#" target="_self">Y</a> <a href="#" target="_self">Z</a> </div>
      </section>--%>
    </aside>
	<!-- Sorting Section End-->
    <!--Items End--> 
  </section>
  <!--Middle Body End--> 
</asp:Content>
