$(document).ready(function() {
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
    if(search1.catid != null && search1.catid != true) {
            var catID=search1.catid;
            var subCatId = search1.subcatid;
            var catArray = [];
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "../Services/Services.aspx/FetchSubCatNames",
                dataType: "json",
                data: "{'catId':'"+ catID +"'}",
                success: function(data) {
                    var items = [];
                    $.each(data.d, function(i, item) {
                    items.push('<li><a href="../itemspage.aspx?catid='+ catID +'&subcatid=' + item.SubCatId+ '" title="' + item.SubCatName+ '">' + item.SubCatName + '</a></li>');
                    catArray.push(parseInt(item.CatId));
                    });  // close each()
                    $('[id$=subCatArea]').append( items.join('') );
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });   
    
   
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "Services/Services.aspx/BindItemsData",
            data: "{'CatgId':'"+ catID +"','SubCatId':'"+ subCatId +"'}",
            dataType: "json",
            success: function(data) {
                for (var i = 0; i < data.d.length; i++) {
                    $("#hiddenresult").append('<aside id="category_box" class="category_box_style"><div id="img_placeholder"><a href="fullDetails.aspx?id='+ data.d[i].ItemId+'&grp='+ data.d[i].CatId+'" target="_self"><img src="'+ data.d[i].ItemPath+'" alt="Items" title="'+data.d[i].ItemName+'" width="150" height="150" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="category_header"><a href="fullDetails.aspx?id='+ data.d[i].ItemId+'&grp=3" target="_self" class="link1">'+ data.d[i].ItemName+'</a></div><div class="style2" style="margin-top:8px;">Rs.'+data.d[i].ItemPrice+'</div></div> </div></div> </aside>');
                }
                initPagination();
                $("#fetching").hide();
            },
            error: function(result) {
                alert("Error");
            }
        });
        
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
    }
    else {
        window.location.replace("homepage.aspx");
    }
});