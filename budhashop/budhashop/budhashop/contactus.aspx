﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="budhashop.contactus" Title="Contact Page  - Go Vedic - Online Shopping - Traditional and Natural Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style type="text/css">
                .web_dialog_overlay
                {
                    display: none;
                    position: fixed;
                    top: 0;
                    right: 0;
                    height: 100%;
                    width: 100%;
                    background: #000000;
                    opacity: .6;
                    filter: alpha(opacity=15);
                    -moz-opacity: .15;
                    z-index:101;
                }
                .web_dialog
                {
                    display:none;
                    position: absolute;
                    top:310px;
                    left:459px;
                    z-index: 102;
                }
        </style>
        <script type="text/javascript">
            $(document).ready(function() {
                $('#btnComplaint').click(function(){
                    budhashop.USER.Services.LoginControl.Getuser(CheckUserStatus, onerror);
                });
                $('#btnClose').click(function(){
                    $('.web_dialog').fadeOut("slow");
                    $('.web_dialog_overlay').hide();
                    $('.btnComplaintDiv').show();
                });
                $("input[id$='txt_Pid']").blur(function(){
                    var pid = $("[id$=txt_Pid]").val();
                    var regexnumber=/^[0-9]+$/;
                    var isInteger=regexnumber.test(pid);
                    if(pid==""){
                        $("#img_pid").attr({src:"../images/unavailable.png",alt:"Invalid Entry"});
                        $("[id$=lbl_resultComplaint]").text("Enter Purchse Id");
                    }
                    else if(isInteger==true)
                    {
                        $('#preloader').show();
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "contactus.aspx/checkPid",
                            data: "{'Pid':'" +pid+"'}",
                            dataType: "json",
                            success: function(data){
                                $('#preloader').hide();
                                if(eval(data.d) == "1"){
                                    $("#img_pid").attr({src:"../images/tick.png",alt:"Valid"});
                                    $("[id$=lbl_hdn]").text("Valid");
                                    $("[id$=lbl_resultComplaint]").text("");
                                    $("[id$=txt_msgComplaint]").focus();
                                }
                                else if(eval(data.d) == "0"){
                                    $("#img_pid").attr({src:"../images/unavailable.png",alt:"Invalid Entry"});
                                    $("[id$=lbl_resultComplaint]").text("Enter Valid Purchase Id");
                                    $("[id$=lbl_hdn]").text("Invalid");
                                    $("[id$=txt_Pid]").focus();
                                }
                            },
                            error: function(result){
                                $('#preloader').hide();
                                $("#img_pid").attr({src:"../images/unavailable.png",alt:"Invalid Entry"});
                                $("[id$=lbl_resultComplaint]").text("Error Occured, Please try again.");
                                $("[id$=txt_Pid]").focus();
                            }
                        });
                    }
                    else {
                        $("#img_pid").attr({src:"../images/unavailable.png",alt:"Invalid Entry"});
                        $("[id$=lbl_resultComplaint]").text("Enter Valid Purchse Id");
                    }
                });
//                $("[id$=txt_msgComplaint]").focus(function(){
//                    var validPid=$("[id$=lbl_resultComplaint]").text();
//                    var pid = $("[id$=txt_Pid]").val();
//                    if(validPid != "" || pid=="")
//                        $("[id$=txt_Pid]").focus();
//                });
            });
            function CheckUserStatus(result){
                if(result!='nouser'){
                    $('.web_dialog').fadeIn("slow");
                    $('.web_dialog_overlay').show();
                    $('.btnComplaintDiv').hide();
                    
                    $("[id$=txt_userName]").val('');
                    $("[id$=txt_Pid]").val('');
                    $("[id$=txt_msgComplaint]").val('');
                    $("[id$=lbl_resultComplaint]").text("");
                    $("[id$=txt_userName]").focus();
                }
                else{
                    $('#notLoggedIn').text('You are not Logged In, Please Login to Proceed.');
                    $('#notLoggedIn').fadeIn(500);
                    $("#notLoggedIn").delay(5000).fadeOut(500);
                }
            }
            function onerror(result){
                $('#notLoggedIn').text('Error Occured, Please try again later.');
                $('#notLoggedIn').fadeIn(500);
                $("#notLoggedIn").delay(5000).fadeOut(500);
            }
            function RegisterComplaint()
            {
                var name = $("[id$=txt_userName]").val();
                var pid = $("[id$=txt_Pid]").val();
                var message = $("[id$=txt_msgComplaint]").val();
                var validPid = $("[id$=lbl_hdn]").text();
                var checkunameFormat = /^[a-zA-Z0-9 \s .]+$/;
                var checkMsgFormat =/^[a-zA-Z0-9 \s \- \/ \[ \] .:,()#@$*]+$/;
                var hh=message.match(checkMsgFormat);
                if(name==""){ $("[id$=lbl_resultComplaint]").text("Enter your Name"); $("[id$=txt_userName]").focus(); }
                else if(name.match(checkunameFormat)==null){ $("[id$=lbl_resultComplaint]").text("Enter Valid Name"); $("[id$=txt_userName]").focus(); }
                else if(pid==""){ $("[id$=lbl_resultComplaint]").text("Enter Purchase Id"); $("[id$=txt_Pid]").focus(); }
                else if(validPid=="Invalid"){ $("[id$=lbl_resultComplaint]").text("Enter Valid Purchase Id"); $("[id$=txt_Pid]").focus(); }
                else if(validPid=="undefined"){ $("[id$=lbl_resultComplaint]").text("Error Occured, Please try again Later."); $("[id$=txt_Pid]").focus(); }
                else if(message==""){ $("[id$=lbl_resultComplaint]").text("Enter Message"); $("[id$=txt_msgComplaint]").focus(); }
                else if(message.match(checkMsgFormat)==null){ $("[id$=lbl_resultComplaint]").text("Invalid Characters Entered"); $("[id$=txt_msgComplaint]").focus(); }
                else if(message.length>100){ $("[id$=lbl_resultComplaint]").text("Should not exeed 100 characters"); $("[id$=txt_msgComplaint]").focus(); }
                else {
                    $("#preloader").show();
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "contactus.aspx/fileComplaint",
                        data: "{'Name':'" +name+"','PId':'"+pid+"','Message':'"+message+"'}",
                        dataType: "json",
                        success: function(data){
                            $("#preloader").hide();
                            if(eval(data.d) == true){
                                $('.web_dialog').hide();
                                $('.web_dialog_overlay').hide();
                                $('.btnComplaintDiv').show();
                                
                                $('#notLoggedIn').text('Your Complaint Submitted Successfully, Thank You.');
                                $('#notLoggedIn').fadeIn(500);
                                $("#notLoggedIn").delay(5000).fadeOut(500);
                            }
                            else{
                                $("[id$=lbl_resultComplaint]").text("Error Occured, Please try again Later.");
                            }
                        },
                        error: function(result){
                            $("#preloader").hide();
                            $("[id$=lbl_resultComplaint]").text("Error Occured, Please try again.");
                        }
                    });
                }
             }
        </script>
<div id="box_header" style="width:985px;">
    	<h2>Contact</h2>
      
</div>

    <div id="p_data_area" class="box_style" style="height:500px;">
        <div id="profileDiv">
            <aside id="p_data" class="main_box_style" style=" margin-top:100px;">
                <section id="p_d_fields">
                    <div id="p_d_field_area"><div id="p_d_label" style="width:auto; font-size:12px; text-align:center";>
                            For any details you can contact us through email or phone.</div>
                        <div id="p_d_label" style="width:auto; font-size:16px; margin:50px 0 0 70px;">
                            Email: support@govedic.com  </div>
                            
                        <div id="p_d_label" style="width:auto; font-size:16px; margin:20px 0 0 50px;">
                            Phone: +91 8125878727 ( 9 AM - 6 PM )</div>
                    </div>
                </section>
                <br style="clear:both;" /><br />
            </aside>
        </div>
         <div id="but_style" style="width: 535px; margin-left:200px;">
         <div id="p_d_label" class="btnComplaintDiv" style="width:auto; margin-left:50px;">For complaints regarding purchase and delivery.</div>
                        <div id="to_left"><a id="btnComplaint" href="#" class="l_go">Click here</a></div>
                        <div id="notLoggedIn" style="display:none; top: 510px; left: 520px; position: absolute; height: 22px; width: auto; padding: 8px 20px 2px; font-weight:bold; font-size:14px;" class="p_f_box_style"></div>
    <div class="web_dialog_overlay"></div>
         
         </div>
         
        <%--<div id="p_d_label" class="btnComplaintDiv" style="width:auto; margin-left:240px;">Click <a id="btnComplaint" href="#">here</a> to file a Complaint</div>--%>
        <div id="complaintField" class="web_dialog">
            <aside id="p_data" class="main_box_style" style=" margin-top:20px;">
                <div style="width:500px; margin:5px 0px 0px 5px;" class="text">Text Here</div>
                <section id="p_d_fields">
                    <div id="p_d_field_area" style="width:490px; height:21px;">
                        <div id="p_d_label">
                            Name :</div>
                        <div id="p_d_field" class="style4">
                            <asp:TextBox ID="txt_userName" CssClass="p_f_form_style" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </div>
                    <div id="p_d_field_area" style="width:490px; height:21px;">
                        <div id="p_d_label">
                            Purchase Id :</div>
                        <div id="p_d_field" class="style4" style="width:auto;">
                            <asp:TextBox ID="txt_Pid" CssClass="p_f_form_style" runat="server" Width="200px"></asp:TextBox>
                            <img id="img_pid" src="" alt="" style="position:absolute; padding:5px 0px 0px 2px;" />
                        </div>
                    </div>
                    <div id="p_d_field_area" style="width:490px; height:21px;">
                        <div id="p_d_label" style="margin-top:20px;">
                            Message :</div>
                        <div id="p_d_label" style="margin-top:35px; margin-left:-100px; font-size:10px;">
                            (Max 100 Charcters)</div>
                        <div id="p_d_field" class="style4">
                            <asp:TextBox ID="txt_msgComplaint" TextMode="MultiLine" Rows="5" Height="90" CssClass="p_f_form_style" runat="server" Width="200px"></asp:TextBox>
                        </div>
                    </div>
                    <div id="p_d_field_area" style="width:490px; height:21px; margin-top:80px;">
                        <div id="but_style" style="margin-left:100px; padding:5px 0px 0px 5px;">
                            <input id="btn_submitComplaint" onclick="return RegisterComplaint();" class="l_go" type="button" value="Submit" runat="server" />
                        
                        <div id="login_links1" style="float:right; padding-left:290px; margin-top:-15px;">
            <a href="#" id="btnClose" class="l_links1">Close</a>
            </div></div>
                    </div>
                    <div id="p_d_field_area" style="width:490px; height:21px; margin-top:10px;">
                        <asp:Label ID="lbl_resultComplaint" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                   
                     </div>
                </section>
                
                
            </aside>
           
            
            
        </div>
    </div>
    
    <asp:Label ID="lbl_hdn" runat="server" style="display:none;"></asp:Label>
</asp:Content>
