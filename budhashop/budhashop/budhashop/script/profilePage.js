﻿$(document).ready(function() {
        var emailid = $("[id$=txt_emailid]").val();
        var uname = $("[id$=txt_uname]").val();
        var phno = $("[id$=txt_phno]").val();
        var address = $("[id$=txt_address]").val();
        
        if(uname=="" || phno=="" || address==""){
            $('#profileIncomplete').fadeIn(500);
            $("#profileIncomplete").delay(4000).fadeOut(500);
//            $('#profileIncomplete').delay(750).show("explode", {pieces: 16}, 500);
//            $("#profileIncomplete").delay(3000).effect("explode", {color:"#AC1812",mode:"fadeOut"}, 500);
            $("[id$=lbl_status]").text("Profile Incomplete...");
        }
        
        if($('.orderGrid tr').length==1) {
            // grid is empty
            $('#itemsDiv').slideToggle(10);
            $('#grid_res').slideToggle(10);
        }
        
        else {
            var itemString = $('.orderGrid tr td:eq(2)').text();
            var addrString = $('.orderGrid tr td:eq(3)').text();
            var sizeString = $('.orderGrid tr td:eq(8)').text();
            $('#itemsDiv').slideToggle(10);
            RowSelected(itemString,addrString,sizeString);
        }

        $("#btnClose").click(function (e){
            var uname = $("[id$=txt_uname]").val();
            var phno = $("[id$=txt_phno]").val();
            var address = $("[id$=txt_address]").val();
            if(uname!="" && phno!="" && address!=""){
                $("[id$=lbl_status]").text("");
            }
            $("#ProfileField").fadeOut("slow");
            $("#overlay").hide();
        });

        $("#hyplink_edit").click(function(){
            budhashop.USER.Services.LoginControl.Getuser(CheckUserStatus, onerror);
        });

        $("#btnClose1").click(function (e){
            $("#PasswordField").fadeOut("slow");
            $("#overlay").hide();
        });

        $("#hyplink_changepwd").click(function(){
            budhashop.USER.Services.LoginControl.Getuser(CheckUserStatus1, onerror);            
        });

        $(".orderGrid tr").filter(function() {
            return $('td', this).length && !$('table', this).length
        })
            .click(function(event) {
                if($('.orderGrid tr').length!=1){
                    $("#itemsDiv").slideToggle(10);
                    var row = jQuery(this)
                    var itemString = row.children("td:eq(2)").text();
                    var addrString = row.children("td:eq(3)").text();
                    var sizeString = row.children("td:eq(8)").text();
                    RowSelected(itemString,addrString,sizeString);
                }
            })
            .mouseover(function() {
                $(this).css("cursor", "pointer");
            })
            .css({ background: "e7cd73" }).hover(
                function() { $(this).css({ background: "#f3ad2c" }); },
                function() { $(this).css({ background: "#e7cd73" }); }
            );

//            $("#btnCloseOrders").click(function(){
//                $("#itemsDiv").slideUp("slow");
//            });

            //Scripts for Scroll Pane
                //$('#contentDiv').jScrollPane();
                
               
//                $('.scroll-pane').jScrollPane({
//                    horizontalGutter:5,
//                    verticalGutter:5,
//                    'showArrows': false
//                });
//                
//                
//                
//                $('.jspDrag').hide();
//                $('.jspScrollable').mouseenter(function(){
//                    $(this).find('.jspDrag').stop(true, true).fadeIn('slow');
//                });
//                $('.jspScrollable').mouseleave(function(){
//                    $(this).find('.jspDrag').stop(true, true).fadeOut('slow');
//                });
});

function RowSelected(itemString,addrString,sizeString)
{
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/USER/Services/LoginControl.asmx/Getuser",
        dataType: "json",

        success: function(data) {
            if(data.d!='nouser'){
                $("#itemsDiv").slideToggle(500);
                var primeArray = addrString.split(";");
                $("#NameA").html(primeArray[0]);
                $("#PhnA").html(primeArray[1]);
                $("#AdrA").html(primeArray[2]);
                
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "ProfilePage.aspx/GetOrderedItems",
                    data: "{'itemString':'"+ itemString +"','sizeString':'"+ sizeString +"'}",
                    dataType: "json",

                    success: function(data) {
                        $("#itemTable tr:gt(0)").remove();
                        for (var i = 0; i < data.d.length; i++) {
                            $('#itemTable tr:last').after('<tr> <td>'+data.d[i].ItemId+'</td> <td>'+data.d[i].ItemName+'</td> <td><img src="'+data.d[i].ItemPath+'" width="50" height="50" border="1"></td> <td>'+data.d[i].BilledRate+'</td> <td>'+data.d[i].ItemQty+'</td> <td>'+data.d[i].TotalRate+'</td> <td>'+data.d[i].Size+'</td> </tr>');
                        }
                    },
                    error: function(data) {
                        alert("error");
                    }
                });
            }
            else{
                alert('Your Session has Expired...');
                window.location.replace('../homepage.aspx');
            }
        },
        error: function(data) {
            alert("error");
        }
    });
}

function CheckUserStatus(result){
        if(result!='nouser'){
            var emailid = $("[id$=txt_emailid]").val(); $("[id$=txt_emailidedit]").val(emailid);
            var uname = $("[id$=txt_uname]").val(); $("[id$=txt_unameedit]").val(uname);
            var phno = $("[id$=txt_phno]").val(); $("[id$=txt_phnoedit]").val(phno);
            var address = $("[id$=txt_address]").val(); $("[id$=txt_addressedit]").val(address);
            $("[id$=lbl_result]").text('');

            $("#overlay").show();
            $("#ProfileField").fadeIn("slow");
        }
        else{
            alert('Your Session has Expired...');
            window.location.replace('../homepage.aspx');
        }
    }
    
function CheckUserStatus1(result){
        if(result!='nouser'){
            var emailid = $("[id$=txt_emailid]").val(); $("[id$=txt_emailidpwd]").val(emailid);
            $("[id$=txt_oldpwd]").val(''); $("[id$=txt_newpwd]").val(''); $("[id$=txt_confirmnewpwd]").val('');
            $("[id$=lbl_resultpwd]").text('');

            $("#overlay").show();
            $("#PasswordField").fadeIn("slow");
        }
        else{
            alert('Your Session has Expired...');
            window.location.replace('../homepage.aspx');
        }
    }

function updateName(){
        $("[id$=lbl_result]").text("");
        var newuname = $("[id$=txt_unameedit]").val();
        var uname = $("[id$=txt_uname]").val();
        var checkunameFormat = /^[a-zA-Z0-9 \s .]+$/;
        if(newuname==""){$("[id$=lbl_result]").text("User Name Cannot be Empty");  $("[id$=txt_nameedit]").focus();}
        else if(uname==newuname){$("[id$=lbl_result]").text("No Changes Made...");  $("[id$=txt_nameedit]").focus();}
        else if(newuname.match(checkunameFormat)==null){$("[id$=lbl_result]").text("Enter Valid Name");  $("[id$=txt_nameedit]").focus();}
        else
        {
            $("#preloader").show();
            budhashop.USER.Services.LoginControl.UpdateProfile(newuname, "name", OnComplete, onerror);
        }
    }
    
function OnComplete(result) {
        $("#preloader").hide();
        if(result){ $("[id$=lbl_result]").text("User Name Updated..."); var newuname = $("[id$=txt_unameedit]").val(); $("[id$=txt_uname]").val(newuname); }
        else{ $("[id$=lbl_result]").text("Error Updating, Try Again..."); }
    }
    
function updatePhNum(){
        $("[id$=lbl_result]").text("");
        var newphno = $("[id$=txt_phnoedit]").val();
        var phno = $("[id$=txt_phno]").val();
        var pattern = /^\d{10}$/;
        if(newphno==""){$("[id$=lbl_result]").text("Phone Number Cannot be Empty");  $("[id$=txt_phnoedit]").focus();}
        else if(newphno.match(pattern)==null){$("[id$=lbl_result]").text("Enter Valid 10 digit Mobile Number");  $("[id$=txt_phnoedit]").focus();}
        else if(phno==newphno){$("[id$=lbl_result]").text("No Changes Made...");  $("[id$=txt_phnoedit]").focus();}
        else
        {
            $("#preloader").show();
            budhashop.USER.Services.LoginControl.UpdateProfile(newphno, "phno", OnSucceeded, onerror);
        }
    }
    
function OnSucceeded(result) {
        $("#preloader").hide();
        if(result){ $("[id$=lbl_result]").text("Phone Number Updated..."); var newphno = $("[id$=txt_phnoedit]").val();  $("[id$=txt_phno]").val(newphno); }
        else{ $("[id$=lbl_result]").text("Error Updating, Try Again..."); }
    }
    
function updateAddress(){
        $("[id$=lbl_result]").text("");
        var newaddress = $("[id$=txt_addressedit]").val();
        var address = $("[id$=txt_address]").val();
        var checkAddressFormat =/^[a-zA-Z0-9 \s \- \/ .:,]+$/;
        if(newaddress==""){$("[id$=lbl_result]").text("Address Cannot be Empty");  $("[id$=txt_addressedit]").focus();}
        else if(address==newaddress){$("[id$=lbl_result]").text("No Changes Made...");  $("[id$=txt_addressedit]").focus();}
        else if(newaddress.match(checkAddressFormat)==null){$("[id$=lbl_result]").text("Enter Valid Address");  $("[id$=txt_addressedit]").focus();}
        else
        {
            $("#preloader").show();
            budhashop.USER.Services.LoginControl.UpdateProfile(newaddress, "address", OnCompleted, onerror);
        }
    }
function OnCompleted(result) {
        $("#preloader").hide();
        if(result){ $("[id$=lbl_result]").text("Address Updated..."); var newaddress = $("[id$=txt_addressedit]").val();   $("[id$=txt_address]").val(newaddress); }
        else{ $("[id$=lbl_result]").text("Error Updating, Try Again..."); }
    }
    
function updatePassword(){
        $("[id$=lbl_resultpwd]").text("");
        var oldpwd = $("[id$=txt_oldpwd]").val();
        var newpwd = $("[id$=txt_newpwd]").val();
        var newpwd1 = $("[id$=txt_confirmnewpwd]").val();
        var checkPwdFormat = /^[a-zA-Z0-9 \s \- _.#@*]+$/;
        if(oldpwd==""){$("[id$=lbl_resultpwd]").text("Password Cannot be Empty");  $("[id$=txt_oldpwd]").focus();}
        else if(newpwd==""){$("[id$=lbl_resultpwd]").text("Password Cannot be Empty");  $("[id$=txt_newpwd]").focus();}
        else if(newpwd.length < 5){$("[id$=lbl_resultpwd]").text("Password Should Contain atleast 5 Characters");  $("[id$=txt_newpwd]").focus();}
        else if(newpwd.match(checkPwdFormat)==null){$("[id$=lbl_resultpwd]").text("Special Characters allowed ., ,@,#,*,-,_");  $("[id$=txt_newpwd]").focus();}
        else if(newpwd != newpwd1){$("[id$=lbl_resultpwd]").text("Passwords Donot Match");  $("[id$=txt_confirmnewpwd]").focus();}
        else if(oldpwd.match(checkPwdFormat)==null){$("[id$=lbl_resultpwd]").text("Wrong Password");  $("[id$=txt_oldpwd]").focus();}
        else
        {
            $("#preloader").show();
            budhashop.USER.Services.LoginControl.UpdatePassword(oldpwd, newpwd, OnReturn, onerror);
        }
    }
    
function OnReturn(result) {
        $("#preloader").hide();
        if(result){ $("[id$=lbl_resultpwd]").text("Password Changed Succesfully..."); }
        else{ $("[id$=lbl_resultpwd]").text("Your Old Pasword is Wrong"); $("[id$=txt_oldpwd]").focus(); }
    }

function onerror(result){
        //alert("Error Calling service method:);
        alert('Your Session has Expired...');
        window.location.replace("../homepage.aspx");
    }