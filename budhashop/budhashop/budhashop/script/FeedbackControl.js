$(document).ready(function(){
 $(".feedback-body").hide();
        $("#img_fb").click(function(e) {
            //$(".feedback-body").show();
            $("[id$=txt_emailfb]").val('');
            $("[id$=txt_msg]").val('');
            $("[id$=lbl_emailfb]").text('');
            $("[id$=lbl_msg]").text('');
             $(".feedback-body").show();
            $(".feedback-body").animate({left:"0%"});
            $("#feedback").hide();
            e.stopPropagation();
        });
        
        $(document).click(function(e) {
           
            $(".feedback-body").animate({left:"-25%"});
             $(".feedback-body").hide(500);
            $("#feedback").show();
            e.stopPropagation();
            //$(".feedback-body").hide();
        });
        
        $("#feedback-body").click(function(e){
            e.stopPropagation();
        });
        
        $("#closeimg").click(function(e){
            $(".feedback-body").animate({left:"-25%"});
             $(".feedback-body").hide(500);
            $("#feedback").show();
        });

//        $("#btn_fbclose").click(function(){
//            $("#submittedFbDiv").hide();
//        });
});

function Fb_Submit()
{
    var email = $("[id$=txt_emailfb]").val();
    var msg = $("[id$=txt_msg]").val();
    var emailFormat = (/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
    if(email==""){$("[id$=lbl_emailfb]").text("Enter Email Id");  $("[id$=txt_emailfb]").focus(); }
    else if(email.match(emailFormat)==null){$("[id$=lbl_emailfb]").text("Enter Valid Email Id");  $("[id$=txt_emailfb]").focus();}
    else if(msg==""){$("[id$=lbl_msg]").text("Enter Message");   $("[id$=txt_msg]").focus();    $("[id$=lbl_emailfb]").text('');   }
    else if(msg.length>50){$("[id$=lbl_msg]").text("Should not exeed 50 characters");   $("[id$=txt_msg]").focus();   }
    else
    {
        $("#preloader").show();
        $.ajax({
        type: "POST",
        url: "../USER/Services/LoginControl.asmx/insertFeedback",
        data: "{'emailid':'"+ email +"','msg':'"+ msg +"'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",

        success: function(data) {
            $("#preloader").hide();
            if(data.d){
                $("#successFb-body").show();
                $("#failureFb-body").hide();
                $("[id$=txt_emailfb]").val('');
                $("[id$=txt_msg]").val('');
                $("[id$=lbl_emailfb]").text('');
                $("[id$=lbl_msg]").text('');
                
                $(".feedback-body").animate({left:"-21%"});
            $("#feedback").show();
            }
            else {
                $("#successFb-body").hide();
                $("#failureFb-body").show();
            }
            $("#submittedFbDiv").show();
            $("#submittedFbDiv").delay(3200).fadeOut(300);
        },
        error: function(data) {
            $("#preloader").hide();
            $("#successFb-body").hide();
            $("#failureFb-body").show();
            $("#submittedFbDiv").show();
            $("#submittedFbDiv").delay(3200).fadeOut(300);
        }
        });
    }
}