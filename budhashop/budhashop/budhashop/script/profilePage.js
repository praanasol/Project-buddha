$(document).ready(function() {
        
        var itemString = $('.orderGrid tr td:eq(2)').text();
        var addrString = $('.orderGrid tr td:eq(3)').text();
        RowSelected(itemString,addrString);

        $("#btnClose").click(function (e){
            $("#overlay").hide();
            $("#ProfileField").fadeOut("slow");
        });

        $("#hyplink_edit").click(function(){
            var emailid = $("[id$=txt_emailid]").val(); $("[id$=txt_emailidedit]").val(emailid);
            var uname = $("[id$=txt_uname]").val(); $("[id$=txt_unameedit]").val(uname);
            var phno = $("[id$=txt_phno]").val(); $("[id$=txt_phnoedit]").val(phno);
            var address = $("[id$=txt_address]").val(); $("[id$=txt_addressedit]").val(address);
            var userstatus = $("[id$=lbl_status]").text(); $("[id$=lbl_result]").text(userstatus);

            $("#overlay").show();
            $("#ProfileField").fadeIn("slow");
            
            $("#overlay").click(function (e){
                $("#overlay").unbind("click");
            });
        });

        $("#btnClose1").click(function (e){
            $("#overlay").hide();
            $("#PasswordField").fadeOut("slow");
        });

        $("#hyplink_changepwd").click(function(){
            var emailid = $("[id$=txt_emailid]").val(); $("[id$=txt_emailidpwd]").val(emailid);
            $("[id$=txt_oldpwd]").val(''); $("[id$=txt_newpwd]").val(''); $("[id$=txt_confirmnewpwd]").val('');

            $("#overlay").show();
            $("#PasswordField").fadeIn("slow");
            
            $("#overlay").click(function (e){
                $("#overlay").unbind("click");
            });
        });

        $(".orderGrid tr").filter(function() {
            return $('td', this).length && !$('table', this).length
        })
            .click(function(event) {
                $("#itemsDiv").hide();
                var row = jQuery(this)
                var itemString = row.children("td:eq(2)").text();
                var addrString = row.children("td:eq(3)").text();
                RowSelected(itemString,addrString);
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
                $('[id$=contentDiv]').jScrollPane({
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

function RowSelected(itemString,addrString)
{
    $("#itemsDiv").show(500);
    var primeArray = addrString.split(";");
    $("#NameA").html(primeArray[0]);
    $("#PhnA").html(primeArray[1]);
    $("#AdrA").html(primeArray[2]);
    
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "ProfilePage.aspx/GetOrderedItems",
        data: "{'itemString':'"+ itemString +"'}",
        dataType: "json",

        success: function(data) {
        $("#itemTable tr:gt(0)").remove();
        for (var i = 0; i < data.d.length; i++) {
            $('#itemTable tr:last').after('<tr> <td>'+data.d[i].ItemId+'</td> <td>'+data.d[i].ItemName+'</td> <td><img src="'+data.d[i].ItemPath+'" width="70" height="50" border="1"></td> <td>'+data.d[i].BilledRate+'</td> <td>'+data.d[i].ItemQty+'</td> <td>'+data.d[i].TotalRate+'</td> </tr>');
        }
    },
    error: function(data) {
        alert("error");
        }
    });
}

function updateName(){
        $("[id$=lbl_result]").text("");
        var newuname = $("[id$=txt_unameedit]").val();
        var uname = $("[id$=txt_uname]").val();
        if(newuname==""){$("[id$=lbl_result]").text("User Name Cannot be Empty");  $("[id$=txt_nameedit]").focus();}
        else if(uname==newuname){$("[id$=lbl_result]").text("No Changes Made...");  $("[id$=txt_nameedit]").focus();}
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
        if(newaddress==""){$("[id$=lbl_result]").text("Address Cannot be Empty");  $("[id$=txt_addressedit]").focus();}
        else if(address==newaddress){$("[id$=lbl_result]").text("No Changes Made...");  $("[id$=txt_addressedit]").focus();}
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
        if(oldpwd==""){$("[id$=lbl_resultpwd]").text("Password Cannot be Empty");  $("[id$=txt_oldpwd]").focus();}
        else if(newpwd==""){$("[id$=lbl_resultpwd]").text("Password Cannot be Empty");  $("[id$=txt_newpwd]").focus();}
        else if(newpwd.length < 5){$("[id$=lbl_resultpwd]").text("Password Should Contain atleast 5 Characters");  $("[id$=txt_newpwd]").focus();}
        else if(newpwd != newpwd1){$("[id$=lbl_resultpwd]").text("Passwords Donot Match");  $("[id$=txt_confirmnewpwd]").focus();}
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
        $("#preloader").hide();
        //alert("Error Calling service method:);
        window.location.replace("../homepage.aspx");
    }