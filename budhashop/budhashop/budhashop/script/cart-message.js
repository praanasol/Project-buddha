$(document).ready(function(){// this will run when the document.ready event fires

    var x =$("[id$=totitems]").html();//this and below are asp hidden controls.
    var y=$("[id$=totalLbl]").html();
    var oy= $("[id$=hiddenCheck6]").val(); //this and below values are assigned from code behind.
    var ox =$("[id$=hiddenCheck5]").val();
    
    //using above value checking the condition to show messages.
    
    if ( x > ox && y > oy){
    
     $("[id$=message_2]").html("Product added");
     $("[id$=message_2]").fadeIn(1000, function(){
             $("[id$=message_2]").fadeOut(3000);
            $("#signin_menu").slideToggle();
        });
      }else if (x==ox && y > oy){
       
     $("[id$=message_2]").html("Cart updated");
     $("[id$=message_2]").fadeIn(1000, function(){
             $("[id$=message_2]").fadeOut(3000);
            $("#signin_menu").slideToggle();
        });
    } else if(x < ox && y < oy){
    if(y==0)
    {
    $("[id$=message_2]").html("Cart empty");
     $("[id$=message_2]").fadeIn(1000, function(){
             $("[id$=message_2]").fadeOut(3000);
            
        });
    }else{
     $("[id$=message_2]").html("Product removed");
     $("[id$=message_2]").fadeIn(1000, function(){
             $("[id$=message_2]").fadeOut(3000);
            
        });
        }
    } else {
     $("[id$=message_2]").html("");
    }
    
    //below code is for the order button to activate and to open cart.
    if(($("#noOfItemsLbl").text())!="0")
                {
                    $("#orderBtn1").removeAttr("disabled");
                }
        $("#signin").click(function () {
      $("#signin_menu").slideToggle();
    });
   
    });