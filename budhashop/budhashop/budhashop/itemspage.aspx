<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="itemspage.aspx.cs" Inherits="budhashop.itemspage" Title="Untitled Page" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">





<script type="text/javascript">
$(document).ready(function() {
var catID = 3;
var pageNo = 1;
var prev = 0;
var nxt = 0;
var end = 1;

$('#pj_prev').css("display","none");

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
if(search1.page != null)
{
pageNo = search1.page;
if(pageNo>1){
$('#pj_prev').css("display","inherit");
prev = parseInt(pageNo)-1;
$('#pj_prev').attr("href", "itemspage.aspx?catid="+catID+"&page="+prev+"");
}


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


 $("#itemsBox").append('<aside id="inner_category_box" class="category_box_style"><div id="category_header"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp='+ data.d[i].CatId+'" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div id="img_placeholder"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp=1" target="_self"><img src="/ItemImages/3/4/4small.jpg" alt="Items" title="Items" width="151" height="151" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[i].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style"><div id="add_link"><a id = "addBtn'+ data.d[i].ItemId+'" href="" type="button" target="_self" class="add" onclick="DoAction('+ data.d[i].ItemId+','+ data.d[i].CatId+');">ADD</a></div></div></div> </div></div> </aside>');
}
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

$("#sort_items").append('<a href="itemspage.aspx?catid='+catID+'&page=1" target="_self">1</a>');
for (var i = 0; i < data.d.length; i++) {
var incPage = 1;


if(i/9 == incPage)
{
incPage++
$("#sort_items").append('<a href="itemspage.aspx?catid='+catID+'&page='+incPage+'" target="_self">'+incPage+'</a>'); 
end = incPage;
}

}

if(pageNo>end)
{
LoadItems(1)
$('#pj_prev').css("display","none");
$('#pj_next').css("display","inherit");
$('#pj_next').attr("href", "itemspage.aspx?catid="+catID+"&page=2");
}
else{
LoadItems(pageNo)
if(end != pageNo){
nxt = parseInt(pageNo)+1 ;

$('#pj_next').attr("href", "itemspage.aspx?catid="+catID+"&page="+nxt+"");
}
else{
$('#pj_next').css("display","none");
}
}
function LoadItems(pgno)
{

 var start = 0;
 var limit = pgno*9;
 if(pgno != 1){
    start = limit-9;
 }
 
 for (var i = start; i < data.d.length; i++) {
 if(i<limit)
{

 $("#itemsBox").append('<aside id="inner_category_box" class="category_box_style"><div id="category_header"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp='+catID+'" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div id="img_placeholder"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp='+catID+'" target="_self"><img src="'+data.d[i].ItemPath+'" alt="Items" title="Items" width="151" height="151" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[i].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style"><div id="add_link"><a id = "addBtn'+ data.d[i].ItemId+'" href="" type="button" target="_self" class="add" onclick="DoAction('+ data.d[i].ItemId+','+catID+');">ADD</a></div></div></div> </div></div> </aside>');
}
 
 }
 }


},
error: function(result) {
alert("Error");
}
});

if(catID==3){

$.ajax({
type: "POST",
contentType: "application/json; charset=utf-8",
url: "Services/Services.aspx/BindGrptable",
data: "{}",
dataType: "json",
success: function(data) {
for (var i = 0; i < data.d.length; i++) {


 $("#otherItemBox").append('<aside id="inner_category_box" class="category_box_style" style="width:180px; height:230"><div id="category_header"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp='+ data.d[i].CatId+'" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div id="img_placeholder"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp=1" target="_self"><img src="images/img.gif" alt="Items" title="Items" width="120" height="120" border="0"></a></div><div id="category_bottom_row" style="width:180px"><div id="category_bottom_links" ><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[i].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style" style="width:80px; height:30px;"><div id="add_link" ><a id = "addoBtn'+ data.d[i].ItemId+'" href="" target="_self" class="add" onclick="DoAction('+ data.d[i].ItemId+','+ data.d[i].CatId+');">ADD</a></div></div></div></div></div></aside>');

}
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
url: "Services/Services.aspx/BindDatatable",
data: "{'CatgId':'"+ catID +"'}",
dataType: "json",
success: function(data) {
for (var i = 0; i < data.d.length; i++) {

$("#otherItemBox").append('<aside id="inner_category_box" class="category_box_style" style="width:150px; height:180"><div id="category_header"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp='+catID+'" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div id="img_placeholder"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp='+catID+'" target="_self"><img src="'+data.d[i].ItemPath+'" alt="Items" title="Items" width="120" height="120" border="0"></a></div><div id="category_bottom_row" style="width:150px"><div id="category_bottom_links" ><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[i].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style" style="width:80px; height:30px;"><div id="add_link" ><a id = "addoBtn'+ data.d[i].ItemId+'" href="" target="_self" class="add" onclick="DoAction('+ data.d[i].ItemId+','+catID+');">ADD</a></div></div></div></div></div></aside>');

 }
},
error: function(result) {
alert("Error");
}
});
}
}

 
});

</script>
<br clear="all" />
<section id="middlebody"> 
    <!--Cort items Start-->
    <aside id="left_col" class="in_box_style"> 
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
    
    </aside>
    <!--Cort items End--> 
    <!--Items Start-->
    <aside id="right_col" class="in_box_style"> 
      <!--Categories Start-->
      <section id="inner_item_area">
        <section id="scroll_buttons">
          <aside id="to_left"><a href="" id="pj_prev" target="_self" class="scroll_arrow_l" ><!--<img src="images/left_arrow.png" width="50" height="50" alt="Button" title="Button">--></a></aside>
          <aside id="to_right"><a href="" id="pj_next" target="_self" class="scroll_arrow_r"><!--<img src="images/left_arrow.png" width="50" height="50" alt="Button" title="Button">--></a></aside>
        </section>
        <!--Gallery Start-->
        <div id="inner_box_content"> 
        
        <div id = "itemsBox">
          
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
	  <section id="sort">
        <div id="sort_items">  </div>
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
