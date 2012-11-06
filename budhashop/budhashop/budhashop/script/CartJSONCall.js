function DoAction(id,typeC)
             {
            $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "../fullDetails.aspx/SetSessionValue",
            data: "{'ID':'" + id+"','Type':'"+typeC+"'}",
            dataType: "json",
            async:false,
            success: function(data1){
                        
                        if(eval(data1.d) == 0)
                     {
                        alert( "Error occured. try again! ");
                     }
                     
                    
                   },
                   error: function(result) {
                    alert("Error");
                    }
             });
         
            
            return false;
          }
          
//             /*function DoAction(id,typeC)
//             {
//             
//              
//           CartControl.SetSessionValue(id, typeC, OnSucceeded, onerror);
//            }
//            
//            function OnSucceeded(result)
//            {
//            var result1=false;
//            result1=eval(result);
//            if( result1)
//                       {
//                     alert( "Item Added to cart. ");
//                     }
//                     else{
//                     alert( "Item already in cart. ");
//                     }
//            }
//            
//            function onerror(result){
//            
//            alert("Error: Unable to connect to service");
//            }            */