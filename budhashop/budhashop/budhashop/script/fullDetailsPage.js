$(document).ready(function() {
    var s = window.location.search.substr(1);
    if(s=="")
    {
        window.location.replace("homepage.aspx");
    }
    else
    {
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
        else
        {   
            window.location.replace("homepage.aspx");//redirect to home page
        }
        if(search1.grp != null)
        {
            grpc = search1.grp;
        }
        else
        {
            window.location.replace("homepage.aspx");//redirect to home page
        }
        var flag = 0;
        if(grpc==1)
        {
            flag = 1;
        }
        else
        {
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
                $("#addCartBtn").append('<a id="addBtn" href="" class="f_d_link" onclick="DoAction('+ data.d[0].ItemId+','+ data.d[0].CatId+');">Add to Cart</a>');
                //$("#itemsBox").append('<aside id="inner_category_box" class="category_box_style"><div id="category_header"><a href="#" target="_self" class="link1">'+ data.d[0].ItemId+'</a></div><div id="img_placeholder"><a href="#" target="_self"><img src="'+data.d[i].ItemPath+'" alt="Items" title="Items" width="151" height="151" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[0].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style"><div id="add_link"><a id = "addBtn'+ data.d[0].ItemId+'" href="" type="button" target="_self" class="add" onclick="DoAction('+ data.d[0].ItemId+','+ data.d[0].CatId+');">ADD</a></div></div></div> </div></div> </aside>');

                $("#imgItem").append('<img src="'+data.d[0].ItemPath+'" alt="Item" title="Item" width="110" height="110" class="img_class" border="0">');
                $("#fullimg").append('<img src="../itemimages/'+data.d[0].CatId+'/'+data.d[0].ItemId+'/'+data.d[0].ItemId+'Photomedium.jpg" alt="Items" title="Items" width="300" height="300" border="0"/>');

                $("#idTxt").append(data.d[0].ItemId);
                $("#nameTxt").append(data.d[0].ItemName);
                $("#priceTxt").append(data.d[0].ItemPrice);
                $("#descBox").append(data.d[0].ItemDesc);

            }
        },
        error: function(result) {
                alert("Error");
            }
        });
    }

    $("[id$=imgItem]").hover(function(e) {          
        e.preventDefault();
        $("[id$=img_menu]").toggle();
    });

    $("[id$=img_menu]").mouseup(function() {
        return false
    });

});