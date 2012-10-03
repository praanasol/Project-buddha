<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderPage.aspx.cs" Inherits="budhashop.USER.OrderPage" %>
<%@ Register Src="~/UserControls/Userregistrations.ascx" TagName="login_register" TagPrefix="uc_login_register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    
        <%--Modal Pop-Up start--%>
        <div>
                    
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
                                           top:35%;
                                           left:25%;
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
                                           border-bottom: solid 10px #336699;
                                           background-color: #336699;
                                           padding: 4px;
                                           color: White;
                                           font-weight:bold;
                                           text-align:left;
                                        }
                                        .web_dialog_title a
                                        {
                                           color: White;
                                           text-decoration: none;
                                        }
                                        .align_right
                                        {
                                           text-align: right;
                                        }

                                        </style>
                                        <%--End of Style for Pop-Up Window--%>
                    <script type="text/javascript" src="../script/scroll/homePageLoad.js"></script>
                    <script src="../script/jquery-1.8.2.js" type="text/javascript"></script>

                    <script type="text/javascript">
                        $(document).ready(function() {      
                              
                              $("#btnClose").click(function (e)
                              {
                                 HideDialog()
                              });
                                
                              var usersession='<%= Session["userdetails"] %>';
                              
                              if(usersession)
                              {
                                 alert('you are logged in...');
                                 //location.href = "../USER/EditDetails.aspx";
                              }
                              else
                              {
                                 ShowDialog(false);
                              }
	                    });
	                                    function ShowDialog(modal)
                                           {
                                              $("#overlay").show();
                                              $("#dialog").fadeIn("slow");

                                              if (modal)
                                              {
                                                 $("#overlay").unbind("click");
                                              }
                                              else
                                              {
                                                 $("#overlay").click(function (e)
                                                 {
                                                    HideDialog();
                                                 });
                                              }
                                           }
                                        
                                        function HideDialog()
                                           {
                                              $("#overlay").hide();
                                              $("#dialog").fadeOut("fast");
                //                              $("#dialog").fadeOut(300);
                                           }
                	    
                    </script>
                    
                    
                <%--Start of Pop-Up Window--%>

                <div id="overlay" class="web_dialog_overlay"></div>

                <div id="dialog" class="web_dialog">
                   <table style="width: 100%; border: 0px;" cellpadding="3" cellspacing="0">
                      <tr>
                         <td class="web_dialog_title">Login/Register to Continue</td>
                         <td class="web_dialog_title align_right">
                            <a href="#" id="btnClose">Close</a>
                         </td>
                      </tr>
                      <tr>
                         <uc_login_register:login_register ID="login_register" runat="server" />
                      </tr>
                   </table>
                </div>
                <%--End of Pop-Up Window--%>
        
        </div>
        <%--Modal Pop-Up End--%>
        
        
        
    <div id="cartheader" style="background-color:Green; font-size:large; font-family:Comic Sans MS; font-weight:bold; color:Red;">
        <asp:Label ID="errorLbl" runat="server" Text="No items in cart!" Font-Bold="true"
        ></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <!--Full Page Details Start-->
        <asp:Label ID="noOfItemsLbl" runat="server" Text="Items: 0"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="totalLbl" runat="server" Text="Total: 0"></asp:Label>
    </div>
    <br />
       
      <%--  <asp:Panel ID="itempanel" runat="server" CssClass="scroll-pane" Height="300" Width="350" BorderStyle="Solid" BorderColor="Black" ScrollBars="Vertical"> --%>                                                                              
       <div id="chatlist" class="mousescroll">
        <asp:DataList ID="itemCartDL" runat="server" DataKeyField="ItemId" 
               OnItemCommand ="itemCartDL_ItemCommand" HorizontalAlign="Justify" 
               RepeatLayout="Flow">
            <ItemTemplate>
                <div>
                    <aside id="itemValues">
                        <asp:Label ID="noLbl" runat="server" Text='<%# Eval("ItemId")%>'> </asp:Label>
                        <asp:ImageButton runat="server" ID="itemImage" ImageUrl='<%# Eval("ImagePath")%>'/>
                        <asp:Label ID="nameLbl" runat="server" Text='<%# Eval("ItemName")%>'> </asp:Label>
                        <asp:TextBox  ID="qtyTxt" runat="server" Text='<%# Eval("Qty")%>'></asp:TextBox>
                        <asp:Label ID="priceLbl" runat="server" Text='<%# Eval("BilledRate")%>'> </asp:Label>
                        <asp:Label ID="rateLbl" runat="server" Text='<%# Eval("TotalRate")%>'> </asp:Label>
                        <div>
                        <asp:LinkButton ID="updateBtn" runat="server" CommandArgument = '<%# Eval("ItemId")%>' CommandName ="UpdateItem" >Update</asp:LinkButton>
                        <asp:LinkButton ID="deleteBtn" runat="server" CommandArgument = '<%# Eval("ItemId")%>' CommandName ="RemoveItem" >Remove</asp:LinkButton>
                        </div>
                     </aside>
                </div>
            </ItemTemplate>
        </asp:DataList>
        </div>
       <%-- </asp:Panel>--%>
       
      


        <!--Full Page Details End-->
    </form>
</body>
</html>
