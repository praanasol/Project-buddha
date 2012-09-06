$(document).ready(function() {
$.ajax({
type: "POST",
contentType: "application/json; charset=utf-8",
url: "homepage.aspx/BindDatatable",
data: "{}",
dataType: "json",
success: function(data) {
for (var i = 0; i < data.d.length; i++) {

 $("#thumb-list").append("<span id="+ data.d[i].UserId+"><img src='"+data.d[i].UserName+"'></span>");
}
},
error: function(result) {
alert("Error");
}
});
});
