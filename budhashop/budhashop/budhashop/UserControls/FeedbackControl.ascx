<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedbackControl.ascx.cs" Inherits="budhashop.UserControls.FeedbackControl" %>

<script src="../script/jquery-1.8.2.js" type="text/javascript"></script>
<script src="../script/jquery-ui-1.8.custom.min.js" type="text/javascript"></script>

<style type="text/css">
    .feedback
    {
    	position:fixed;
    	top:30%;
    	left:-13.7%;
    }
</style>

<script type="text/javascript">
    $(document).ready(function(){
        $("#img_fb").click(function(e) {
            var feedbackoffset = $("#feedback").offset();
            if(feedbackoffset.left<0)
                $(".feedback").animate({left:"0%"});
            else
                $(".feedback").animate({left:"-13.7%"});
        });
        $(document).click(function(e) {
            $(".feedback").animate({left:"-13.7%"});
        });
        $(".feedback").click(function(e){
            e.stopPropagation();
        });
    });
</script>

<body>
<div id="feedback" class="feedback">
    <div id="feedback-body" style="width:auto; float:left;">
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
    
    <div style="width:auto; float:left; cursor:pointer;">
        <img id="img_fb" alt="FeedBack" src="../images/feedback-vertical.jpg" style="height:120px; width:35px" />
    </div>
</div>
</body>