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
                           top:60%;
                           left:60%;
                           margin-left: -190px;
                           margin-top: -100px;
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
//                              $("#ctl00_cartCtrl_signin").hide();
//                              
//                              if($("#ctl00_ContentPlaceHolder1_noOfItemsLbl").text()=="0")
//                              {
                              $("#RegisterControl").hide();
                              
//                              if($("#ctl00_ContentPlaceHolder1_noOfItemsLbl").text()=="0"){
//                                $("#btn_ConfirmOrder").hide();
//                              }
                              
                              $("#btnClose").click(function (e){
                                 HideDialog()
                              });
                              
                              $("#btn_ConfirmOrder").click(function(){
                                var usersession='<%= this.Session["currentuser"] %>';
//                                var userstatus=($("#ctl00_ContentPlaceHolder1_loginuc_lbl_result").text());
                                  if(usersession)
                                  {
                                     alert('you are logged in...');
                                     location.href = "../USER/AddressPage.aspx";
                                  }
//                                  else if(userstatus=="Existing User")
//                                  {
//                                    alert('you are logged in...');
//                                     //location.href = "../USER/EditDetails.aspx";
//                                  }
                                  else
                                  {
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
                                    HideDialog();
                                });
                            }
                            
                            function HideDialog(){
                                $("#overlay").hide();
                                $("#dialog").fadeOut("slow");
                                //$("#dialog").fadeOut(300);
                            }
                	    
                    </script>
                    
            <%--Start of Pop-Up Window--%>

                <div id="overlay" class="web_dialog_overlay"></div>

                <div id="dialog" class="web_dialog">
                   <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
                      <tr>
                         <td class="web_dialog_title"><a href="#" id="btnClose">Close</a>
                         </td>
                      </tr>
                         </table>
                         <uc_login:loginuc ID="loginuc" runat="server" />
                         <uc_register:registeruc ID="registeruc" runat="server" />
                </div>
            <%--End of Pop-Up Window--%>
                
        <%--Modal Pop-Up End--%>
        
        
    <br clear="all" />
            
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

</asp:Content>
