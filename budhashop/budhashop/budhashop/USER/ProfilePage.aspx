<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true"
    CodeBehind="ProfilePage.aspx.cs" Inherits="budhashop.USER.ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="p_data_area" class="box_style">
        <div id="profileDiv">
            <!--Profile Start-->
            <aside id="p_data">
                <section id="p_d_fields">
                    <div id="p_d_field_area">
                        <div id="p_d_label">
                            Email ID :</div>
                        <div id="p_d_field" class="style4">
                            <asp:TextBox ID="txt_emailid" runat="server" CssClass="p_d_form_style" ReadOnly="True"
                                ></asp:TextBox>
                        </div>
                    </div>
                    <div id="p_d_field_area">
                        <div id="p_d_label" class="style1" style="padding-top: 2px;">
                            Name :</div>
                        <div id="p_d_field" class="style4">
                            <asp:TextBox ID="txt_uname" runat="server" CssClass="p_d_form_style" ReadOnly="true"
                                ></asp:TextBox>
                        </div>
                    </div>
                    <div id="p_d_field_area">
                        <div id="p_d_label">
                            Phone No :</div>
                        <div id="p_d_field" class="style4">
                            <asp:TextBox ID="txt_phno" runat="server"  CssClass="p_d_form_style" ReadOnly="true"
                                ></asp:TextBox>
                        </div>
                    </div>
                    <div id="p_d_field_area">
                        <div id="p_d_label" style="margin-top:25px;">
                            Address :</div>
                        <div id="p_d_field" class="style4">
                            <asp:TextBox ID="txt_address" runat="server" TextMode="MultiLine" Height="70" ReadOnly="true"
                                 CssClass="p_d_form_style" Rows="3"></asp:TextBox>
                        </div>
                    </div>
                </section>
                <br style="clear:both;" /><br />
                <div id="login_links" style="margin:auto; margin-top:40px; padding-left:15px; width:200px;">
                    <a href="#" ID="hyplink_changepwd" class="l_links">Change Password?</a>
                    <a href="#" ID="hyplink_edit" class="l_links">Edit Profile</a>
                    <br />
                    <asp:Label ID="lbl_status" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </aside>
            <!--Profile End-->
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
                    display: none;
                    position: absolute;
                    width: auto;
                    height: auto;
                    top: 28%;
                    left: 40%;
                    
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
            <%--<script src="../script/jquery-1.8.2.js" type="text/javascript"></script>--%>

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
                                  
                                  $("tr").filter(function() {
                                        return $('td', this).length && !$('table', this).length
                                    })
                                        .click(function(event) {
                                            var row = jQuery(this)
                                            var itemString = row.children("td:eq(2)").text();
                                            var addrString = row.children("td:eq(3)").text();
                                            RowSelected(itemString,addrString);
                                        })
                                        .mouseover(function() {
                                            $(this).css("cursor", "pointer");
                                        })
                                        .css({ background: "ffffff" }).hover(
                                            function() { $(this).css({ background: "lightgreen" }); },
                                            function() { $(this).css({ background: "#ffffff" }); }
                                        );
                                    
                                    $("#btnCloseOrders").click(function(){
                                        $("#itemsDiv").slideUp("slow");
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
                                    
                                    
                                function RowSelected(itemString,addrString)
                                 {
                                    $("#itemsDiv").show();
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
                                                $('#itemTable tr:last').after('<tr> <td>'+data.d[i].ItemId+'</td> <td>'+data.d[i].ItemName+'</td> <td><img src="'+data.d[i].ItemPath+'" width="60" height="50" border="1"></td> <td>'+data.d[i].BilledRate+'</td> <td>'+data.d[i].ItemQty+'</td> <td>'+data.d[i].TotalRate+'</td> </tr>');
                                            }
                                           },
                                        error: function(data) {
                                        alert(data);
                                        }
                                     });
                                 }
                    	    
            </script>

            <%--Start of Pop-Up Window--%>
            <asp:UpdatePanel ID="profileEditPop" runat="server">
                <ContentTemplate>
                    <div id="overlay" class="web_dialog_overlay">
                    </div>
                    <div id="ProfileField" class="web_dialog">
                        <table style="width: auto; border: 0px;" cellpadding="3" cellspacing="0">
                            <tr>
                                <td class="web_dialog_title" colspan="3">
                                    <a href="#" id="btnClose">Close</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email Id
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_emailidedit" ReadOnly="true" runat="server" Width="180px"></asp:TextBox>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Name
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_unameedit" runat="server" Width="180px"></asp:TextBox>
                                </td>
                                <td>
                                    <input id="btn_updatename" onclick="return updateName();" type="button" value="Update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Phone Number
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_phnoedit" runat="server" Width="180px"></asp:TextBox>
                                </td>
                                <td>
                                    <input id="btn_updatephno" onclick="return updatePhNum();" type="button" value="Update" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Address
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_addressedit" runat="server" TextMode="MultiLine" Width="180px"
                                        Rows="3"></asp:TextBox>
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
                        <table style="width: auto; border: 0px;" cellpadding="3" cellspacing="0">
                            <tr>
                                <td class="web_dialog_title" colspan="2">
                                    <a href="#" id="btnClose1">Close</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email Id
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_emailidpwd" ReadOnly="true" runat="server" Width="180px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Old Password
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_oldpwd" TextMode="Password" runat="server" Width="180px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    New Password
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_newpwd" TextMode="Password" runat="server" Width="180px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Confirm Password
                                </td>
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
            <div>
                <asp:GridView ID="orderGrid" runat="server" AllowPaging="True"  HeaderStyle-CssClass="g_head" AlternatingRowStyle-CssClass="p_g_row_style" AutoGenerateColumns="False"
                    OnPageIndexChanging="orderGrid_PageIndexChanging" PageSize="10">
                    <%--AllowPaging="true" PageSize ="3" OnPageIndexChanging= "itemGrid_PageIndexChanging">--%>
                    <Columns>
                        <asp:TemplateField HeaderText="Purchase Id" ControlStyle-Height="40">
                            <ItemTemplate>
                                <asp:Label ID="lbl_PurchaseId" runat="server" Text='<%# Eval("PurchaseId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Id">
                            <ItemTemplate>
                                <asp:Label ID="lbl_UserId" runat="server" Text='<%# Eval("Uid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Item String" HeaderStyle-CssClass="hiddenColumn" ItemStyle-CssClass="hiddenColumn">
                            <ItemTemplate>
                                <asp:Label ID="itemString" runat="server" Text='<%# Eval("ItemString") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address String" HeaderStyle-CssClass="hiddenColumn"
                            ItemStyle-CssClass="hiddenColumn">
                            <ItemTemplate>
                                <asp:Label ID="itemString" runat="server" Text='<%# Eval("ShippingAddress") %>'></asp:Label>
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
            <div style="float: left; width: 50%;">
                <div id="itemsDiv" style="background:#efa927; display: none; position: absolute;">
                    <a href="#" id="btnCloseOrders" style="float: right;">Close</a><br />
                    <div>
                        <%--<asp:Label ID="itemsCount" runat="server"></asp:Label>
                        <asp:Label ID="totalBill" runat="server"></asp:Label>
                        <asp:Label ID="dateP" runat="server"></asp:Label>--%>
                        <label id="NameA">
                        </label>
                        <br />
                        <label id="PhnA">
                        </label>
                        <br />
                        <label id="AdrA">
                        </label>
                        <br />
                    </div>
                    <br />
                    <div id="itemsList">
                        <table id="itemTable" border="1">
                            <tr>
                                <th>
                                    Item Id
                                </th>
                                <th>
                                    Name
                                </th>
                                <th>
                                    Image
                                </th>
                                <th>
                                    Billed Rate
                                </th>
                                <th>
                                    Quantity
                                </th>
                                <th>
                                    Total Rate
                                </th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
