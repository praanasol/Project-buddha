$(document).ready(function(){
        $("#RegisterControl").hide();
        var isPostBackObject = document.getElementById('isPostBack');
        if (isPostBackObject != null) 
        {
            $("#CartDiv").hide();
            $("#adressDiv").show();
        }
        else
        {
            $("#adressDiv").hide();
            $("#CartDiv").show();
        }

        var ItemsCount = $("#ctl00_ContentPlaceHolder1_noOfItemsLbl").text();
        if(ItemsCount == "0"){
//            $("#btn_ConfirmOrder").hide();
            window.location.replace("../homepage.aspx");
        }

        $("#btnClose").click(function (e){
            //Clear Login Popup Fields
            $("[id$=lbl_result]").text("");
            $("[id$=txt_emailid]").val('');
            $("[id$=txt_pwd]").val('');
            //Clear Register Popup Fields
            $("[id$=lbl_result2]").text("");
            $("[id$=txt_emailid2]").val('');
            $("[id$=txt_pwd2]").val('');
            $("[id$=txt_confirmpwd2]").val('');
            //Close Popup
            HideDialog();
        });

        $("#btn_ConfirmOrder").click(function(){
            $("#preloader").show();
            budhashop.USER.Services.LoginControl.Getuser(CheckUserSession, onerror);
        });
        
        $("#btn_cancel").click(function(){
           
           window.location.replace("../homepage.aspx");
        });
        
        $("#hyplink_register").click(function(){
            $("#LoginControl").hide();
            $("#RegisterControl").show();
        });

        $("#hyplink_login").click(function(){
            $("#RegisterControl").hide();
            $("#LoginControl").show();
        });
        
//        $('#LoginControl').keypress(function(e) {
//            if(e.which == 13) { // Checks for the enter key
//                checkLogin();
//            }
//        });
//        
//        $('#RegisterControl').keypress(function(e) {
//            if(e.which == 13) { // Checks for the enter key
//                checkEmail();
//            }
//        });
        
        $('[id$=o_items]').jScrollPane({
                    horizontalGutter:5,
                    verticalGutter:5,
                    'showArrows': false
                });
                
                $('.jspDrag').hide();
                $('.jspScrollable').mouseenter(function(){
                    $(this).find('.jspDrag').stop(true, true).fadeIn('slow');
                });
                $('.jspScrollable').mouseleave(function(){
                    $(this).find('.jspDrag').stop(true, true).fadeOut('slow');
                });
});

function ShowDialog(){
        $("#overlay").show();
        $("#dialog").fadeIn("slow");
        
        $("#overlay").click(function (e){
            $("#overlay").unbind("click");
        });
    }

function HideDialog(){
        $("#overlay").hide();
        $("#dialog").fadeOut("slow");
        //$("#dialog").fadeOut(300);
    }

function CheckUserSession(result){
        $("#preloader").hide();
        if(result!='nouser')
        {
            showadress();
        }
        else
        {
            $("#RegisterControl").hide();
            $("#LoginControl").show();
            ShowDialog();
        }
    }

function showadress() {
        //some code to user
        $("#preloader").show();
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "../USER/OrderPage.aspx/showAdress",
            dataType: "json",
            data: "{}",

            success: function(data) {
                $("#preloader").hide();
                for(var i=0;i<data.d.length;i++)
                {
                    $("[id$=txt_uname]").val(data.d[0].UserName);
                    $("[id$=txt_emailidadr]").val(data.d[0].EmailId);
                    $("[id$=txt_phno]").val(data.d[0].Phone);
                    $("[id$=txt_address]").val(data.d[0].Address);
                }
                $("#CartDiv").hide();//css('display','none');
                $("#adressDiv").show();
                // close each()            
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                $("#preloader").hide();
                alert(textStatus);
            }
        });
    }

function checkLogin() {
        $("[id$=lbl_result]").text("");
        var email = $("[id$=txt_emailid]").val();
        var pwd = $("[id$=txt_pwd]").val();
        var emailFormat = (/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
        if(email==""){$("[id$=lbl_result]").text("Enter Email Id");   $("[id$=txt_emailid]").focus();   }
        else if(email.match(emailFormat)==null){$("[id$=lbl_result]").text("Enter Valid Email Id");  $("[id$=txt_emailid]").focus();}
        else if(pwd==""){$("[id$=lbl_result]").text("Enter Password");    $("[id$=txt_pwd]").focus();    }
        else
        {
            $("#preloader").show();
            budhashop.USER.Services.LoginControl.LoginUser(email, pwd, OnSucceeded, onerror);
        }
    }

function OnSucceeded(result) {
        $("#preloader").hide();
        if(result=='nouser')
        {
            $("[id$=lbl_result]").text('Wrong Email Id/Password');
        }
        else
        {
            $("[id$=txt_emailid]").val('');
            $("[id$=txt_pwd]").val('');
            $("[id$=lbl_result]").text('');
            $("#overlay").hide();
            $("#dialog").hide();
            //document.write("You will be redirected to our main page in 5 seconds!");
            //setTimeout('Redirect()', 5000);
            //window.location="../USER/AddressPage.aspx";
            showadress();
            budhashop.USER.Services.LoginControl.Getuser(CheckSession, onerror);
        } 
    }

function checkEmail() {
        $("[id$=lbl_result2]").text("");
        var email = $("[id$=txt_emailid2]").val();
        var pwd = $("[id$=txt_pwd2]").val();
        var confirmpwd = $("[id$=txt_confirmpwd2]").val();
        var emailFormat = (/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
        if(email==""){$("[id$=lbl_result2]").text("Enter Email Id"); $("[id$=txt_emailid2]").focus();}
        else if(email.match(emailFormat)==null){$("[id$=lbl_result2]").text("Enter Valid Email Id");  $("[id$=txt_emailid2]").focus();}
        else if(pwd==""){$("[id$=lbl_result2]").text("Enter Password");   $("[id$=txt_pwd2]").focus();}
        else if(pwd.length < 5){$("[id$=lbl_result2]").text("Enter atleast 5 Characters");   $("[id$=txt_pwd2]").focus();}
        else if(pwd != confirmpwd){$("[id$=lbl_result2]").text("Passwords Do not Match");   $("[id$=txt_confirmpwd2]").focus();}
        else
        {
            $("#preloader").show();
            budhashop.USER.Services.LoginControl.RegisterUser(email, pwd, OnCompleted, onerror);
        }
    }

function OnCompleted(result) {
        $("#preloader").hide();
        if(result)
        {
            $("[id$=txt_username2]").val('');
            $("[id$=txt_emailid2]").val('');
            $("[id$=txt_pwd2]").val('');
            $("[id$=lbl_result2]").text('');
            $("#overlay").hide();
            $("#dialog").hide();
            showadress();
            budhashop.USER.Services.LoginControl.Getuser(CheckSession, onerror);
        }
        else
        {
            $("[id$=lbl_result2]").text('Email Id already registered.');
        } 
    }
    
function onerror(result){
        $("#preloader").hide();
        alert("Error calling service method.");
    }
    
function showOrderMailedDiv(){
        $("#preloader").hide();
        $('#overlay').show();
        $('#ordermailedDiv').show();
    }
    
function showOrderMailedDivError(){
        $("#preloader").hide();
        $('#overlay').show();
        $('#ordermailedDivError').show();
    }
    
function showPreloader(){
        $("#preloader").show();
    }