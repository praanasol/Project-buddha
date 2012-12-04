<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedbackControl.ascx.cs" Inherits="budhashop.UserControls.FeedbackControl" %>

<%--<script src="../script/jquery-1.8.2.js" type="text/javascript"></script>
<script src="../script/jquery-ui-1.8.custom.min.js" type="text/javascript"></script>
--%>
<body>

   
    <style type="text/css">
        .feedback
        {
        	
    	    position:fixed;
    	    left:0%;
    	    bottom:0%;
    	    font-family:Arial;
	    font-size:14px;
	    color:#ac7713;
	    font-weight:bold;
	    text-decoration:none;
	    padding:5px;
    	
        }
         .feedback-body
        {
        	
    	    width:auto; 
    	    float:left;
    	    position:fixed;
    	    left:-21%;
    	    bottom:0%;
    	    font-family:Arial, Helvetica, sans-serif;
		    font-size:12px;
		    color:#512912;
		    
		    
    	    background:#E8B048;
	    border:#f4b01b 1px solid;
	    border-radius:5px;
	    -moz-box-shadow:inset 0px 0px 10px 3px #ac7713;
-webkit-box-shadow:inset 0px 0px 10px 3px #ac7713;
box-shadow:inset 0px 0px 10px 3px #ac7713;
	     z-index:1009
        	
        }
        .f_form_style{
	    margin:0px;
	    padding-left:5px;
	    width:200px;
	    height:18px;
	    font-family:Arial, Helvetica, sans-serif;
	    font-size:13px;
	    color:#364700;
	    font-weight:bold;
	    background:#e7cd73;
	    border:#dc8d53 solid 2px;
	    border-radius:5px;
    }
    </style>
    
     <script src="../script/FeedbackControl.js" type="text/javascript"></script>

<div id="feedback" class="feedback">
    
   <div style="height:30px;width:75px; float:right; cursor:pointer;"><a id="img_fb" alt="Feedback">Feedback</a>
        <%--<img id="img_fb" alt="FeedBack" src="../images/feedback-vertical.jpg" style="height:24px; width:74px" />--%>
    </div><br />
    
    
</div>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    <div id="feedback-body" class="feedback-body" >
        <div style="width:auto; float:right; cursor:pointer;">
        <img id="closeimg" alt="FeedBack" src="../images/close.png" />
        </div>
        <br />
        <section id="login_header" style="margin-top:-15px; margin-bottom:5px; width:200px; height:20px; font-size:12px; text-align:center;" />
                    <h3 >
                        Feedback</h3>
                </section>
        <p style="margin-left:10px;">Enter Your Email Id:</p>
        <%--<asp:RequiredFieldValidator ID="rfv_emailfb" runat="server" 
            ControlToValidate="txt_emailfb" ErrorMessage="*" SetFocusOnError="True" 
            ToolTip="Email Can not be Empty" ValidationGroup="feedback"></asp:RequiredFieldValidator>--%>
        <asp:TextBox ID="txt_emailfb" CssClass="f_form_style" runat="server" Width="180px"></asp:TextBox>
        <br />
        <asp:Label ID="lbl_emailfb" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
        <%--<asp:RegularExpressionValidator ID="rev_emailfb" runat="server" 
            ControlToValidate="txt_emailfb" ErrorMessage="Enter Valid Email Id" 
            SetFocusOnError="True" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ValidationGroup="feedback"></asp:RegularExpressionValidator>
        <br />--%>
        <p style="margin-left:10px;">Message:</p>
        <%--<asp:RequiredFieldValidator ID="rfv_msg" runat="server" 
            ControlToValidate="txt_msg" ErrorMessage="*" SetFocusOnError="True" 
            ToolTip="Message can not be Empty" ValidationGroup="feedback"></asp:RequiredFieldValidator>--%>
        <asp:TextBox ID="txt_msg" CssClass="f_form_style" Width="180px" Height="40" runat="server" TextMode="MultiLine" 
            ValidationGroup="feedback"></asp:TextBox>
        <br />
        <asp:Label ID="lbl_msg" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
        <%--<asp:RegularExpressionValidator ID="rev_msg" runat="server" 
            ControlToValidate="txt_msg" ErrorMessage="Should not exeed 50 characters" 
            SetFocusOnError="True" ValidationExpression="(\s|.){1,50}" 
            ValidationGroup="feedback"></asp:RegularExpressionValidator>--%>
        <br />
         <div id="but_style" style="margin:0px 0px 10px 10px;">
        <button type="button" id="btn_submitFb" class="l_go" onclick="Fb_Submit();" runat="server">Submit</button>
        <%--<asp:Button ID="btn_submitFb" CssClass="l_go" runat="server" Text="Submit" 
            ValidationGroup="feedback" OnClientClick="return Fb_Submit();" />--%>
            </div>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <div id="submittedFbDiv" style="display:none; padding:10px; position:fixed; top:68%; left:3%; border:solid 2px; font-size:12px; background:#E8B048; border-radius:10px;">
        <div id="successFb-body">
            <p>Feedback Submitted Succesfully.</p>
            <p>Thank you.</p>
        </div>
        <div id="failureFb-body">
            <p>Error Submitting Feedback</p>
            <p>Please Try Again...</p>
        </div>
    </div>
</body>