<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true"
    CodeBehind="ProfilePage.aspx.cs" Inherits="budhashop.USER.ProfilePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- styles needed by jScrollPane -->
<link type="text/css" href="../Styles/jquery.jscrollpane.css" rel="stylesheet" media="all" />
 
<!-- latest jQuery direct from google's CDN -->

<!-- the mousewheel plugin - optional to provide mousewheel support -->
<script type="text/javascript" src="../script/scroll/jquery.mousewheel.js"></script>
 
<!-- the jScrollPane script -->
<script type="text/javascript" src="../script/scroll/jquery.jscrollpane.min.js"></script>
 <script src="../script/scroll/mwheelIntent.js" type="text/javascript"></script>


    <link href="../Styles/scrollpane_custom.css" rel="stylesheet" type="text/css" />
    <script src="../script/profilePage.js" type="text/javascript"></script>
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
            <style type="text/css">
    div#itemsList {
    width: 470px;
    height:230px;
    
    
}
div.mousescroll {
    overflow: hidden;
}
div.mousescroll:hover {
    overflow-y: scroll;
}
.slimScrollDiv { border: 1px solid #ccc; margin:10px; }
ul {
    list-style-type: none;
}

</style>

    <div id="box_header" style="width:985px;">
    	<h2>Profile Page</h2>
      
    </div>
    <div id="p_data_area" class="box_style">
        <div id="profileDiv">
            <!--Profile Start-->
            <aside id="p_data" class="p_f_box_style">
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
                <div id="login_links1" style="margin:auto; margin-top:40px; padding-left:15px; width:200px;">
                    <a href="#" ID="hyplink_changepwd" class="l_links1">Change Password?</a>
                    <a href="#" ID="hyplink_edit" class="l_links1">Edit Profile</a>
                    <br />
                    <asp:Label ID="lbl_status" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </aside>
            <!--Profile End-->
          <!--Popup start-->
            <asp:UpdatePanel ID="profileEditPop" runat="server">
                <ContentTemplate>
                    <div id="overlay" class="web_dialog_overlay">
                    </div>
                    <div id="ProfileField" class="web_dialog">
                        <div id="p_f_data" class="p_f_box_style" style="width:520px; height:270px;">
                            <section id="login_header"><h3>Edit Profile</h3></section>
                            <section id="p_f_fields" style="width:490px; height:200px;">
                                <div id="p_f_field_area" style="width:490px; height:30px;">
                                    <div id="p_f_label">
                                        Email ID :</div>
                                    <div id="p_f_field" class="style4">
                                        <asp:TextBox ID="txt_emailidedit" CssClass="p_f_form_style" ReadOnly="true" runat="server" Width="180px"></asp:TextBox>
                                    </div>
                                </div>
                                <div id="p_f_field_area" style="width:490px; height:30px;">
                                    <div id="p_f_label" style=" margin-top:2px; padding-top:5px;">
                                        Name :</div>
                                    <div id="p_f_field" class="style4" style="padding-top:4px;">
                                        <asp:TextBox ID="txt_unameedit" CssClass="p_f_form_style" runat="server" Width="180px"></asp:TextBox>
                                        
                                    </div>
                                    <div id="but_style" style="width:100px;">
                                        <input id="btn_updatename" class="l_go" onclick="return updateName();" type="button" value="Update" runat="server" />
                                        </div>
                                </div>
                                <div id="p_f_field_area" style="width:490px; height:30px;">
                                    <div id="p_f_label" style=" margin-top:2px; padding-top:5px;">
                                        Phone Number :</div>
                                    <div id="p_f_field" class="style4" style="padding-top:4px;">
                                        <asp:TextBox ID="txt_phnoedit" CssClass="p_f_form_style" runat="server" Width="180px"></asp:TextBox>
                                        
                                       
                                    </div>
                                    <div id="but_style" style="width:100px;">
                                     <input id="btn_updatephno" class="l_go" onclick="return updatePhNum();" type="button" value="Update" runat="server" />
                                    </div>
                                </div>
                                <div id="p_f_field_area" style="width:490px; height:70px;">
                                    <div id="p_f_label" style=" margin-top:25px; padding-top:5px;">
                                        Address :</div>
                                    <div id="p_f_field" class="style4" style="padding-top:4px;">
                                        <asp:TextBox ID="txt_addressedit" CssClass="p_f_form_style" runat="server" TextMode="MultiLine" Width="180px" Height="70"
                                        Rows="3"></asp:TextBox>
                                    </div>
                                    <div id="but_style" style="width:100px; margin-top:25px;"><input id="btn_updateaddress" class="l_go" onclick="return updateAddress();" type="button" value="Update" runat="server" /></div>
                                </div>
                             </section>
                             <div id="login_links1" style="width:510px;"><asp:Label ID="lbl_result" runat="server" ForeColor="Red"></asp:Label>
                             <div id="to_right" style="margin:0px 0px 0px 13px;"><a href="#" class="l_links1" id="btnClose">Close</a></div>
                             </div>
                        </div>
                        
                    </div>
                    <div id="PasswordField" class="web_dialog">
                        <div id="p_f_data" class="p_f_box_style">
                            <section id="login_header"><h3>Change Password</h3></section>
                            <section id="p_f_fields">
                                <div id="p_f_field_area">
                                    <div id="p_f_label">
                                        Email ID :</div>
                                    <div id="p_f_field" class="style4">
                                        <asp:TextBox ID="txt_emailidpwd" CssClass="p_f_form_style" ReadOnly="true" runat="server" Width="180px"></asp:TextBox>
                                    </div>
                                </div>
                                <div id="p_f_field_area">
                                    <div id="p_f_label">
                                        Old Password :</div>
                                    <div id="p_f_field" class="style4">
                                        <asp:TextBox ID="txt_oldpwd" CssClass="p_f_form_style" TextMode="Password" runat="server" Width="180px"></asp:TextBox>
                                    </div>
                                </div>
                                <div id="p_f_field_area">
                                    <div id="p_f_label">
                                        New Password :</div>
                                    <div id="p_f_field" class="style4">
                                        <asp:TextBox ID="txt_newpwd" CssClass="p_f_form_style" TextMode="Password" runat="server" Width="180px"></asp:TextBox>
                                    </div>
                                </div>
                                <div id="p_f_field_area">
                                    <div id="p_f_label">
                                        Confirm Password :</div>
                                    <div id="p_f_field" class="style4">
                                        <asp:TextBox ID="txt_confirmnewpwd" CssClass="p_f_form_style" TextMode="Password" runat="server" Width="180px"></asp:TextBox>
                                    </div>
                                </div>
                             </section>
                             
                             <div id="login_links1" style="margin:auto; padding:10px 0px 0px 0px; width:430px; height:60px;">
                                <div id="but_style" style="margin-left:180px;">
                             <input id="btn_updatepwd" onclick="return updatePassword();" class="l_go" type="button" value="Update" runat="server" /><br />
                             <asp:Label ID="lbl_resultpwd" runat="server" ForeColor="Red"></asp:Label>
                             </div>
                             <div id="to_right" style="margin:40px 0px 0px 13px;"><a href="#" class="l_links1" id="btnClose1">Close</a></div>
                             </div>
                             
                                    </div>
                                    
                        
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--End of Pop-Up Window--%>
            <%--Modal Pop-Up End--%>
        </div>
        <div id="box_header" style="width:985px;">
    	<h2>Purchase History</h2>
      
    </div>
        <div id="orderHistoryDiv">
            <aside id="grid">
           <%-- <div id="contentDiv" class="scroll-pane" style="height:350px;">--%>
            <asp:Panel ID="contentDiv" runat="server" CssClass="scroll-pane" Height="350" ScrollBars="Vertical">
                <asp:GridView ID="orderGrid" CssClass="orderGrid" runat="server" CellSpacing="6" CellPadding="2"  HeaderStyle-CssClass="g_head"  AlternatingRowStyle-CssClass="p_g_alt_row_style" RowStyle-CssClass="p_g_row_style" AutoGenerateColumns="False"
                    GridLines="None" AlternatingRowStyle-Wrap="False">
                    <%--AllowPaging="true" PageSize ="3" OnPageIndexChanging= "itemGrid_PageIndexChanging">--%>
                    <Columns>
                        <asp:TemplateField HeaderText="Purchase Id" ControlStyle-CssClass="p_g_cl">
                            <ItemTemplate>
                                <asp:Label ID="lbl_PurchaseId" runat="server" Text='<%# Eval("PurchaseId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Id" HeaderStyle-CssClass="hiddenColumn" ItemStyle-CssClass="hiddenColumn">
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
                        <asp:TemplateField HeaderText="Quantity" ControlStyle-CssClass="p_g_cl">
                            <ItemTemplate>
                                <asp:Label ID="lbl_itemQty" runat="server" Text='<%# Eval("NoItems") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Billed Rate" ControlStyle-CssClass="p_g_cl">
                            <ItemTemplate>
                                <asp:Label ID="lbl_totalBR" runat="server" Text='<%# Eval("TotalBilledRate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Purchase Date" ControlStyle-CssClass="p_g_cl">
                            <ItemTemplate>
                                <asp:Label ID="lbl_purchaseDate" runat="server" Text='<%# Eval("PurchaseDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Deliverd">
                            <ItemTemplate>
                                
                                <asp:CheckBox ID="cbDelivered" runat="server" Checked='<%# Eval("DeliveredFlag") %>' Enabled="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
               </asp:Panel>
           <%-- </div>--%>
            </aside>
            <aside id="grid_res">
                <div id="itemsDiv" style="height:370px;">
                
                
                <section id="p_d_fields" style="margin-top:0px; width:450px; margin-left:5px;">
                    <section id="login_header" style="margin:0px; width:440px;"><h2>Details</h2></section>
                    <div id="p_d_field_area">
                        <div id="p_r_d_label">
                            Name :</div>
                        <div id="p_d_field" class="style4" style="padding-top: 5px;">
                            <label id="NameA">
                        </label>
                        </div>
                    </div>
                    <div id="p_d_field_area">
                        <div id="p_r_d_label" class="style1">
                            Phone :</div>
                        <div id="p_d_field" class="style4" style="padding-top: 5px;">
                            <label id="PhnA">
                        </label>
                        </div>
                    </div>
                    <div id="p_d_field_area">
                        <div id="p_r_d_label">
                            Adress :</div>
                        <div id="p_d_field" class="style4">
                            <label id="AdrA">
                        </label>
                        </div>
                    </div>
                    
                </section>
               
            <br style="clear:both;" /><br />
                        
                   
                    
                    <div id="itemsList" class="mousescroll">
                   
                   <div>
                        <table id="itemTable">
                            
                            <tr>
                                <th class="g_head">
                                    Product Id
                                </th>
                                <th class="g_head">
                                    Name
                                </th>
                                <th class="g_head">
                                    
                                </th>
                                <th class="g_head">
                                    Price
                                </th>
                                <th class="g_head">
                                    Quantity
                                </th>
                                <th class="g_head">
                                    Total Rate
                                </th>
                            </tr>
                            <tr>
                            <td colspan="6" style="height:5px;"></td>
                            </tr>
                        </table>
                       </div>
                         
                       
                    </div>
                  
                  
                </div>
            </aside>
        </div>
    </div>
</asp:Content>
