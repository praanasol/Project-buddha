<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainCartControl.ascx.cs" Inherits="budhashop.UserControls.MainCartControl" %>

 <%--<link href="../Styles/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />

    <script src="../script/scroll/jquery.mousewheel.js" type="text/javascript"></script>
    <script src="../script/scroll/jquery.jscrollpane.min.js" type="text/javascript"></script>

    <script src="../script/scroll/mwheelIntent.js" type="text/javascript"></script>
    

<script type="text/javascript">

$ (function(){



	$('.scroll-pane').jScrollPane({
    horizontalGutter:5,
    verticalGutter:5,
    'showArrows': false
});

$('.jspDrag').hide();
$('.jspScrollable').mouseenter(function(){
    $(this).find('.jspDrag').stop(true, true).fadeIn('slow');
});
$('.jspScrollable').mouseleave(function(){
    $(this).find('.jspDrag').stop(true, true).fadeOut('slow');
});
});
</script>
<style type="text/css">
    .scroll-pane
{
	width: 100%;
	
	overflow: auto;
}
.horizontal-only
{
	height: auto;
	
}
.jspVerticalBar {
    width: 8px;
    background: transparent;
    right:10px;
}
 
.jspHorizontalBar {
    bottom: 5px;
    width: 100%;
    height: 8px;
    background: transparent;
}
.jspTrack {
    background: transparent;
}
 
.jspDrag {
    background: url(scroll_bg.gif) repeat;
    -webkit-border-radius:4px;
    -moz-border-radius:4px;
    
}
 
.jspHorizontalBar .jspTrack,
.jspHorizontalBar .jspDrag {
    float: left;
    height: 100%;
}
 
.jspCorner {
    display:none
}
	
    
    
    </style> --%>
    
    <style type="text/css">
    div#chatlist {
    width: 510px;
    max-height:385px;
    
    
}
div.mousescroll {
    overflow: hidden;
}
div.mousescroll:hover {
    overflow-y: scroll;
}
ul {
    list-style-type: none;
}
.slimScrollDiv { border: 1px solid #ccc; margin:10px; }
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
        display: none;
        position: absolute;
        width: 500px;
        height: 500px;
        z-index: 10001;
        border: 1px transparent;
        text-align: left;
        padding: 2px;
        top: 165px;
        right: 180px;
        margin-top: 5px;
        padding-top: -2px;
        margin-right: -1px;
        color: #789;
        font-size: 11px;
    }
    #signin_menu p
    {
        margin: 0;
    }
    #signin_menu a
    {
        color: #6AC;
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



<script type="text/javascript">
           
        $(document).ready(function() {      
               
               if(($("#noOfItemsLbl").text())!="0")
                {
                    $("#orderBtn1").removeAttr("disabled");
                }
                  
                 
            $(".signin").click(function(e) {          
				e.preventDefault();
				
                $("fieldset#signin_menu").toggle();
				$(".signin").toggleClass("menu-open");
            });
            
            $("#hideCartBtn").click(function(){
                $(".signin").removeClass("menu-open");
				$("fieldset#signin_menu").hide();
            });
						 
			$("fieldset#signin_menu").mouseup(function() {
				return false
			});
			
			
			$(document).mouseup(function(e) {
				if($(e.target).parent("a.signin").length==0) {
					$(".signin").removeClass("menu-open");
					$("fieldset#signin_menu").hide();
				}
			});
        });        
        
</script>

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
       
      <section id="cart_layout" class="inner_box_style"> 
    <!-- Cart body start-->
    <div id="cart_body"> 
      <!--cart header part start-->
      <div id="cart_header"> 
        <!--Cart heder item1 start-->
        <aside id="c_h_cl1">
          <p class="style4">Total Items<br />
          <div class="bg_style1">
          <asp:Label ID="noOfItemsLbl" runat="server" CssClass="bg_style1" Text="0"></asp:Label>
          </div>
          </p>
        </aside>
        <!--Cart heder item1 start--> 
        <!--Cart heder item2 start-->
        <aside id="c_h_cl2">
          <p class="style4">Total Price<br />
          
          <div class="bg_style1"><asp:Label ID="totalLbl" runat="server" Text="0"></asp:Label></div>
          </p>
        </aside>
        <!--Cart heder item2 start--> 
        <!--Cart heder item3 start-->
        <aside id="c_h_cl3">
          <div id="c_h_item" class="c_h_cl_box_style">
            <div id="c_h_item_link"><asp:LinkButton ID="orderBtn1" runat="server" CssClass="style1" Text="Make Order" 
            onclick="orderBtn_Click" Enabled="false"/></div>
          </div>
        </aside>
        <!--Cart heder item3 start--> 
        <!--Cart heder item4 start-->
        <aside id="c_h_cl4"> <span><a href="#" target="_self"><img src="../images/arrow_up.gif" width="39" height="17" alt="List" title="List"></a></span>
          <div style="margin-top:3px;"><a id="hideCartBtn" href="#" target="_self" class="hide">Hide</a></div>
        </aside>
        <!--Cart heder item4 start--> 
      </div>
      <!--cart header part end--> 
      
      <!--Cart items list part start-->
      <div id="cartlist_part"> 
        <!--Cart items list header part start-->
        <div id="c_l_header_left">
          <ul>
            <li>No.</li>
            <li>Product Details</li>
            
			</ul>
		</div>
		<div id="c_l_header_right">
			<ul>
				<li>Quantity</li>
				<li>Edit</li>
			
          </ul>
        </div>
        <!--Cart items list header part End--> 
        <div id="chatlist" class="mousescroll">
         <asp:Label ID="errorMsg" runat="server" Text="0" CssClass="style1"></asp:Label>
        <asp:DataList ID="itemCartDL" runat="server" RepeatDirection="Vertical" DataKeyField="ItemId" OnItemCommand ="itemCartDL_ItemCommand">
           
            <ItemTemplate>
            <div id="itemValues">
        <!--Cart items list Start-->
        <section id="cart-list">
          <div id="c_l_items_row">
          	 <!--Cart items S No Cl Start-->
            <aside id="c_l_cl1">
              <div id="c_l_sno" class="style2">1</div>
            </aside>
            <!--Cart items S No Cl End-->
            <!--Cart items img CL Start-->
            <aside id="c_l_cl2">
				<section id="c_l_img"> 
					
					<div id="c_l_img_placeholder"><a href="#" target="_self"><asp:ImageButton runat="server" ID="itemImage" Width="80px" Height="80px" ImageUrl='<%# Eval("ImagePath")%>'/></div>
			  </section>
			  <section id="c_l_fields">
					
                          <div id="c_l_field_area">
                              <div id="c_l_label">ID :</div>
                              <div id="c_l_field" class="style4"><asp:Label ID="noLbl" runat="server" Text='<%# Eval("ItemId")%>'> </asp:Label>
                              </div>
                          </div>
						  <div id="c_l_field_area">
                              <div id="c_l_label" class="style1">Name :</div>
                              <div id="c_l_field" class="style4"><asp:Label ID="nameLbl" runat="server" Text='<%# Eval("ItemName")%>'> </asp:Label>
                              </div>
                          </div>
						  <div id="c_l_field_area">
                              <div id="c_l_label">Price :</div>
                              <div id="c_l_field" class="style4">Rs.<asp:Label ID="priceLbl" runat="server" Text='<%# Eval("BilledRate")%>'> </asp:Label>
                              </div>
                          </div>
                          <div id="c_l_field_area">
                              <div id="c_l_label">Total :</div>
                              <div id="c_l_field" class="style4">Rs. <asp:Label ID="rateLbl" runat="server" Text='<%# Eval("TotalRate")%>'> </asp:Label>
                              </div>
                          </div>
					
			  </section>
            </aside>
            <!--Cart items img CL End-->
            <!--Cart items Quantity CL Start-->
            <aside id="c_l_cl3">
              <div id="c_l_form">
              <asp:TextBox  ID="qtyTxt" runat="server" CssClass="c_l_form_style" Text='<%# Eval("Qty")%>'></asp:TextBox>
               </div>
            </aside>
            <!--Cart items Quantity CL End-->
            
            <!--Cart items Edit CL Start-->
            <aside id="c_l_cl5">
              <div id="c_l_edit"> <asp:LinkButton ID="updateBtn" runat="server" CssClass="c_l_links" CommandArgument = '<%# Eval("ItemId")%>' CommandName ="UpdateItem" >Update</asp:LinkButton>
                        </div>
              <div id="c_l_edit"> <asp:LinkButton ID="deleteBtn" runat="server" CssClass="c_l_links" CommandArgument = '<%# Eval("ItemId")%>' CommandName ="RemoveItem" >Remove</asp:LinkButton>
                        </div>
            </aside>
            <!--Cart items Edit CL End-->
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