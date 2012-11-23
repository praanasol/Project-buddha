<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainCartControl.ascx.cs" Inherits="budhashop.UserControls.MainCartControl" %>

 <link href="../Styles/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
<script src="../script/scroll/jquery.jscrollpane.min.js" type="text/javascript"></script>

<script src="../script/scroll/jquery.mousewheel.js" type="text/javascript"></script>

<script src="../script/scroll/mwheelIntent.js" type="text/javascript"></script>

<script src="../script/scroll/scrollcheck.js" type="text/javascript"></script>
    <style type="text/css">
    
    .scroll-pane
{
	width: 100%;
	max-height: 250px;
	overflow: auto;
}
.horizontal-only
{
	height: auto;
	max-height: 200px;
}
    
    </style>
    
   
​
<style type="text/css">
    .Normal
{
  
  background-color:Transparent;
  cursor: auto;
  padding:2px;
  width: 370px;
 
  text-align: center;
}
 
.Progress
{
  
  background-color:#EEEEEE;
  background-image: url(spinner.gif);
  background-position: center center;
  background-repeat: no-repeat;
  cursor: wait;
  padding: 2px;
  width: 370px;

  text-align: center;
}
</style>
    

<style type="text/css">
    #signin
    {
        
        padding: 0px 0px 0px;
        font-family: "Courier New" , Courier, monospace;
        font-size: 12px;
       
        font-weight: bold;
        text-decoration: none;
        -webkit-border-radius: 0px;
        -moz-border-radius: 0px;
        
    }
    #signin a.menu-open
    {
        background: #3d3d3c !important;
        color: #666 !important;
        outline: none;
    }
    #topnav1-left
    {
        position: absolute;
        top: 5px;
        left: 80px;
        width: 20px;
        text-align: left;
    }
    #topnav1
    {
        padding: 0px 0px 0px;
        font-size: 11px;
        line-height: 23px;
        text-align: right;
        margin-left:30px;
    }
    #topnav1 a.signin
    {
        
        padding: 0px 0px 0px;
        font-family: "Courier New" , Courier, monospace;
        font-size: 12px;
        
        font-weight: bold;
        text-decoration: none;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
       
    }
    #topnav1 a.signin:hover
    {
        background: #e3c353;
        color: #9b0707;
        font-weight: bold;
        text-decoration: none;
        padding: 4px 12px 6px;
    }
    #topnav1 a.signin, #topnav1 a.signin:hover
    {
        background-position: 0 3px !important;
    }
    a.signin
    {
        position: relative;
        margin-left: 3px;
    }
    a.signin span
    {
        background-repeat: no-repeat;
        background-position: 100% 50%;
        padding: 4px 16px 6px 0;
    }
    #topnav1 a.menu-open
    {
        background: #e3c353 !important;
        color: #666 !important;
        outline: none;
    }
    #small_signup
    {
        display: inline;
        float: none;
        line-height: 23px;
        margin: 25px 0 0;
        width: 170px;
    }
    a.signin.menu-open span
    {
        color: #789;
    }
    #f_submit a.but_style
    {
        margin: 0px 0px 0px 10px;
        padding-top: 0px;
        width: 85px;
        height: 33px;
        float: left;
        font-family: Verdana, Geneva, sans-serif;
        font-size: 14px;
        color: #3d3d3c;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
        background: url(../images/submit.gif) left center no-repeat;
    }
    #f_submit a.but_style:hover
    {
        margin: 0px 0px 0px 10px;
        padding-top: 0px;
        width: 85px;
        height: 33px;
        float: left;
        font-family: Verdana, Geneva, sans-serif;
        font-size: 14px;
        color: #9b0707;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
        background: url(../images/submit_hover.gif) left center no-repeat;
    }
</style>
<style type="text/css">
    #signin_menu
    {
        -moz-border-radius-topleft: 5px;
        -moz-border-radius-topright: 5px;
        -moz-border-radius-bottomleft: 5px;
        -moz-border-radius-bottomright: 5px;
        -webkit-border-top-left-radius: 2px;
        -webkit-border-bottom-left-radius: 2px;
        -webkit-border-bottom-right-radius: 2px;
        background-color:Transparent;
        /*display: none;*/
        position: absolute;
        width: 450px;
        height: auto;
        z-index: -1;
        border: 1px transparent;
        text-align: left;
        padding: 2px;
        top: 188px;
        
        margin-top: 5px;
        padding-top: -2px;
        margin-left: 292px;
        font-family:Arial;
	font-size:14px;
	color:#e79b3f;
	font-weight:bold;
	text-decoration:none;
    }
    #signin_menu p
    {
        margin: 0;
    }
    
    #signin_menu label
    {
        font-weight: normal;
    }
    #signin_menu p.remember
    {
        padding: 1px 0;
    }
    #signin_menu p.forgot, #signin_menu p.complete
    {
        clear: both;
        margin: 2px 0;
    }
    #signin_menu p a
    {
        color: #27B !important;
    }
    #signin_submit
    {
        -moz-border-radius: 4px;
        -webkit-border-radius: 4px;
        background: #39d url( 'images/submit.gif' ) repeat-x scroll 0 0;
        border: 1px solid #39D;
        color: #fff;
       
        padding: 4px 10px 5px;
        font-size: 11px;
        margin: 0 5px 0 0;
        font-weight: bold;
    }
    #signin_submit::-moz-focus-inner
    {
        padding: 0;
        border: 0;
    }
    #signin_submit:hover, #signin_submit:focus
    {
        background-position: 0 -5px;
        cursor: pointer;
    }
    a.smalllinks:link, a.smalllinks:visited{
	margin:10px;
	padding:0px;
	font-family:"Courier New", Courier, monospace;
	font-size:11px;
	color:#69a0bd;
	font-weight:bold;
	text-decoration:none;
}
 a.smalllinks:hover,  a.smalllinks:active{
	margin:10px;
	padding:0px;
	color:#9b0707;
	font-weight:bold;
	text-decoration:none;
}
</style>
<style type="text/css">
    body
    {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
    }
</style>





 <%--<script type="text/javascript">
                                                                      
  // Get a reference to the PageRequestManager.
  var prm = Sys.WebForms.PageRequestManager.getInstance();
 
  // Using that prm reference, hook _initializeRequest
  // and _endRequest, to run our code at the begin and end
  // of any async postbacks that occur.
  prm.add_initializeRequest(InitializeRequest);
  prm.add_endRequest(EndRequest);
 
  // Executed anytime an async postback occurs.
  function InitializeRequest(sender, args) 
  {
    // Change the Container div's CSS class to .Progress.
    $get('box3').className = 'Progress';
    $get('box3').style.cursor = 'wait'; 
 
    // Get a reference to the element that raised the postback,
    //   and disables it.
    $get(args._postBackElement.id).disabled = true;
  }
 
  // Executed when the async postback completes.
  function EndRequest(sender, args) 
  {
    // Change the Container div's class back to .Normal.
    $get('box3').className = 'Normal';
     $get('box3').style.cursor = 'auto';
 
    // Get a reference to the element that raised the postback
    //   which is completing, and enable it.
    $get(sender._postBackSettings.sourceElement.id).disabled = false;
  }
  </script>
--%>
<body>
<div id="topnav1" >
 <aside id="list">
        	<div id="list_left">
            	<%--<p class="style1" style="font-size:12px;">Cart Items<br /></p>--%>
            	
            	<div id="list_simble" style="margin-top:3px;"></div>
            	<div class="style1"><asp:Label ID="totitems" runat="server" Text="0" CssClass="style1"></asp:Label></div>
            	<asp:HiddenField ID="hiddenCheck5" Value="0" runat="server" />
                 <asp:HiddenField ID="hiddenCheck6" Value="0" runat="server" />
            	
            	
            </div>
            <div id="list_v_line"></div>
            <div id="list_right">
            	<%--<div id="list_simble"></div>--%>
            	<%--<span><asp:ImageButton ID="signin1" CausesValidation="false" CssClass="signin" runat="server" ImageUrl="../images/arrow_down.gif" Width="23" Height="11"/></span>
    --%><div  class="signin" style="padding-top:8px;"><%--<asp:LinkButton ID="signin1" CausesValidation="false" runat="server">Cart</asp:LinkButton>--%>
    
    <span><a id="signin" href="#" target="_self"><img src="../images/arrow_down.gif" width="31" height="14" alt="List" title="List"></a></span></div>
        </div>
            
       </aside> 
    <fieldset id="signin_menu">
    
        <%--<asp:Label ID="errorLbl" runat="server" Text="No items in cart!" Font-Bold="true"
        ></asp:Label>--%>
        <!--Full Page Details Start-->
        
        
        
        <%--<input type="button" id="hideCartBtn" value="Hide" />--%>
        <asp:HiddenField ID="hdnUserId" runat="server"/>
       
       
      <%--  <asp:Panel ID="itempanel" runat="server" CssClass="scroll-pane" Height="300" Width="350" BorderStyle="Solid" BorderColor="Black" ScrollBars="Vertical"> --%>                                                                              
      
       <%-- </asp:Panel>--%>
       
      <section id="cart_layout" class="inner_box_style" style="margin-top:-13px; margin-right:156px;"> 
    <!-- Cart body start-->
    <div id="cart_body"> 
      <!--cart header part start-->
      <div id="cart_header"> 
        <!--Cart heder item1 start-->
        <aside id="c_h_cl1">
          <p class="tstyle4">Total Items<br />
          <div class="bg_style1">
          <asp:Label ID="noOfItemsLbl" runat="server" CssClass="bg_style1" Text="0"></asp:Label>
          </div>
          </p>
        </aside>
        <!--Cart heder item1 start--> 
        <!--Cart heder item2 start-->
        <aside id="c_h_cl2">
          <p class="tstyle4">Total Price<br />
          
          <div class="bg_style1"><asp:Label ID="totalLbl" runat="server" Text="0"></asp:Label></div>
          </p>
        </aside>
        <!--Cart heder item2 start--> 
        <!--Cart heder item3 start-->
        <aside id="c_h_cl3">
          <div id="c_h_item" class="c_h_cl_box_style">
            <div id="c_h_item_link"><asp:LinkButton ID="orderBtn1" runat="server" CssClass="c_h_links" Text="Proceed" 
            onclick="orderBtn_Click" Enabled="false"/></div>
          </div>
        </aside>
        <!--Cart heder item3 start--> 
        <!--Cart heder item4 start-->
        <aside id="c_h_cl4"> 
          <div><a id="hideCartBtn" href="#" target="_self" class="hide" style="color:#8C0B05; font-size:12px; padding:0px 0px 0px 3px;">Hide</a></div>
        </aside>
        <!--Cart heder item4 start--> 
      </div>
      <!--cart header part end--> 
      
      <!--Cart items list part start-->
      <div id="cartlist_part"> 
        <!--Cart items list header part start-->
        <div id="c_l_header">
        <div id="c_l_header_left">
          <ul>
           
            <li>Product Details</li>
            
			</ul>
		</div>
		<div id="c_l_header_right">
			<ul>
			    <li>Total(Rs)</li>
				<li>Quantity</li>
				
			
          </ul>
        </div>
        </div>
        <!--Cart items list header part End--> 
        <div id="chatlist" class="scroll-pane" style="width: 448px;max-height:250px;">
         <asp:Label ID="errorMsg" runat="server" Text="0" CssClass="style1"></asp:Label>
        <asp:DataList ID="itemCartDL" runat="server" RepeatDirection="Vertical" DataKeyField="ItemId" OnItemCommand ="itemCartDL_ItemCommand">
           
            <ItemTemplate>
            <div id="itemValues">
        <!--Cart items list Start-->
        <section id="cart-list">
          <div id="c_l_items_row">
          
          	 <!--Cart items S No Cl Start-->
          	 <div id="Div1" style="height:20px;">
                             
                              <div id="c_l_field_Name"><asp:Label ID="Label1" runat="server" Text='<%# Eval("ItemName")%>'> </asp:Label>
                              </div>
                          </div>
                          <div>
            <aside id="c_l_cl1">
              <div id="c_l_sno" class="style1"><%# Container.ItemIndex+1 %></div>
            </aside>
            <!--Cart items S No Cl End-->
            <!--Cart items img CL Start-->
            <aside id="c_l_cl2">
				<section id="c_l_img"> 
					
					<div id="c_l_img_placeholder"><a href="#" target="_self"><asp:ImageButton runat="server" ID="itemImage" Width="60px" Height="60px" ImageUrl='<%# Eval("ImagePath")%>'
					PostBackUrl='<%# Page.ResolveUrl("~/fulldetails.aspx?id="+ DataBinder.Eval(Container.DataItem, "ItemId" )+"&grp=3") %>'/></div>
			  </section>
			  <section id="c_l_fields">
					
                          
                           <div id="c_l_field_area">
                              <div id="c_l_label">Price :</div>
                              <div id="c_l_field" >Rs.<asp:Label ID="priceLbl" runat="server" Text='<%# Eval("BilledRate")%>'> </asp:Label>
                              </div>
                          </div>
						  <div id="c_l_field_area">
                              <div id="c_l_label">Product Id :</div>
                              <div id="c_l_field" ><asp:Label ID="noLbl" runat="server" Text='<%# Eval("ItemId")%>'> </asp:Label>
                              </div>
                          </div>
						 
                          
					
			  </section>
            </aside>
            <!--Cart items img CL End-->
            <!--Cart items Quantity CL Start-->
            <aside id="c_l_cl3">
              <div id="c_l_form" class="style4">
              <asp:Label ID="rateLbl" runat="server" Text='<%# Eval("TotalRate")%>'> </asp:Label>
               </div>
            </aside>
            <!--Cart items Quantity CL End-->
            
            <!--Cart items Quantity CL Start-->
            <aside id="c_l_cl4">
              <div id="c_l_form">
              
              <asp:TextBox  ID="qtyTxt" runat="server" CssClass="c_l_form_style" Text='<%# Eval("Qty")%>' MaxLength="2"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="qtyTxt"
                                        ErrorMessage="*" SetFocusOnError="True" ValidationGroup="cartValid">empty !</asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="cartValid" SetFocusOnError="true" ErrorMessage="Enter valid mobile number." ControlToValidate="qtyTxt" ForeColor="Red" 
                                                                                              ValidationExpression="^(?:[1-9]|0[1-9]|1[0-9]|20)$">Max 20</asp:RegularExpressionValidator>
                 
               </div>
               
            </aside>
            <!--Cart items Quantity CL End-->
            
            <!--Cart items Edit CL Start-->
            <aside id="c_l_cl5">
              <div id="c_l_edit"> <asp:LinkButton ID="updateBtn" runat="server" CssClass="c_l_links" CausesValidation="true" ValidationGroup="cartValid" CommandArgument = '<%# Eval("ItemId")%>' CommandName ="UpdateItem" >Update</asp:LinkButton>
                        </div>
              <div id="c_l_edit" style="margin-top:20px;"> <asp:LinkButton ID="deleteBtn" runat="server" CssClass="c_l_links" CommandArgument = '<%# Eval("ItemId")%>' CommandName ="RemoveItem" >Remove</asp:LinkButton>
                        </div>
            </aside>
            <!--Cart items Edit CL End-->
          </div>
          </div>
        </section>
        <!--Cart items list End--> 
        </div>
        
            </ItemTemplate>
        </asp:DataList>
       
        
      </div>
      <!--Cart items list part End--> 
    </div>
    <!-- Cart body end--> 
    </div>
  </section>
   
    
        <!--Full Page Details End-->
         
    </fieldset>
    
</div>
</body>