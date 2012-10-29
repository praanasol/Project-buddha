<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="iteminfo.aspx.cs" Inherits="budhashop.iteminfo" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript" src="../script/CartJSONCall.js"></script>

<script type="text/javascript">
var Id = 0;
var grpc = 0;
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

if(search1.id != null)
{
Id = search1.id;
}
else{

//redirect to home page
}
if(search1.grp != null)
{
grpc = search1.grp;
}
else{
//redirect to home page
}
var flag = 0;
if(grpc==1)
{
flag = 1;
}
else{
flag = 0;
}



$.ajax({
type: "POST",
contentType: "application/json; charset=utf-8",
url: "Services/Services.aspx/itemInfo",
data: "{'itemId':'"+ Id +"','grp':'"+ flag +"'}",
dataType: "json",
success: function(data) {

for (var i = 0; i < data.d.length; i++) {
 $("#itemsBox").append('<aside id="inner_category_box" class="category_box_style"><div id="category_header"><a href="#" target="_self" class="link1">'+ data.d[0].ItemId+'</a></div><div id="img_placeholder"><a href="#" target="_self"><img src="'+data.d[i].ItemPath+'" alt="Items" title="Items" width="151" height="151" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[0].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style"><div id="add_link"><a id = "addBtn'+ data.d[0].ItemId+'" href="" type="button" target="_self" class="add" onclick="DoAction('+ data.d[0].ItemId+','+ data.d[0].CatId+');">ADD</a></div></div></div> </div></div> </aside>');
}
},
error: function(result) {
alert("Error");
}
});

if(grpc==1){

$.ajax({
type: "POST",
contentType: "application/json; charset=utf-8",
url: "Services/Services.aspx/BindGrptable",
data: "{}",
dataType: "json",
success: function(data) {
for (var i = 0; i < data.d.length; i++) {


 $("#otherItemBox").append('<aside id="inner_category_box" class="category_box_style" style="width:180px; height:230"><div id="category_header"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp=1" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div id="img_placeholder"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp=1" target="_self"><img src="images/img.gif" alt="Items" title="Items" width="120" height="120" border="0"></a></div><div id="category_bottom_row" style="width:180px"><div id="category_bottom_links" ><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[i].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style" style="width:80px; height:30px;"><div id="add_link" ><a id = "addoBtn'+ data.d[i].ItemId+'" href="" target="_self" class="add" onclick="DoAction('+ data.d[i].ItemId+',1);">ADD</a></div></div></div></div></div></aside>');

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
data: "{'CatgId':'"+ grpc +"'}",
dataType: "json",
success: function(data) {
for (var i = 0; i < data.d.length; i++) {

$("#otherItemBox").append('<aside id="inner_category_box" class="category_box_style" style="width:150px; height:180"><div id="category_header"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp='+grpc+'" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div id="img_placeholder"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp='+grpc+'" target="_self"><img src="'+data.d[i].ItemPath+'" alt="Items" title="Items" width="120" height="120" border="0"></a></div><div id="category_bottom_row" style="width:150px"><div id="category_bottom_links" ><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[i].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style" style="width:80px; height:30px;"><div id="add_link" ><a id = "addoBtn'+ data.d[i].ItemId+'" href="" target="_self" class="add" onclick="DoAction('+ data.d[i].ItemId+','+grpc+');">ADD</a></div></div></div></div></div></aside>');

 }
},
error: function(result) {
alert("Error");
}
});
}

            
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
      <%--<section id="inner_item_area">
        <section id="scroll_buttons">
          <aside id="to_left"><a href="" id="pj_prev" target="_self" class="scroll_arrow_l" ><!--<img src="images/left_arrow.png" width="50" height="50" alt="Button" title="Button">--></a></aside>
          <aside id="to_right"><a href="" id="pj_next" target="_self" class="scroll_arrow_r"><!--<img src="images/left_arrow.png" width="50" height="50" alt="Button" title="Button">--></a></aside>
        </section>--%>
        <!--Gallery Start-->
        <div id="inner_box_content"> 
        
        <div id = "itemsBox">
          
       
          
          </div>
        </div>
        <!--Gallery End--> 
         
      </section>
      <!--Categories End-->
	  
	  
    </aside>
	
    <!--Items End--> 
  </section>
  <!--Middle Body End--> 
</asp:Content>
