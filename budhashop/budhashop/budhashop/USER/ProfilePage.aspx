﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="ProfilePage.aspx.cs" Inherits="budhashop.USER.ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="height:auto;">
        <div id="profileDiv">
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
                    <td colspan="3">
                        <a href="#" id="hyplink_changepwd">Change Password >></a>
                        <a href="#" id="hyplink_edit" style="float:right;">Edit Profile >></a>
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
                               top:28%;
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
                            .hiddenColumn
                            {
                                display: none;
                            }

                        </style>
                <%--End of Style for Pop-Up Window--%>
                    
                    <script src="../script/jquery-1.8.2.js" type="text/javascript"></script>

                        <script type="text/javascript">
                            $(document).ready(function() {
                                var usersession='<%= this.Session["currentuser"] %>';
                                if(!usersession){
                                    $("#hyplink_edit").hide();
                                    $("#hyplink_changepwd").hide();
                                    }
                                  
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
                                  
                                  
                                  
                                  $("#btnClose2").click(function(){
                                        $("[id$=itemsDiv]").hide("slow");
                                    });
                            });
                            
                                function updateName(){
                                    $("[id$=lbl_result]").text("");
                                    var newuname = $("[id$=txt_unameedit]").val();
                                    var uname = $("[id$=txt_uname]").val();
                                    if(newuname==""){$("[id$=lbl_result]").text("User Name Cannot be Empty");  $("[id$=txt_nameedit]").focus();}
                                    else if(uname==newuname){$("[id$=lbl_result]").text("No Changes Made...");  $("[id$=txt_nameedit]").focus();}
                                    else
                                    {
                                        budhashop.USER.Services.LoginControl.UpdateProfile(newuname, "name", OnComplete, onerror);
                                    }
                                }
                                function OnComplete(result)
                                {
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
                                        budhashop.USER.Services.LoginControl.UpdateProfile(newphno, "phno", OnSucceeded, onerror);
                                    }
                                }
                                function OnSucceeded(result)
                                {
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
                                        budhashop.USER.Services.LoginControl.UpdateProfile(newaddress, "address", OnCompleted, onerror);
                                    }
                                }
                                function OnCompleted(result)
                                {
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
                                        budhashop.USER.Services.LoginControl.UpdatePassword(oldpwd, newpwd, OnReturn, onerror);
                                    }
                                }
                                function OnReturn(result)
                                {
                                    if(result){ $("[id$=lbl_resultpwd]").text("Password Updated..."); }
                                    else{ $("[id$=lbl_resultpwd]").text("Your Old Pasword is Wrong"); $("[id$=txt_oldpwd]").focus(); }
                                }
                                
                                function onerror(result){
                                    alert("Error calling service method.");
                                    }
                                    
                                    
                                function showitemsDiv()
                                 {
                                    $("[id$=itemsDiv]").show("slow");
                    //                $('#itemsDiv').css("top", +event.pageX);
                    //                $("#itemsDiv").animate({height:'300px',opacity:'0.4'},"slow");
                    //                $("#itemsDiv").animate({width:'300px',opacity:'0.8'},"slow");
                                 }
                    	    
                        </script>
                        
                <%--Start of Pop-Up Window--%>
                <asp:UpdatePanel ID="profileEditPop" runat="server">
                <ContentTemplate>
                    <div id="overlay" class="web_dialog_overlay"></div>

                    <div id="ProfileField" class="web_dialog">
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
                <div id="PasswordField" class="web_dialog">
                       <table style="width:auto; border: 0px;" cellpadding="3" cellspacing="0">
                          <tr>
                             <td class="web_dialog_title" colspan="2"><a href="#" id="btnClose1">Close</a>
                             </td>
                          </tr>
                          
                          <tr>
                             <td>
                                 Email Id</td>
                             <td>
                                 <asp:TextBox ID="txt_emailidpwd" ReadOnly="true" runat="server" Width="180px"></asp:TextBox>
                             </td>
                         </tr>                         
                         <tr>
                             <td>
                                 Old Password</td>
                             <td>
                                 <asp:TextBox ID="txt_oldpwd" TextMode="Password" runat="server" Width="180px"></asp:TextBox>
                             </td>
                         </tr>
                         <tr>
                             <td>
                                 New Password</td>
                             <td>
                                 <asp:TextBox ID="txt_newpwd" TextMode="Password" runat="server" Width="180px"></asp:TextBox>
                             </td>
                         </tr>
                         <tr>
                             <td>
                                 Confirm Password</td>
                             <td>
                                 <asp:TextBox ID="txt_confirmnewpwd" TextMode="Password" runat="server" Width="180px"></asp:TextBox>
                             </td>
                         </tr>
                         <tr>
                            <td colspan="2">
                                <input id="btn_updatepwd" onclick="return updatePassword();" type="button" value="Update" />
                            </td>
                         </tr>
                         <tr>
                            <td colspan="2" style="text-align: center">
                                <asp:Label ID="lbl_resultpwd" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                         </tr>
                       </table>
                    </div>
                </ContentTemplate>
                </asp:UpdatePanel>
                <%--End of Pop-Up Window--%>
                    
            <%--Modal Pop-Up End--%>
            
    </div>
    
    <div id="orderHistoryDiv">
        
        <div style="float:left; width:auto;">
            <asp:GridView ID="orderGrid" runat="server" AllowPaging="True" 
             AutoGenerateColumns="False" 
             DataKeyNames="PurchaseId,Uid,NoItems,TotalBilledRate,PurchaseDate,DeliveredFlag,ItemString,ShippingAddress" 
             OnPageIndexChanging="orderGrid_PageIndexChanging" 
             onrowcommand="orderGrid_RowCommand" 
            onrowdatabound="orderGrid_RowDataBound">
             <%--AllowPaging="true" PageSize ="3" OnPageIndexChanging= "itemGrid_PageIndexChanging">--%>
                
                 <Columns>
                     <asp:TemplateField HeaderStyle-CssClass="hiddenColumn" ItemStyle-CssClass="hiddenColumn" FooterStyle-CssClass="hiddenColumn">
                         <ItemTemplate>
                             <asp:LinkButton ID="lb_Show" runat="server" 
                                 CommandArgument="<%# Container.DisplayIndex %>" CommandName="show">Full Details</asp:LinkButton>
                         </ItemTemplate>

<FooterStyle CssClass="hiddenColumn"></FooterStyle>

<HeaderStyle CssClass="hiddenColumn"></HeaderStyle>

<ItemStyle CssClass="hiddenColumn"></ItemStyle>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Purchase Id">
                         <ItemTemplate>
                             <asp:Label ID="lbl_PurchaseId" runat="server" Text='<%# Eval("PurchaseId") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="User Id">
                         <ItemTemplate>
                             <asp:Label ID="lbl_UserId" runat="server" Text='<%# Eval("Uid") %>'></asp:Label>
                             <asp:HiddenField ID="HiddenItemStr" runat="server" Value='<%#Eval("ItemString") %>'/>
                             <asp:HiddenField ID="HiddenAddrStr" runat="server" Value='<%#Eval("ShippingAddress") %>'/>

                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Quantity">
                         <ItemTemplate>
                             <asp:Label ID="lbl_itemQty" runat="server" Text='<%# Eval("NoItems") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Billed Rate">
                         <ItemTemplate>
                             <asp:Label ID="lbl_totalBR" runat="server" Text='<%# Eval("TotalBilledRate") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Date Purchased">
                         <ItemTemplate>
                             <asp:Label ID="lbl_purchaseDate" runat="server" Text='<%# Eval("PurchaseDate") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Deliverd">
                         <ItemTemplate>
                             <asp:Label ID="lbl_Delivered" runat="server" Text='<%# Eval("DeliveredFlag") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                 </Columns>
            </asp:GridView>            
        </div>
        
        <div style="float:left; width:auto;">
            <div id="itemsDiv" runat="server" style="background:lightgreen; display:none; position:absolute;">
                <a href="#" id="btnClose2" style="float:right;">Close</a>
                <div style="width:80px;">
                    <asp:Label ID="itemsCount" runat="server"></asp:Label>
                    <asp:Label ID="totalBill" runat="server"></asp:Label>
                    <asp:Label ID="dateP" runat="server"></asp:Label>
                    <asp:Label ID="NameA" runat="server"></asp:Label>
                    <asp:Label ID="PhnA" runat="server"></asp:Label>
                    <asp:Label ID="AdrA" runat="server"></asp:Label>
                </div>
                <div>
                    <asp:GridView ID="SelectedOrderGrid" runat="server" AutoGenerateColumns="False" style="text-align: center">
                        <Columns>
                            <asp:TemplateField HeaderText="Item Id">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_itemId" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_itemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="Image_itemImage" runat="server" Height="50px" Width="60px" 
                                        ImageUrl='<%# Eval("ImagePath") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_itemQty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Billed Rate">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_itemBR" runat="server" Text='<%# Eval("BilledRate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Rate">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_itemTR" runat="server" Text='<%# Eval("TotalRate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    
    </div>
    </div>        
        
</asp:Content>
