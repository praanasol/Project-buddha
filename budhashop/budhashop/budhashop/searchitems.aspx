<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="searchitems.aspx.cs" Inherits="budhashop.searchitems" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
 $("#itemsBox").append('<aside id="inner_category_box" class="category_box_style"><div id="category_header"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp='+data.d[i].CatId+'" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div id="img_placeholder"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp='+data.d[i].CatID+'" target="_self"><img src="'+data.d[i].ItemPath+'" alt="Items" title="Items" width="151" height="151" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[i].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style"><div id="add_link"><a id = "addBtn'+ data.d[i].ItemId+'" href="" type="button" target="_self" class="add" onclick="DoAction('+ data.d[i].ItemId+','+data.d[i].CatId+');">ADD</a></div></div></div> </div></div> </aside>');
}
},
error: function(result) {
alert("Error");
}
});

</script>
<br clear="all" />
<section id="middlebody"> 
    <!--Cort items Start-->
    
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
        <div id="inner_box_content" style=""> 
        
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
