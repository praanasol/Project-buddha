$(document).ready(function(){
        $("#closeimg1").hide();
            budhashop.USER.Services.LoginControl.Getuser(CheckSession, onerror);

        $(".logintext").click(function(e) {          
            e.preventDefault();
            $("#user-status").slideToggle(500);
            $(".logintext").hide();
            $("#closeimg1").show();
        });

        $("#closeimg1").click(function(e) {          
            e.preventDefault();
            $("#user-status").slideToggle(500);
            $(".logintext").show(500);
            $("#closeimg1").hide();
        });
        
//        $('#login-required').keypress(function(e) {
//            if(e.which == 13) { // Checks for the enter key
//                checkLogin1();
//            }
//        });
});

function CheckSession(result) {
        if(result=='nouser')
        {
            $("#login-success").hide();
            $(".logintext").removeClass("usertext");
            $(".logintext").show();
        }
        else
        {
            OnSuccessLogin(result);
        }
    }

function checkLogin1() {
        var email = $("[id$=txt_emailid1]").val();
        var pwd = $("[id$=txt_pwd1]").val();
        var emailFormat = (/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
        if(email=="" || email=="Email ID..."){$("[id$=lbl_result1]").text("Enter Email Id");  $("[id$=txt_emailid1]").focus(); }
        else if(email.match(emailFormat)==null){$("[id$=lbl_result1]").text("Enter Valid Email Id");  $("[id$=txt_emailid1]").focus();}
        else if(pwd=="" || pwd=="      "){$("[id$=lbl_result1]").text("Enter Password");   $("[id$=txt_pwd1]").focus();   }
        else
        {
            $("#preloader").show();
            budhashop.USER.Services.LoginControl.LoginUser(email, pwd, OnSuccessLogin, onerror);
        }
    }
function OnSuccessLogin(result) {
        $("#preloader").hide();
        if(result!="nouser")
        {
            $("[id$=txt_emailid1]").val('');
            $("[id$=txt_pwd1]").val('');
            $("#login-required").hide();
            $("#login-success").show(500);
            $(".logintext").toggleClass("usertext");
            $("#logintext").html(result);
            $("#closeimg1").hide();
            $(".logintext").hide();
            //window.location.assign(window.location.href);
            //document.location.reload(true);
        }
        else
        {
            $("[id$=lbl_result1]").text('Wrong Email Id/Password');
        } 
    }

function onerror(result){
        $("#preloader").hide();
        alert("Error calling service method.");
    }