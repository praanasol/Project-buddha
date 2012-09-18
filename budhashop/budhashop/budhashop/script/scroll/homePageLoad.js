$(document).ready(function() {
$.ajax({
type: "POST",
contentType: "application/json; charset=utf-8",
url: "Services/Services.aspx/BindDatatable",
data: "{}",
dataType: "json",
success: function(data) {
for (var i = 0; i < data.d.length; i++) {


 $("#specialItems").append('<aside id="category_box" class="category_box_style"><div id="category_header"><a href="#" target="_self" class="link1">'+ data.d[i].ItemId+'</a></div><div id="img_placeholder"><a href="#" target="_self"><img src="'+data.d[i].ItemName+'" alt="Items" title="Items" width="151" height="151" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[i].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style"><div id="add_link"><a id = "addBtn'+ data.d[i].ItemId+'" href="" type="button" target="_self" class="add" onclick="DoAction('+ data.d[i].ItemId+',2);">ADD</a></div></div></div> </div></div> </aside>');
}
},
error: function(result) {
alert("Error");
}
});

$.ajax({
type: "POST",
contentType: "application/json; charset=utf-8",
url: "Services/Services.aspx/BindGrptable",
data: "{}",
dataType: "json",
success: function(data) {
for (var i = 0; i < data.d.length; i++) {


 $("#groupItems").append('<aside id="category_box" class="category_box_style"><div id="category_header"><a href="#" target="_self" class="link1">'+ data.d[i].ItemId+'</a></div><div id="img_placeholder"><a href="#" target="_self"><img src="/ItemImages/3/4/4small.jpg" alt="Items" title="Items" width="151" height="151" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[i].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style"><div id="add_link"><a id = "addBtn'+ data.d[i].ItemId+'" href="" type="button" target="_self" class="add" onclick="DoAction('+ data.d[i].ItemId+',1);">ADD</a></div></div></div> </div></div> </aside>');
}
},
error: function(result) {
alert("Error");
}
});
});