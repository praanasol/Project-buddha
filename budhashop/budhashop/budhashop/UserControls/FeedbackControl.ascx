<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedbackControl.ascx.cs" Inherits="budhashop.UserControls.FeedbackControl" %>

<%--<script src="../script/jquery-1.8.2.js" type="text/javascript"></script>
<script src="../script/jquery-ui-1.8.custom.min.js" type="text/javascript"></script>
--%>
<body>

    <script src="../script/FeedbackControl.js" type="text/javascript"></script>

    <style type="text/css">
        .feedback
        {
        	
    	    position:fixed;
    	    right:0%;
    	    bottom:0%;
    	    font-family:Arial;
	    font-size:14px;
	    color:#7ca831;
	    font-weight:bold;
	    text-decoration:none;
    	
        }
         .feedback-body
        {
        	
    	    width:auto; 
    	    float:left;
    	    position:fixed;
    	    right:-21%;
    	    bottom:0%;
    	    font-family:Arial, Helvetica, sans-serif;
		    font-size:14px;
		    color:#364700;
		    font-weight:bold;
    	    background:#f5c45a;
	    border:#f4b01b 1px solid;
	    border-radius:5px;
	    -moz-box-shadow:0px 0px 2px 2px #d6a163;
-webkit-box-shadow:0px 0px 2px 2px #d6a163;
box-shadow:0px 0px 2px 2px #d6a163;
	    
        	
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
    
    
<div id="feedback" class="feedback">
    
   <div style="height:30px;width:75px; float:right; cursor:pointer;"><a id="img_fb" alt="Feedback">Feedback</a>
        <%--<img id="img_fb" alt="FeedBack" src="../images/feedback-vertical.jpg" style="height:24px; width:74px" />--%>
    </div><br />
    
    
</div>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    <div id="feedback-body" class="feedback-body" >
        <div style="width:auto; float:left; cursor:pointer;">
        <img id="closeimg" alt="FeedBack" src="../images/unavailable.png" />
        </div>
        <br />
        <section id="login_header" style="margin-top:-15px; margin-bottom:5px; width:200px; height:20px; font-size:14px; text-align:center;" />
                    <h3 style="color:#4d6012;">
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
        <button type="button" id="btn_submitFb" class="l_go" onclick="Fb_Submit();">Submit</button>
        <%--<asp:Button ID="btn_submitFb" CssClass="l_go" runat="server" Text="Submit" 
            ValidationGroup="feedback" OnClientClick="return Fb_Submit();" />--%>
            </div>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <div id="submittedFbDiv" style="display:none; position:fixed; top:68%; right:0%; border:solid 1px; font-size:18px; background:#FE7E28">
        <div id="successFb-body">
            <p>Feedback Submitted Succesfully</p>
            <p>Thank you...</p>
        </div>
        <div id="failureFb-body">
            <p>Error Submitting Feedback</p>
            <p>Please Try Again...</p>
        </div>
    </div>
</body>