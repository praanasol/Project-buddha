<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedbackControl.ascx.cs" Inherits="budhashop.UserControls.FeedbackControl" %>

<%--<script src="../script/jquery-1.8.2.js" type="text/javascript"></script>
<script src="../script/jquery-ui-1.8.custom.min.js" type="text/javascript"></script>
--%>
<style type="text/css">
    .feedback
    {
    	
    	position:fixed;
    	right:0%;
    	bottom:0%;
    }
     .feedback-body
    {
    	
    	width:auto; 
    	float:left;
    	position:fixed;
    	right:-21%;
    	bottom:0%;
    	
    }
</style>

<script type="text/javascript">
    $(document).ready(function(){
        $("#img_fb").click(function(e) {
          
            
                //$(".feedback-body").show();
                $(".feedback-body").animate({right:"0%"});
                 $("#feedback").hide();
                 e.stopPropagation();
           
        });
        $(document).click(function(e) {
            $(".feedback-body").animate({right:"-21%"});
            $("#feedback").show();
            e.stopPropagation();
            //$(".feedback-body").hide();
             
        });
        $("#feedback-body").click(function(e){
            e.stopPropagation();
        });
        $("#closeimg").click(function(e){
            $(".feedback-body").animate({right:"-21%"});
            $("#feedback").show();
        });
    });
</script>

<body>

    
<div id="feedback" class="feedback">
    
   <div style="width:120px; float:right; cursor:pointer;">
        <img id="img_fb" alt="FeedBack" src="../images/feedback-vertical.jpg" style="height:35px; width:120px" />
    </div><br />
    
    
</div>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    <div id="feedback-body" class="feedback-body" >
        <div style="width:auto; float:left; cursor:pointer;">
        <img id="closeimg" alt="FeedBack" src="../images/unavailable.png" />
        </div>
        <br />
        Enter Your Email Id:<br />
        <asp:RequiredFieldValidator ID="rfv_emailfb" runat="server" 
            ControlToValidate="txt_emailfb" ErrorMessage="*" SetFocusOnError="True" 
            ToolTip="Email Can not be Empty" ValidationGroup="feedback"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txt_emailfb" runat="server" Width="178px"></asp:TextBox>
        <br />
        <asp:RegularExpressionValidator ID="rev_emailfb" runat="server" 
            ControlToValidate="txt_emailfb" ErrorMessage="Enter Valid Email Id" 
            SetFocusOnError="True" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ValidationGroup="feedback"></asp:RegularExpressionValidator>
        <br />
        Message:<br />
        <asp:RequiredFieldValidator ID="rfv_msg" runat="server" 
            ControlToValidate="txt_msg" ErrorMessage="*" SetFocusOnError="True" 
            ToolTip="Message can not be Empty" ValidationGroup="feedback"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txt_msg" runat="server" TextMode="MultiLine" 
            ValidationGroup="feedback"></asp:TextBox>
        <br />
        <asp:RegularExpressionValidator ID="rev_msg" runat="server" 
            ControlToValidate="txt_msg" ErrorMessage="Should not exeed 50 characters" 
            SetFocusOnError="True" ValidationExpression="(\s|.){1,50}" 
            ValidationGroup="feedback"></asp:RegularExpressionValidator>
        <br />
        <asp:Button ID="btn_submitFb" runat="server" Text="Submit" 
            ValidationGroup="feedback" />
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
</body>