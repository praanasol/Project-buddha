function DoAction(id,typeC)
             {
            $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "/Services/Services.aspx/SetSessionValue",
            data: "{'Name':'CartPicks','ID':'" + id+"','Type':'"+typeC+"'}",
            dataType: "json",
            success: function(data1){
                        
                        if(!eval(data1)){
                        
                     alert( "Data Saved: " +  eval(data1.d) );
                     }
                   },
                   error: function(result) {
                    alert("Error");
                    }
             });
            return false;
          }