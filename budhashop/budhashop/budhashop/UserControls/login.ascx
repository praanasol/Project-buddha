<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="budhashop.UserControls.login" %>

<style type="text/css">
    
    .logintext
    {
    	float:right;
    	width:55px;
    	height:20px;
        background: #f39112;
        font-family: "Courier New" , Courier, monospace;
        font-size: 16px;
        color: #364700;
        font-weight: bold;
        text-decoration: none;
        
        padding: 6px 10px 5px 11px;
        border-radius:3px;
    }
    .logintext:hover
    {
        
        color: #8f0a05;
        font-weight: bold;
        text-decoration: none;
         padding: 6px 10px 5px 11px;
        background: -webkit-gradient(linear, 0 0, 0 bottom, from(#f38d10), to(#d67d1c));
    background: -moz-linear-gradient(#f38d10, #d67d1c);
    background: linear-gradient(#f38d10, #d67d1c);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#f38d10, endColorstr=#d67d1c);
    
    border-radius:3px;
    }
    .usertext
    {
    	float:right;
        background: Green;
        font-family: "Courier New" , Courier, monospace;
        font-size: 14px;
        color: White;
        font-weight: bold;
        text-decoration: none;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        padding: 4px 12px 6px;
    }
    .usertext:hover
    {
        background: #f39112;
        color: White;
        font-weight: bold;
        text-decoration: none;
        padding: 4px 12px 6px;
    }
      
</style>


<script type="text/javascript">

         $(document).ready(function(){
         
                        var usersession='<%= this.Session["currentuser"] %>';
                        if(usersession)
                            { 
                                $("#login-required").hide();
                                $(".logintext").toggleClass("usertext");
                                
                            }
                        else
                            {
                               $("#login-success").hide();
                               $(".logintext").removeClass("usertext");
                            }
                        
                        $(".logintext").click(function(e) {          
				        e.preventDefault();
                        $("#user-status").slideToggle();
                        });
          });
          
          function checkLogin1() {
              var email = $("[id$=txt_emailid1]").val();
              var pwd = $("[id$=txt_pwd1]").val();
              var emailFormat = (/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
              if(email==""){$("[id$=lbl_result1]").text("Enter Email Id");  $("[id$=txt_emailid1]").focus(); }
              else if(email.match(emailFormat)==null){$("[id$=lbl_result1]").text("Enter Valid Email Id");  $("[id$=txt_emailid1]").focus();}
              else if(pwd==""){$("[id$=lbl_result1]").text("Enter Password");   $("[id$=txt_pwd1]").focus();   }
              else
              {
                budhashop.USER.Services.LoginControl.LoginUser(email, pwd, OnSuccess, onerror);
              }
            }
         function OnSuccess(result) {
            var result1=false;
            result1=eval(result);
                if(result1)
                {
                    $("[id$=txt_emailid1]").val('');
                    $("[id$=txt_pwd1]").val('');
//                    window.location.assign(window.location.href);
                    document.location.reload(true);
                }
                else
                {
                   $("[id$=lbl_result1]").text('Wrong Email Id/Password');
                } 
            }
         
        function onerror(result){
            alert("Error calling service method.");
            }
         
         
</script>

<body>

<div style="width: 350px;">
        
    <div  id="user-status" style="background-color: #99FF99; display:none;" >
        <div id="login-required">
        
            <asp:TextBox ID="txt_emailid1" runat="server" placeholder="Enter EmailId" Width="140px"></asp:TextBox>
            
            <asp:TextBox ID="txt_pwd1" runat="server" TextMode="Password" placeholder="Enter Password" Width="140px"></asp:TextBox>
            
            <input id="btn_login1" type="button" value="Go" onclick="return checkLogin1();" />
            
            <br />
            
            <asp:HyperLink ID="hyplink_forgotpwd" runat="server" 
                NavigateUrl="~/USER/ForgotPassword.aspx">Forgot Password?</asp:HyperLink>
            
            <asp:HyperLink ID="hyplink_register" runat="server" 
                NavigateUrl="~/USER/Login_Register.aspx">Register</asp:HyperLink>
            
            <br />
            
            <asp:Label ID="lbl_result1" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            
        </div>
        
        <div id="login-success">
            
            <asp:LinkButton ID="lb_profile" runat="server" onclick="lb_profile_Click">Profile -&gt;</asp:LinkButton>
            <br />
            <asp:LinkButton ID="lb_orderhistory" runat="server" 
                onclick="lb_orderhistory_Click">Order History -&gt;</asp:LinkButton>
            <br />
            <asp:LinkButton ID="lb_logout" runat="server" onclick="lb_logout_Click">Logout -&gt;</asp:LinkButton>
            
        </div>
    </div>
    
    <asp:LinkButton ID="logintext" CausesValidation="false" class="logintext" runat="server">LogIn</asp:LinkButton>
    
</div>
</body>