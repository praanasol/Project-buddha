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
    width: 350px;
    height: 300px;
    border: 1px solid black;
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
        background: #ecd891;
        padding: 4px 6px 6px;
        font-family: "Courier New" , Courier, monospace;
        font-size: 16px;
        color: #363635;
        font-weight: bold;
        text-decoration: none;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        padding: 4px 12px 6px;
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
        top: 15px;
        left: 120px;
        width: 23px;
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
        background: #3d3d3c;
        padding: 4px 6px 6px;
        font-family: "Courier New" , Courier, monospace;
        font-size: 16px;
        color: #ffffff;
        font-weight: bold;
        text-decoration: none;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        padding: 4px 12px 6px;
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
        background: #000000 !important;
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
        background-color: #cccccc;
        display: none;
        position: absolute;
        width: 300px;
        height: 400px;
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

      
                 
            $(".signin").click(function(e) {          
				e.preventDefault();
				
                $("fieldset#signin_menu").toggle();
				$(".signin").toggleClass("menu-open");
				
			
				
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
<div id="topnav1" >

    <asp:LinkButton ID="signin" CausesValidation="false" class="signin" runat="server">Show</asp:LinkButton>
        
    <fieldset id="signin_menu">
    
        <asp:Label ID="errorLbl" runat="server" Text="No items in cart!" Font-Bold="true"
        ></asp:Label>
        <!--Full Page Details Start-->
        <asp:Label ID="noOfItemsLbl" runat="server" Text="Items: 0"></asp:Label>
        <asp:Label ID="totalLbl" runat="server" Text="Total: 0"></asp:Label>
        <asp:Button ID="orderBtn" runat="server" Text="Order Items" />
        <asp:Button ID="hideCartBtn" runat="server" Text="Hide" />
        <asp:HiddenField ID="hdnUserId" runat="server"/>
       
       
      <%--  <asp:Panel ID="itempanel" runat="server" CssClass="scroll-pane" Height="300" Width="350" BorderStyle="Solid" BorderColor="Black" ScrollBars="Vertical"> --%>                                                                              
       <div id="chatlist" class="mousescroll">
        <asp:DataList ID="itemCartDL" runat="server" RepeatDirection="Vertical" DataKeyField="ItemId" OnItemCommand ="itemCartDL_ItemCommand">
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
                        <asp:LinkButton ID="Delete" runat="server">Delete</asp:LinkButton>
                        </div>
                     </aside>
                </div>
            </ItemTemplate>
        </asp:DataList>
        </div>
       <%-- </asp:Panel>--%>
       
      
   
    
        <!--Full Page Details End-->
         
    </fieldset>
    
</div>

