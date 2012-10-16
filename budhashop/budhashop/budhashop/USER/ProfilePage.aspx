<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="budhashop.USER.ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
        <table align="center">
            <tr>
                <td>
                    Email Id</td>
                <td>
                    :</td>
                <td>
            <asp:TextBox ID="txt_emailid" runat="server" Width="180px"
                        ReadOnly="True" BackColor="#C0C561" ForeColor="Green" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Name</td>
                <td>
                    :</td>
                <td style="margin-left: 40px">
            <asp:TextBox ID="txt_uname" runat="server" Width="180px"
                        ReadOnly="true" BackColor="#C0C561" ForeColor="Green" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Phone Num</td>
                <td>
                    :</td>
                <td>
            <asp:TextBox ID="txt_phno" runat="server" Width="180px"
                        ReadOnly="true" BackColor="#C0C561" ForeColor="Green" BorderStyle="None"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Address</td>
                <td>
                    :</td>
                <td>
            <asp:TextBox ID="txt_address" runat="server" TextMode="MultiLine" Width="180px"
                        ReadOnly="true" BackColor="#C0C561" ForeColor="Green" BorderStyle="None" 
                        Rows="3"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;" colspan="3">
                    <a href="#" id="hyplink_edit">Edit >></a>
                </td>
            </tr>            
            <tr>
                <td style="text-align:center;" colspan="3">
            <asp:Label ID="lbl_status" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        
        
         <%--Modal Pop-Up End--%>
            
            <%--Style for Pop-Up Window--%>
            
                    <style type="text/css">

                        .web_dialog_overlay
                        {
                           position: fixed;
                           top: 0;
                           right: 0;
                           bottom: 0;
                           left: 0;
                           height: 100%;
                           width: 100%;
                           margin: 0;
                           padding: 0;
                           background: #000000;
                           opacity: .5;
                           filter: alpha(opacity=15);
                           -moz-opacity: .15;
                           z-index: 101;
                           display: none;
                        }    
                        .web_dialog
                        {
                           display:none;
                           position:absolute;
                           width:auto;
                           height:auto;
                           top:40%;
                           left:40%;
                           background-color: #ffffff;
                           border: solid 2px #336699;
                           padding: 0px;
                           z-index: 102;
                           font-family: Verdana;
                           font-size: 10pt;
                        }
                        .web_dialog_title
                        {
                            text-align: right;
                        }

                    </style>
            <%--End of Style for Pop-Up Window--%>
                
                <script src="../script/jquery-1.8.2.js" type="text/javascript"></script>

                    <script type="text/javascript">
                        $(document).ready(function() {
                              
                              $("#btnClose").click(function (e){
                                 HideDialog();
                              });
                              
                              $("#hyplink_edit").click(function(){
                                var emailid = $("[id$=txt_emailid]").val(); $("[id$=txt_emailidedit]").val(emailid);
                                var uname = $("[id$=txt_uname]").val(); $("[id$=txt_unameedit]").val(uname);
                                var phno = $("[id$=txt_phno]").val(); $("[id$=txt_phnoedit]").val(phno);
                                var address = $("[id$=txt_address]").val(); $("[id$=txt_addressedit]").val(address);
                                var userstatus = $("[id$=lbl_status]").text(); $("[id$=lbl_result]").text(userstatus);
                                ShowDialog();
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
                            
                            function updateName(){
                                $("[id$=lbl_result]").text("");
                                var email = $("[id$=txt_emailidedit]").val();
                                var newuname = $("[id$=txt_unameedit]").val();
                                var uname = $("[id$=txt_uname]").val();
                                if(newuname==""){$("[id$=lbl_result]").text("User Name Cannot be Empty");  $("[id$=txt_nameedit]").focus();}
                                else if(uname==newuname){$("[id$=lbl_result]").text("No Changes Made...");  $("[id$=txt_nameedit]").focus();}
                                else
                                {
                                    budhashop.USER.Services.LoginControl.UpdateName(email, newuname, OnComplete, onerror);
                                }
                            }
                            function OnComplete(result)
                            {
                                if(result){ $("[id$=lbl_result]").text("User Name Updated..."); var newuname = $("[id$=txt_unameedit]").val(); $("[id$=txt_uname]").val(newuname); }
                                else{ $("[id$=lbl_result]").text("Error Updating, Try Again..."); }
                            }
                            
                            function updatePhNum(){
                                $("[id$=lbl_result]").text("");
                                var email = $("[id$=txt_emailidedit]").val();
                                var newphno = $("[id$=txt_phnoedit]").val();
                                var phno = $("[id$=txt_phno]").val();
                                var pattern = /^\d{10}$/;
                                if(newphno==""){$("[id$=lbl_result]").text("Phone Number Cannot be Empty");  $("[id$=txt_phnoedit]").focus();}
                                else if(newphno.match(pattern)==null){$("[id$=lbl_result]").text("Enter Valid 10 digit Mobile Number");  $("[id$=txt_phnoedit]").focus();}
                                else if(phno==newphno){$("[id$=lbl_result]").text("No Changes Made...");  $("[id$=txt_phnoedit]").focus();}
                                else
                                {
                                    budhashop.USER.Services.LoginControl.UpdatePhoneNumber(email, newphno, OnSucceeded, onerror);
                                }
                            }
                            function OnSucceeded(result)
                            {
                                if(result){ $("[id$=lbl_result]").text("Phone Number Updated..."); var newphno = $("[id$=txt_phnoedit]").val();  $("[id$=txt_phno]").val(newphno); }
                                else{ $("[id$=lbl_result]").text("Error Updating, Try Again..."); }
                            }
                            
                            function updateAddress(){
                                $("[id$=lbl_result]").text("");
                                var email = $("[id$=txt_emailidedit]").val();
                                var newaddress = $("[id$=txt_addressedit]").val();
                                var address = $("[id$=txt_address]").val();
                                if(newaddress==""){$("[id$=lbl_result]").text("Address Cannot be Empty");  $("[id$=txt_addressedit]").focus();}
                                else if(address==newaddress){$("[id$=lbl_result]").text("No Changes Made...");  $("[id$=txt_addressedit]").focus();}
                                else
                                {
                                    budhashop.USER.Services.LoginControl.UpdateAddress(email, newaddress, OnCompleted, onerror);
                                }
                            }
                            function OnCompleted(result)
                            {
                                if(result){ $("[id$=lbl_result]").text("Address Updated..."); var newaddress = $("[id$=txt_addressedit]").val();   $("[id$=txt_address]").val(newaddress); }
                                else{ $("[id$=lbl_result]").text("Error Updating, Try Again..."); }
                            }
                            
                            function onerror(result){
                                alert("Error calling service method.");
                                }
                	    
                    </script>
                    
            <%--Start of Pop-Up Window--%>
            <asp:UpdatePanel ID="profileEditPop" runat="server">
            <ContentTemplate>
                <div id="overlay" class="web_dialog_overlay"></div>

                <div id="dialog" class="web_dialog">
                   <table style="width:auto; border: 0px;" cellpadding="3" cellspacing="0">
                      <tr>
                         <td class="web_dialog_title" colspan="3"><a href="#" id="btnClose">Close</a>
                         </td>
                      </tr>
                         
                     <tr>
                         <td>
                             Email Id</td>
                         <td>
                             <asp:TextBox ID="txt_emailidedit" ReadOnly="true" runat="server" Width="180px"></asp:TextBox>
                         </td>
                         <td>
                             &nbsp;</td>
                     </tr>
                     <tr>
                         <td>
                             Name</td>
                         <td>
                             <asp:TextBox ID="txt_unameedit" runat="server" Width="180px"></asp:TextBox>
                         </td>
                         <td>
                             <input id="btn_updatename" onclick="return updateName();" type="button" value="Update" />
                         </td>
                     </tr>
                     <tr>
                         <td>
                             Phone Number</td>
                         <td>
                             <asp:TextBox ID="txt_phnoedit" runat="server" Width="180px"></asp:TextBox>
                         </td>
                         <td>
                             <input id="btn_updatephno" onclick="return updatePhNum();" type="button" value="Update" />
                         </td>
                     </tr>
                     <tr>
                         <td>
                             Address</td>
                         <td>
                             <asp:TextBox ID="txt_addressedit" runat="server" TextMode="MultiLine" Width="180px" Rows="3"></asp:TextBox>
                         </td>
                         <td>
                             <input id="btn_updateaddress" onclick="return updateAddress();" type="button" value="Update" />
                         </td>
                     </tr>
                     <tr>
                         <td colspan="3" style="text-align: center">
                             <asp:Label ID="lbl_result" runat="server" ForeColor="Red"></asp:Label>
                         </td>
                     </tr>
                </table>
            </div>
            </ContentTemplate>
            </asp:UpdatePanel>
            <%--End of Pop-Up Window--%>
                
        <%--Modal Pop-Up End--%>
        
        
</asp:Content>
