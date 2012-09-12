<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="budhashop.homepage" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript">
$(document).ready(function() {
$.ajax({
type: "POST",
contentType: "application/json; charset=utf-8",
url: "homepage.aspx/BindDatatable",
data: "{}",
dataType: "json",
success: function(data) {
for (var i = 0; i < data.d.length; i++) {

 //$("#thumb-list").append("<span id="+ data.d[i].UserId+"><img src='"+data.d[i].UserName+"'></span>");
 $("#box_content").append('<aside id="category_box" class="category_box_style"><div id="category_header"><a href="#" target="_self" class="link1">'+ data.d[i].UserId+'</a></div><div id="img_placeholder"><a href="#" target="_self"><img src="'+data.d[i].UserName+'" alt="Items" title="Items" width="151" height="151" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[i].Location+'</div><div id="to_left"><div id="add" class="add_style"><div id="add_link"><a id = "addBtn'+ data.d[i].UserId+'" href="#" target="_self" class="add" onclick="addbtnclick('+ data.d[i].UserId+')">ADD</a></div></div></div> </div></div> </aside>');
}
},
error: function(result) {
alert("Error");
}
});

function addbtnclick(int){
$.ajax({
type: "POST",
contentType: "application/json; charset=utf-8",
url: "homepage.aspx/AddToCart",
data: "{}",
dataType: "json",
success: function(data) {
//http://kalpeshshirodker.wordpress.com/2010/12/25/accessing-session-from-javascript-using-jquery-ajax-in-asp-net/
},
error: function(result) {
alert("Error");
}
});
}

});


</script>
<!--Categories start-->
  <section id="item_area" class="box_style">
  	<div id="box_header">
    	<div id="to_left"><h2>Category 1</h2></div>
      <div id="buttons_area">
        <div id="but" class="but1_style">
                <div id="but_link"><a href="#" target="_self" class="but1">Featured</a></div>

        </div>
        <div id="but" class="but2_style">
                <div id="but_link"><a href="#" target="_self" class="but2">Featured</a></div>

        </div>
        <div id="but" class="but3_style">
                <div id="but_link"><a href="#" target="_self" class="but3">Featured</a></div>

        </div>
        </div>
    </div>
    <!--Gallery Start-->
    <div id="box_content">
    <!--Category Item part Start-->
    	
        
       
    <!--Category Item part End-->
    </div>
<%--<div id="thumb-tray">
<ul id="thumb-list">
        
</ul>
</div>--%>
</asp:Content>
