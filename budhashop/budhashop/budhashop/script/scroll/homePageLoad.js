$(document).ready(function() {
 
 var catArray2 = []; 
 
 
 
	            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Services/Services.aspx/FetchCatNames",
                dataType: "json",
                data: "{}",
               
                success: function(data) {
                
                var items = [];

                $.each(data.d, function(i, item) {

                
                catArray2.push(parseInt(item.CatId));

                });  // close each()            
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
           
            

            
$.ajax({
type: "POST",
contentType: "application/json; charset=utf-8",
url: "Services/Services.aspx/BindDatatable",
data: "{}",
dataType: "json",
success: function(data) {
for (var i = 0; i < data.d.length; i++) {


 $("#hiddenresult").append('<aside id="category_box" class="category_box_style"><div id="img_placeholder"><a href="fullDetails.aspx?id='+ data.d[i].ItemId+'&grp='+ data.d[i].CatId+'" target="_self"><img src="'+ data.d[i].ItemPath+'" alt="Items" title="'+data.d[i].ItemName+'" width="150" height="150" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="category_header"><a href="fullDetails.aspx?id='+ data.d[i].ItemId+'&grp=3" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div class="style2" style="margin-top:8px;">Rs.'+data.d[i].ItemPrice+'</div></div> </div></div> </aside>');
}
initPagination();
	    //
		  $("#fetching").hide();
},
error: function(result) {
alert("Error");
}
});


//$.ajax({
//type: "POST",
//contentType: "application/json; charset=utf-8",
//url: "Services/Services.aspx/BindDatatable",
//data: "{}",
//dataType: "json",
//success: function(data) {
//for (var i = 0; i < data.d.length; i++) {

//    if(parseInt(data.d[i].CatId) == catArray2[0]){
//     $("#specialItems").append('<aside id="category_box" class="category_box_style"><div id="category_header"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp=3" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div id="img_placeholder"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp='+ data.d[i].CatId+'" target="_self"><img src="'+data.d[i].ItemPath+'" alt="Items" title="Items" width="151" height="151" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[i].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style"><div id="add_link"><a id = "addBtn'+ data.d[i].ItemId+'" href="" type="button" target="_self" class="add" onclick="DoAction('+ data.d[i].ItemId+','+ data.d[i].CatId+');">ADD</a></div></div></div> </div></div> </aside>');
//    }
//    if(parseInt(data.d[i].CatId) == catArray2[1]){

//    $("#EcoItems").append('<aside id="category_box" class="category_box_style"><div id="category_header"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp=5" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div id="img_placeholder"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp='+ data.d[i].CatId+'" target="_self"><img src="'+data.d[i].ItemPath+'" alt="Items" title="Items" width="151" height="151" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[i].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style"><div id="add_link"><a id = "addBtn'+ data.d[i].ItemId+'" href="" type="button" target="_self" class="add" onclick="DoAction('+ data.d[i].ItemId+','+ data.d[i].CatId+');">ADD</a></div></div></div> </div></div> </aside>');
//    
//    }
//}
//},
//error: function(result) {
//alert("Error");
//}
//});


//$.ajax({
//type: "POST",
//contentType: "application/json; charset=utf-8",
//url: "Services/Services.aspx/BindDatatable",
//data: "{'CatgId':"+catArray[1]+"}",
//dataType: "json",
//success: function(data) {
//for (var i = 0; i < data.d.length; i++) {


// $("#EcoItems").append('<aside id="category_box" class="category_box_style"><div id="category_header"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp=5" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div id="img_placeholder"><a href="iteminfo.aspx?id='+ data.d[i].ItemId+'&grp='+ data.d[i].CatId+'" target="_self"><img src="'+data.d[i].ItemPath+'" alt="Items" title="Items" width="151" height="151" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[i].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style"><div id="add_link"><a id = "addBtn'+ data.d[i].ItemId+'" href="" type="button" target="_self" class="add" onclick="DoAction('+ data.d[i].ItemId+','+ data.d[i].CatId+');">ADD</a></div></div></div> </div></div> </aside>');
//}
//},
//error: function(result) {
//alert("Error");
//}
//});
});