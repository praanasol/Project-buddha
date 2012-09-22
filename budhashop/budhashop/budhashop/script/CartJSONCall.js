function DoAction(id,typeC)
             {
            $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Services/Services.aspx/SetSessionValue",
            data: "{'Name':'CartPicks','ID':'" + id+"','Type':'"+typeC+"'}",
            dataType: "json",
            async: false,
            success: function(data1){
                        
                       if( eval(data1.d))
                     alert( "Item Added to cart. ");
                    
                   },
                   error: function(result) {
                    alert("Error");
                    }
             });
            return false;
          }