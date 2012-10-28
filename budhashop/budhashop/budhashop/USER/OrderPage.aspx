<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="OrderPage.aspx.cs" Inherits="budhashop.USER.OrderPage" %>
<%@ Register Src="~/UserControls/Login1.ascx" TagName="loginuc" TagPrefix="uc_login" %>
<%@ Register Src="~/UserControls/Register.ascx" TagName="registeruc" TagPrefix="uc_register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <%--Modal Pop-Up start--%>
            
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
                           top:30%;
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
                    <style type="text/css">
                     .style1
                        {
                            text-align: center;
                        }
                    </style>

            <%--End of Style for Pop-Up Window--%>
                
                <%--<script src="../script/jquery-1.8.2.js" type="text/javascript"></script>--%>

                    <script type="text/javascript">
                        $(document).ready(function() {
                              $("#RegisterControl").hide();
                              var isPostBackObject = document.getElementById('isPostBack');
                                if (isPostBackObject != null) 
                               {
                                $("#CartDiv").hide();
                               }
                               else {

                              $("#adressDiv").hide();
                              $("#CartDiv").show();
                              }
                              
                              var ItemsCount = $("#ctl00_ContentPlaceHolder1_noOfItemsLbl").text();
                              if(ItemsCount == "0" || ItemsCount == "Items: 0"){
                                $("#btn_ConfirmOrder").hide();
                              }
                              
                              $("#btnClose").click(function (e){
                                 HideDialog();
                              });
                              
                              $("#btn_ConfirmOrder").click(function(){
                                var usersession='<%= this.Session["currentuser"] %>';
                                  if(usersession)
                                  {
                                  showadress();
                                     //location.href = "../USER/AddressPage.aspx";
                                     //budhashop.USER.OrderPage.showAdress(OnCompleted2, onerror2);
                                     
                                  }
                                  else
                                  {
                                    $("#RegisterControl").hide();
                                    $("#LoginControl").show();
                                    ShowDialog();
                                  }
                              });
                              
                              $("#hyplink_register").click(function(){
                                $("#LoginControl").hide();
                                $("#RegisterControl").show();
                              });
                              
                              $("#hyplink_login").click(function(){
                                $("#RegisterControl").hide();
                                $("#LoginControl").show();
                              });
                        });
                            function ShowDialog(modal){
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
                            
                            function showadress() {
                            //some code to user
                            $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: "../USER/OrderPage.aspx/showAdress",
                                        dataType: "json",
                                        data: "{}",
               
                                        success: function(data) {
                                        
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
                                            alert(textStatus);
                                        }
                                    });
                            
                            }
                            function onerror2(result){
                            alert("Error calling service method.");
                            }
                	    
                    </script>
                    
            <%--Start of Pop-Up Window--%>
            <asp:UpdatePanel ID="loginPop" runat="server">
            <ContentTemplate>
                <div id="overlay" class="web_dialog_overlay"></div>

                <div id="dialog" class="web_dialog">
                   <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
                      <tr>
                         <td class="web_dialog_title"><a href="#" id="btnClose">Close</a>
                         </td>
                      </tr>
                         </table>
                         <%--<uc_login:loginuc ID="loginuc" runat="server" />--%>
                         
<%--<script src="../script/jquery-1.8.2.js" type="text/javascript"></script>--%>
<script type="text/javascript">

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
        budhashop.USER.Services.LoginControl.LoginUser(email, pwd, OnSucceeded, onerror);
      }
     }
        
    function OnSucceeded(result) {
        var result1=false;
        result1=eval(result);
//        $("[id$=lbl_result]").text(result);
//        var usersession='<%= this.Session["currentuser"] %>';
//            if(usersession != "")
            if(result1)
            {
                $("[id$=txt_emailid]").val('');
                $("[id$=txt_pwd]").val('');
                $("[id$=lbl_result]").text('');
                $("#overlay").hide();
                $("#dialog").hide();
//                document.write("You will be redirected to our main page in 5 seconds!");
//                setTimeout('Redirect()', 5000);
                //Redirect();
                showadress();
            }
            else
            {
               $("[id$=lbl_result]").text('Wrong Email Id/Password');
            } 
        }
         
    function onerror(result){
        alert("Error calling service method.");
        }
    
    function Redirect() {
        window.location="../USER/AddressPage.aspx";
        }        
</script>

<body>

    <table id="LoginControl" class="style1">
        <tr>
            <td colspan="3">Login</td>
        </tr>
        <tr>
            <td>Email Id:</td>
            <td>
                <asp:Label ID="lbl_emailid" runat="server" Font-Bold="False" ForeColor="Red" 
                    Text="*" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_emailid" runat="server" Width="180px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Password</td>
            <td>
                <asp:Label ID="lbl_pwd" runat="server" Font-Bold="False" ForeColor="Red" 
                    Text="*" Visible="False"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="txt_pwd" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <%--<asp:Button ID="btn_login" runat="server" Text="LogIn" OnClientClick="checkLogin()" />--%>
                <input id="btn_login" type="button" value="LogIn" onclick="return checkLogin();" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <a href="#" id="hyplink_register">Register</a>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            <asp:Label ID="lbl_result" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </td>
        </tr>
    </table>
                         <%--<uc_register:registeruc ID="registeruc" runat="server" />--%>
                         <%--Regitration popup--%>
                         <script type="text/javascript">

   function checkEmail() {
      $("[id$=lbl_result2]").text("");
      var email = $("[id$=txt_emailid2]").val();
      var pwd = $("[id$=txt_pwd2]").val();
      var confirmpwd = $("[id$=txt_confirmpwd2]").val();
      var emailFormat = (/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
      if(email==""){$("[id$=lbl_result2]").text("Enter Email Id"); $("[id$=txt_emailid2]").focus();}
      else if(email.match(emailFormat)==null){$("[id$=lbl_result2]").text("Enter Valid Email Id");  $("[id$=txt_emailid2]").focus();}
      else if(pwd==""){$("[id$=lbl_result2]").text("Enter Password");   $("[id$=txt_pwd2]").focus();}
      else if(pwd.length < 5){$("[id$=lbl_result2]").text("Password Should Contain atleast 5 Characters");   $("[id$=txt_pwd2]").focus();}
      else if(pwd != confirmpwd){$("[id$=lbl_result2]").text("Passwords Do not Match");   $("[id$=txt_confirmpwd2]").focus();}
      else
      {
        budhashop.USER.Services.LoginControl.RegisterUser(email, pwd, OnCompleted, onerror);
      }
     }
        
    function OnCompleted(result) {
        var result1=false;
        result1=eval(result);
        
            if(result1)
            {
                $("[id$=txt_username2]").val('');
                $("[id$=txt_emailid2]").val('');
                $("[id$=txt_pwd2]").val('');
                $("[id$=lbl_result2]").text('');
                $("#overlay").hide();
                $("#dialog").hide();
                //window.location="../USER/AddressPage.aspx";
                showadress();
                
            }
            else
            {
               $("[id$=lbl_result2]").text('Email Id Already Exists in our Databse');
            } 
        }
         
    function onerror(result){
        alert("Error calling service method.");
        }        
</script>

<table id="RegisterControl">
    <tr>
        <td style="text-align: center" colspan="2">
            New User Registration</td>
    </tr>
    <tr>
        <td style="text-align: center">Email Id:</td>
        <td style="text-align: center">
    <asp:TextBox ID="txt_emailid2" runat="server" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            Password:</td>
        <td style="text-align: center">
    <asp:TextBox ID="txt_pwd2" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            Confirm Password:</td>
        <td style="text-align: center">
    <asp:TextBox ID="txt_confirmpwd2" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: center" colspan="2">
    <input id="btn_register" type="button" value="Register" onclick="return checkEmail();" />
        </td>
    </tr>
    <tr>
        <td style="text-align: center" colspan="2">
    <a href="#" id="hyplink_login">Login</a></td>
    </tr>
    <tr>
        <td style="text-align: center" colspan="2">
    <asp:Label ID="lbl_result2" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
        </td>
    </tr>
</table>
<%--Registration popup end --%>
                         
                </div>
                </ContentTemplate>
                </asp:UpdatePanel>
            <%--End of Pop-Up Window--%>
                
        <%--Modal Pop-Up End--%>
        
        
    <br clear="all" />
        <div id="CartDiv" style="display:none;">    
    <div id="cartheader" style="background-color:Green; font-size:large; font-family:Comic Sans MS; font-weight:bold; color:Red;">
        <asp:Label ID="errorLbl" runat="server" Text="No items in cart!" Font-Bold="true"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <!--Full Page Details Start-->
        Items:
        <asp:Label ID="noOfItemsLbl" runat="server" Text="Items: 0"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        Total:
        <asp:Label ID="totalLbl" runat="server" Text="Total: 0"></asp:Label>
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" 
            onclick="btn_cancel_Click" style="float:right" />
        <input type="button" id="btn_ConfirmOrder" value="Confirm Order" style="float:right"/>
    </div>
    <br />
    
    <asp:DataList ID="itemCartDL" runat="server" RepeatDirection="Vertical" 
        DataKeyField="ItemId" OnItemCommand ="itemCartDL_ItemCommand" GridLines="Both" 
        HorizontalAlign="Justify" RepeatLayout="Flow">
        <ItemTemplate>
            <div>
                <asp:Label ID="noLbl" runat="server" Text='<%# Eval("ItemId")%>'> </asp:Label>
                <asp:ImageButton runat="server" ID="itemImage" ImageUrl='<%# Eval("ImagePath")%>'/>
                <asp:Label ID="nameLbl" runat="server" Text='<%# Eval("ItemName")%>'> </asp:Label>
                <asp:TextBox  ID="qtyTxt" runat="server" Text='<%# Eval("Qty")%>'></asp:TextBox>
                <asp:Label ID="priceLbl" runat="server" Text='<%# Eval("BilledRate")%>'> </asp:Label>
                <asp:Label ID="rateLbl" runat="server" Text='<%# Eval("TotalRate")%>'> </asp:Label>
                <asp:LinkButton ID="updateBtn" runat="server" CommandArgument = '<%# Eval("ItemId")%>' CommandName ="UpdateItem" >Update</asp:LinkButton>
                <asp:LinkButton ID="deleteBtn" runat="server" CommandArgument = '<%# Eval("ItemId")%>' CommandName ="RemoveItem" >Remove</asp:LinkButton>
            </div>
        </ItemTemplate>
    </asp:DataList>
    </div>
    <div id="adressDiv" style="display:none;">
        <table style="width:auto;">
            <tr>
                <td>
                    Email Id:</td>
                <td></td>
                <td>
                    <asp:TextBox ID="txt_emailidadr" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    Name:</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="*" 
                        ControlToValidate="txt_uname" SetFocusOnError="True" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txt_uname" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    Phone Num:</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" 
                        ControlToValidate="txt_phno" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txt_phno" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txt_phno" ErrorMessage="Enter Valid 10 digit Mobile Number" 
                        SetFocusOnError="True" ValidationExpression="\d{10}" ValidationGroup="1"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Address:</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv3" runat="server" 
                        ControlToValidate="txt_address" ErrorMessage="*" SetFocusOnError="True" 
                            ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txt_address" runat="server" TextMode="MultiLine" Width="180px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:Label ID="lbl_status" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
            <p>Change my Profile with above details <asp:CheckBox ID="cb_profilechange" runat="server" /></p>
        <asp:Button ID="ConfirmBtn" runat="server" Text="Confirm" OnClick="ConfirmBtn_Click" ValidationGroup="1" />
        </div>
        
        <div id="cartData" runat="server" Visible="false">
        
        <asp:Label ID="purchaseIdLbl" runat="server"></asp:Label>
        <asp:Label ID="totalpLbl" runat="server"></asp:Label>
        <asp:Label ID="itemspNoLbl" runat="server"></asp:Label>
        <asp:Label ID="purchaseDateLbl" runat="server"></asp:Label>
        <asp:Label ID="userpNameLbl" runat="server"></asp:Label>
        <asp:Label ID="addrpLbl" runat="server"></asp:Label>
        <asp:Label ID="phnpLbl" runat="server"></asp:Label>
        
        <asp:GridView ID="cartDataGV" runat="server" Visible="false">
        
        </asp:GridView>
        
        </div>
        
        <asp:HiddenField ID="chkConfirm" runat="server" />
</asp:Content>
