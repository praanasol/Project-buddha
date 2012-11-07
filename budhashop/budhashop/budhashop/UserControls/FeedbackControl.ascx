<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeedbackControl.ascx.cs" Inherits="budhashop.UserControls.FeedbackControl" %>

<script src="../script/jquery-1.8.2.js" type="text/javascript"></script>
<script src="../script/jquery-ui-1.8.custom.min.js" type="text/javascript"></script>

<script type="text/javascript">
    $(document).ready(function(){
        $(".left").click(function(e) {          
            $(".left").toggleClass("right");
            $("#feedback").animate({left:"0%"});
        });
        $(".right").click(function(e) {          
            $(".right").removeClass("right");
            $("#feedback").animate({left:"-14%"});
        });
    });
</script>

<body>
<div id="feedback" style="position:fixed; top:30%; left:-14%">
    <div id="feedback-body" style="width:auto; float:left;">
        Enter Your Email Id:<br />
        <asp:RequiredFieldValidator ID="rfv_emailfb" runat="server" 
            ControlToValidate="txt_emailfb" ErrorMessage="*" SetFocusOnError="True" 
            ToolTip="Email Can not be Empty" ValidationGroup="feedback"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txt_emailfb" runat="server" Width="180px"></asp:TextBox>
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
        <asp:RangeValidator ID="rv_msg" runat="server" ControlToValidate="txt_msg" 
            ErrorMessage="Can not exeed 50 characters" MaximumValue="50" MinimumValue="1" 
            SetFocusOnError="True" ValidationGroup="feedback"></asp:RangeValidator>
        <br />
        <asp:Button ID="btn_submitFb" runat="server" Text="Submit" 
            ValidationGroup="feedback" />
    </div>
    
    <div style="width:auto; float:left; cursor:pointer;">
        <img class="left" id="img_fb" alt="FeedBack" src="../images/feedback-vertical.png" style="height: 164px; width: 41px" />
    </div>
</div>
</body>