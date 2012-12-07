<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="OrderPage.aspx.cs" Inherits="budhashop.USER.OrderPage" Title="Purchase Details - Go Vedic - Online Shopping - Traditional and Natural Products" %>
<%--<%@ Register Src="~/UserControls/Login1.ascx" TagName="loginuc" TagPrefix="uc_login" %>
<%@ Register Src="~/UserControls/Register.ascx" TagName="registeruc" TagPrefix="uc_register" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link type="text/css" href="../Styles/jquery.jscrollpane.css" rel="stylesheet" media="all" />
<link href="../Styles/scrollpane_custom.css" rel="stylesheet" type="text/css" media="all" />
 
<!-- latest jQuery direct from google's CDN -->

<!-- the mousewheel plugin - optional to provide mousewheel support -->
<script type="text/javascript" src="../script/scroll/jquery.mousewheel.js"></script>
 
<!-- the jScrollPane script -->
<script type="text/javascript" src="../script/scroll/jquery.jscrollpane.min.js"></script>

    <script src="../script/orderPage.js" type="text/javascript"></script>

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
                           top:45%;
                           left:35%;
                         
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
                
                <%--Start of Pop-Up Window--%>
            <asp:UpdatePanel ID="loginPop" runat="server">
            <ContentTemplate>
                
                <div id="overlay" class="web_dialog_overlay"></div>

                <div id="dialog" class="web_dialog">
                   
                         <%--<uc_login:loginuc ID="loginuc" runat="server" />--%>
                         

<div id="LoginControl">
        <div id="p_f_data" class="p_f_box_style" style="height:200px;">
            <section id="login_header">
                <h3>
                    Please login</h3>
            </section>
            <section id="p_f_fields" style="width:370px;">
                <div id="p_f_field_area" style="width:370px; height:20px;">
                    <div id="p_f_label" style="width:130px;">
                        Email ID :<asp:Label ID="lbl_emailid" runat="server" Font-Bold="False" ForeColor="Red"
                            Text="*" Visible="False"></asp:Label></div>
                    <div id="p_f_field" class="style4">
                        <asp:TextBox ID="txt_emailid" CssClass="p_f_form_style" runat="server" Width="180px"></asp:TextBox>
                    </div>
                </div>
                <div id="p_f_field_area" style="width:370px;">
                    <div id="p_f_label" style="width:130px;">
                        Password :<asp:Label ID="lbl_pwd" runat="server" Font-Bold="False" ForeColor="Red"
                            Text="*" Visible="False"></asp:Label></div>
                    <div id="p_f_field" class="style4">
                        <asp:TextBox ID="txt_pwd" runat="server" CssClass="p_f_form_style" TextMode="Password" Width="180px"></asp:TextBox>
                    </div>
                </div>
            </section>
            <div id="login_links1" style="margin: auto; padding: 10px 0px 0px 0px; width: 430px;
                height: 50px;">
                <div id="but_style" style="margin-left: 140px;">
                    <div id="to_left" style="margin: 0px 0px 0px 13px;"><input id="btn_login" type="button" class="l_go" value="Login" onclick="return checkLogin();" runat="server" /></div>
                     <div id="to_right" style="margin: 5px 0px 0px 13px;">
                    <a href="#" id="hyplink_register" class="l_links1">Register</a></div>
                </div><br /><br />
               <%--<div id="to_right" style="margin:43px 0px 0px 22px;"><a href="#" class="l_links" id="btnClose">Close</a></div>--%>
                  <div style="margin-left:130px; margin-top:10px;"><asp:Label ID="lbl_result" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label></div>
            </div>
            
            
        </div>
    </div>


                         <%--<uc_register:registeruc ID="registeruc" runat="server" />--%>
                         <%--Regitration popup--%>
                         
<div id="RegisterControl">
        <div id="p_f_data" class="p_f_box_style">
            <section id="login_header">
                <h3>
                    New User Registration</h3>
            </section>
            <section id="p_f_fields">
                <div id="p_f_field_area">
                    <div id="p_f_label">
                        Email ID :</div>
                    <div id="p_f_field" class="style4">
                        <asp:TextBox ID="txt_emailid2" CssClass="p_f_form_style" runat="server" Width="180px"></asp:TextBox>
                    </div>
                </div>
                <div id="p_f_field_area">
                    <div id="p_f_label">
                        Password :</div>
                    <div id="p_f_field" class="style4">
                        <asp:TextBox ID="txt_pwd2" CssClass="p_f_form_style" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                    </div>
                </div>
                <div id="p_f_field_area">
                    <div id="p_f_label">
                        Confirm Password :</div>
                    <div id="p_f_field" class="style4">
                        <asp:TextBox ID="txt_confirmpwd2" CssClass="p_f_form_style" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
                    </div>
                </div>
            </section>
            <div id="login_links1" style="margin: auto; padding: 10px 0px 0px 0px; width: 430px;
                height: 50px;">
                <div id="but_style" style="margin-left: 170px;">
                    <div id="to_left" style="margin: 0px 0px 0px 13px;"><input id="btn_register" class="l_go" type="button" value="Register" onclick="return checkEmail();" runat="server" /></div>
                    <div id="to_left" style="margin: 5px 0px 0px 13px;">
                    <a href="#" id="hyplink_login" class="l_links1">Login</a>
            </div>
                </div><br />
                
            <div style="margin-left:120px; margin-top:20px;"><asp:Label ID="lbl_result2" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label></div>
        </div>
    </div>

<%--Registration popup end --%>
                         
                </div>
 <div id="login_links1" style="margin:-25px 0px 0px 15px; width:430px; height:30px;">
 <div id="to_right"><a href="#" class="l_links1" id="btnClose">Close</a></div>
 </div>
 </div>
                </ContentTemplate>
                </asp:UpdatePanel>
            <%--End of Pop-Up Window--%>
                
        <%--Modal Pop-Up End--%>
        
        
    <br clear="all" />
    
      <div id="CartDiv" style="display:none;">    
        
    <div id="box_header" style="margin-left:15px; width:970px; height:30px;">
    	<div id="to_left"><h2>Products in Cart</h2></div>
      
    </div>
        <!--Order items start-->
        <section id="o_i_layout" class="box_style">
        
            <!--Order items body start-->
            <div id="o_i_body">
                <!--Order items header part Start-->
                <div id="o_i_header">
                    <!--Cart items list header part start-->
                    <div id="o_i_header_left">
                      <ul>
                        <li>S.No</li>
                        <li>Product Details</li>
                        
			            </ul>
		            </div>
		            <div id="o_i_header_right">
			            <ul>
				            <li>Total Price (INR)</li>
				            <li style="padding-left:25px;">Quantity</li>
				            <li>Edit</li>
            			
                      </ul>
                    </div>
                    <!--Cart items list header part End--> 
                </div>
                <!--Order items header part End-->
            
            
            <!--Order items list Start-->
            <div id="o_items">
                
                <asp:DataList ID="itemCartDL" runat="server" RepeatDirection="Vertical" 
        DataKeyField="ItemId" OnItemCommand ="itemCartDL_ItemCommand" GridLines="Both" 
        HorizontalAlign="Justify" RepeatLayout="Flow">
        <ItemTemplate>
            <div id="o_items_row">
            <!--Order items S No Cl Start-->
                    <aside id="o_i_l_cl1">
                      <div id="o_i_l_sno" class="style4"><%# Container.ItemIndex+1 %></div>
                    </aside>
                    <!--Cart items S No Cl End-->
                    
                    <!--Order items img Cl Start-->
            <aside id="o_i_l_cl2">
				<section id="o_i_l_img"> 
					
					<div id="o_i_l_img_placeholder"><a href="#" target="_self"><asp:ImageButton runat="server" ID="itemImage" Width="130" Height="130" ImageUrl='<%# Eval("ImagePath")%>' 
					PostBackUrl='<%# Page.ResolveUrl("~/fulldetails.aspx?id="+ DataBinder.Eval(Container.DataItem, "ItemId" )+"&grp=3") %>'/></a></div>
			  </section>
			  <section id="o_i_l_fields">
					
                          <div id="o_i_l_field_area">
                              
                              <div id="o_i_l_field" class="style4" style="font-size:18px;"><asp:Label ID="nameLbl" runat="server" Text='<%# Eval("ItemName")%>'> </asp:Label>
                              </div>
                          </div>
						  <div id="o_i_l_field_area">
                              <div id="o_i_l_label">Product Id :</div>
                              <div id="o_i_l_field" class="style4"><asp:Label ID="noLbl" runat="server" Text='<%# Eval("ItemId")%>'></asp:Label>
                              </div>
                          </div>
						  <div id="o_i_l_field_area">
                              <div id="o_i_l_label">Price :</div>
                              <div id="o_i_l_field" class="style4"><asp:Label ID="priceLbl" runat="server" Text='<%# Eval("BilledRate")%>'> </asp:Label>
                              </div>
                          </div>
                           <div id="o_i_l_field_area">
                            <div id="o_i_l_label"><asp:Label ID="sizeLbl" runat="server" Text='<%# Eval("Size")%>'> </asp:Label></div>
                          </div>
					
			  </section>
            </aside>
            <!--Order items img Cl End-->
            <!--Order items Total Cl Start-->
                <aside id="o_i_l_cl3">
                      <div id="o_i_l_field_area" style="width:230px;">
                              <%--<div id="o_i_l_label" style="width:80px;">Total Rate :</div>--%>
                              <div id="o_i_l_field" class="style4" style="padding-left:20px; width:100px; font-size:16px;"><asp:Label ID="rateLbl" runat="server" Text='<%# Eval("TotalRate")%>'> </asp:Label>
                              </div>
                          </div>
                    </aside>
            <!--Order items Total Cl End-->
            <!--Order items Total Cl Start-->
                <aside id="o_i_l_cl4">
                      <div id="o_i_l_field_area" style="width:140px;">
                              <%--<div id="o_i_l_label" style="width:10px;"></div>--%>
                              <div id="o_i_l_field" class="style4" style="width:100px;"><asp:TextBox CssClass="o_i_f_form_style"  ID="qtyTxt" runat="server" Text='<%# Eval("Qty")%>'></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="qtyTxt"
                                        ErrorMessage="*" SetFocusOnError="True" ValidationGroup="orderpgVal">empty !</asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="orderpgVal" SetFocusOnError="true" ErrorMessage="Enter valid mobile number." ControlToValidate="qtyTxt" ForeColor="Red" 
                                                                                              ValidationExpression="^(?:[1-9]|0[1-9]|1[0-9]|20)$">Max 20</asp:RegularExpressionValidator>
              
                              </div>
                          </div>
                    </aside>
            <!--Order items Total Cl End-->
             <!--Order items Update Cl Start-->
            <aside id="o_i_l_cl5">
              <div id="o_i_l_edit"><asp:LinkButton ID="updateBtn" runat="server" CommandArgument = '<%# Eval("ItemId")%>' CommandName ="UpdateItem" CausesValidation="true" ValidationGroup="orderpgVal"  class="c_l_links" >Update</asp:LinkButton></div>
              <div id="o_i_l_edit"><asp:LinkButton ID="deleteBtn" runat="server" CommandArgument = '<%# Eval("ItemId")%>' CommandName ="RemoveItem"  class="c_l_links" >Remove</asp:LinkButton></div>
            </aside>
            <!--Order items img Cl End-->
               
        
            </div>
        </ItemTemplate>
    </asp:DataList>
                    
                </div>
            <!--Order items body End-->
            <div id="o_i_bottom" class="bg_style1">
                  <aside id="o_i_r_cl1" class="style4"></aside>
                    
                    <aside id="o_i_r_cl3" class="style4">Total Products :<asp:Label ID="noOfItemsLbl2" CssClass="style5" runat="server" Text="Items: 0"></asp:Label></aside>
                    <aside id="o_i_r_cl4" class="style4">Total Payment :<asp:Label ID="totalLbl2" CssClass="style5" runat="server" Text="0"></asp:Label></aside>
                    <aside id="o_i_r_cl5"></aside>
                    <aside id="o_i_r_cl6">
                        
        	             <div id="but_style">   
        	                    <input type="button" class="l_go" id="btn_ConfirmOrder" value="Confirm Purchase" style=" height:40px; font-size:16px;"/>
        	                    <input type="button" class="l_go" id="btn_cancel" value="Continue Shopping" style=" height:40px;"/>
                                <%--<asp:LinkButton id="btn_ConfirmOrder" runat="server" CssClass="l_go">Confirm Order</asp:LinkButton>
                               --%>
                        </div>
                    <%--<input type="button" class="buttons" id="btn_ConfirmOrder" value="Confirm Order"/>--%></aside>
                    <%--<aside id="o_i_r_cl7"><asp:Button ID="btn_cancel" class="buttons" runat="server" Text="Cancel" 
            onclick="btn_cancel_Click" /></aside>--%>
            </div>
            </div>
            <!--Order items list End-->
        </section>
        <!--Order items End-->
        <asp:Label ID="errorLbl" runat="server" Font-Bold="true"></asp:Label>
        
   
       
    </div>
       
    
    <div id="adressDiv" style="padding-top:10px; display:none; height:420px;">
    <div id="box_header" style="margin-left:15px; width:970px; height:30px;">
    	<div id="to_left"><h2>Shipping Address details.</h2></div>
      
    </div>
    <div id="p_f_data" class="p_f_box_style" style="width: 520px; height: 300px;">
        <section id="login_header">
            <h3>
                Edit shipping address.</h3>
        </section>
        <section id="p_f_fields" style="width: 490px; height: 200px;">
            <div id="p_f_field_area" style="width: 490px; height: 30px;">
                <div id="p_f_label" style="margin-top: 2px; padding-top: 2px;">
                    Email ID :</div>
                    <div id="but_style" class="style4" style="padding-top: 4px; padding-left:5px;"></div>
                <div id="p_f_field" class="style4">
                    <asp:TextBox ID="txt_emailidadr" CssClass="p_f_form_style" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                </div>
            </div>
            <div id="p_f_field_area" style="width: 490px; height: 30px;">
                <div id="p_f_label" style="margin-top: 2px; padding-top: 4px;">
                    Name :</div>
                <div id="but_style" class="style4" style="padding-top: 4px;">
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="*" ControlToValidate="txt_uname"
                        SetFocusOnError="True" ValidationGroup="1"></asp:RequiredFieldValidator>
                </div>
                <div id="p_f_field" style="width: 200px;">
                    <asp:TextBox ID="txt_uname" CssClass="p_f_form_style" runat="server" Width="180px"></asp:TextBox>
                </div>
            </div>
            <div id="p_f_field_area" style="width: 490px; height: 30px;">
                <div id="p_f_label" style="margin-top: 2px; padding-top: 4px;">
                    Phone Number :</div>
                <div id="but_style" class="style4" style="padding-top: 4px;">
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" 
                        ControlToValidate="txt_phno" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </div>
                <div id="p_f_field" style="width: 200px;">
                    <asp:TextBox ID="txt_phno" CssClass="p_f_form_style" runat="server" Width="180px"></asp:TextBox>
                
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txt_phno" ErrorMessage="Enter Valid 10 digit Mobile Number" 
                        SetFocusOnError="True" ValidationExpression="\d{10}" ValidationGroup="1"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div id="p_f_field_area" style="width: 490px; height: 70px;">
                <div id="p_f_label" style="margin-top: 25px; padding-top: 4px;">
                    Address :</div>
                <div id="but_style" class="style4" style="padding-top: 4px;">
                    <asp:RequiredFieldValidator ID="rfv3" runat="server" 
                        ControlToValidate="txt_address" ErrorMessage="*" SetFocusOnError="True" 
                            ValidationGroup="1"></asp:RequiredFieldValidator>
                </div>
                <div id="p_f_field" style="width: 200px;">
                    <asp:TextBox ID="txt_address" CssClass="p_f_form_style" Rows="3" runat="server" TextMode="MultiLine" Height="70px" Width="180px"></asp:TextBox>
            </div>
                <div>
                <asp:Label ID="lbl_status" runat="server" ForeColor="Red"></asp:Label>
                </div>
        </section>
        <div id="login_links" style="width: 510px; height:30px;">
            <div id="to_left">Change your Profile with above details <asp:CheckBox ID="cb_profilechange" runat="server" /></div>
            <div id="but_style" style="margin: 0px 0px 0px 13px;">
                 <asp:Button ID="ConfirmBtn" runat="server" Text="Confirm" CssClass="l_go" OnClick="ConfirmBtn_Click" OnClientClick="if (Page_ClientValidate()) return showPreloader(); else return false;" ValidationGroup="1" />
                 <asp:LinkButton ID="back_btn" runat="server" Text="Back" CssClass="l_go" PostBackUrl="~/USER/OrderPage.aspx"></asp:LinkButton>
            </div>
                 
        </div>
    </div>
    </div>
   
        <asp:Label ID="emailsentlbl" runat="server" Visible="false"></asp:Label>
        <div id="cartData" runat="server" Visible="false">
            <asp:Label ID="purchaseIdLbl" runat="server"></asp:Label>
            <asp:Label ID="totalpLbl" runat="server"></asp:Label>
            <asp:Label ID="itemspNoLbl" runat="server"></asp:Label>
            <asp:Label ID="purchaseDateLbl" runat="server"></asp:Label>
            <asp:Label ID="userpNameLbl" runat="server"></asp:Label>
            <asp:Label ID="addrpLbl" runat="server"></asp:Label>
            <asp:Label ID="phnpLbl" runat="server"></asp:Label>
            <div id="cartGrid" runat="server">
                <asp:GridView ID="cartDataGV" runat="server">
                </asp:GridView>
            </div>
        </div>
        <div id="ordermailedDiv" class="p_f_box_style" style="display:none; position:absolute; z-index:103; height:100px; top:300px; left:500px; text-align:center; padding:30px;">
            <b>Your Order is Placed Succefully.</b><br /><b>And a Confirmaition email is sent to your email id.</b><br />
            <div style="height:20px;"></div>
            <a href="ProfilePage.aspx" class="l_go">OK</a>
        </div>
        <div id="ordermailedDivError" class="p_f_box_style" style="display:none; position:absolute; z-index:103; height:100px; top:300px; left:500px; text-align:center; padding:30px;">
            <b>Your Order is Placed Succefully.<br />Error Occured while sending Email Confirmation<br /></b>
            <div style="height:20px;"></div>
            <a href="ProfilePage.aspx" class="l_go">OK</a>
        </div>
        <asp:HiddenField ID="chkConfirm" runat="server" />
</asp:Content>
