<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="budhashop.UserControls.login" %>

<style type="text/css">
    
    .logintext
    {
    	float:right;
    	width:55px;
    	height:20px;
        background: #ac1812;
        font-family: "Courier New" , Courier, monospace;
        font-size: 16px;
        color: #d67d1c;
        font-weight: bold;
        text-decoration: none;
        padding: 6px 10px 5px 11px;
        border-radius:3px;
         display:none;
        
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
    	margin:3px 45px 0px 0px;
    	float:right;
    	width:auto;
    	height:20px;
        background: #f38d10;
        font-family: "Courier New" , Courier, monospace;
        font-size: 14px;
        color: White;
        font-weight: bold;
        text-decoration: none;
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        padding: 5px 12px 6px;
    }
    .usertext:hover
    {
       width:auto;
        color: White;
        font-weight: bold;
        text-decoration: none;
        padding: 5px 12px 6px;
        background: -webkit-gradient(linear, 0 0, 0 bottom, from(#f38d10), to(#d67d1c));
    background: -moz-linear-gradient(#f38d10, #d67d1c);
    background: linear-gradient(#f38d10, #d67d1c);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#f38d10, endColorstr=#d67d1c);
    
    border-radius:3px;
    }
      
</style>


<script type="text/javascript">

         $(document).ready(function(){
                        $("#closeimg1").hide();
                        var usersession='<%= this.Session["currentuser"] %>';
                        if(usersession)
                            {
                                budhashop.USER.Services.LoginControl.Getuser(OnSuccess, onerror);
                            }
                        else
                            {
                               $("#login-success").hide();
                               $(".logintext").removeClass("usertext");
                               $(".logintext").show();
                               
                            }
                        
                        $(".logintext").click(function(e) {          
				        e.preventDefault();
                        $("#user-status").slideToggle();
                        $(".logintext").hide();
                        $("#closeimg1").show();
                        });
                        
                        $("#closeimg1").click(function(e) {          
				        e.preventDefault();
                        $("#user-status").slideToggle();
                        $(".logintext").show();
                        $("#closeimg1").hide();
                        });
                        
          });
          
          function checkLogin1() {
              var email = $("[id$=txt_emailid1]").val();
              var pwd = $("[id$=txt_pwd1]").val();
              var emailFormat = (/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
              if(email=="Email ID..."){$("[id$=lbl_result1]").text("Enter Email Id");  $("[id$=txt_emailid1]").focus(); }
              else if(email.match(emailFormat)==null){$("[id$=lbl_result1]").text("Enter Valid Email Id");  $("[id$=txt_emailid1]").focus();}
              else if(pwd==""){$("[id$=lbl_result1]").text("Enter Password");   $("[id$=txt_pwd1]").focus();   }
              else
              {
                $("#preloader").show();
                budhashop.USER.Services.LoginControl.LoginUser(email, pwd, OnSuccess, onerror);
              }
            }
         function OnSuccess(result) {
                $("#preloader").hide();
                if(result!="nouser")
                {
                    $("[id$=txt_emailid1]").val('');
                    $("[id$=txt_pwd1]").val('');
                    $("#login-required").hide();
                    $("#login-success").show();
                    $(".logintext").toggleClass("usertext");
                    $("#logintext").html(result);
                    $("#closeimg1").hide();
                     $(".logintext").hide();
//                    window.location.assign(window.location.href);
//                    document.location.reload(true);
                }
                else
                {
                   $("[id$=lbl_result1]").text('Wrong Email Id/Password');
                } 
            }
         
        function onerror(result){
            $("#preloader").hide();
            alert("Error calling service method.");
            }
         
         
</script>

<body>

<div style="width: 350px;">
       
    <div  id="user-status" style="display:none;">
    <!--Login Start-->
        <div id="login-required">
            <div id="l_f_bg" class="bg_style2">
            <div id="login_form">
            <asp:TextBox ID="txt_emailid1" CssClass="login_form_style" runat="server" Text="Email ID..."
                onfocus="if(this.value=='Email ID...')this.value='';" onblur="if(this.value=='')this.value='Email ID...';"></asp:TextBox>
            </div>
             <div id="login_form">
            <asp:TextBox ID="txt_pwd1" CssClass="login_form_style" runat="server" TextMode="Password" placeholder="Password..."></asp:TextBox>
            </div>
            
            <div id="go_but"  style="float:left;">
            
        	<a href="#" id="btn_login1" class="l_go" onclick="return checkLogin1();" >Go
                <%--<input id="btn_login1" type="button" value="Go" onclick="return checkLogin1();" />--%></a>
                
             </div>   
               <div id="login_links">
            
            <asp:HyperLink ID="hyplink_forgotpwd" CssClass="l_links" runat="server" 
                NavigateUrl="~/USER/ForgotPassword.aspx">Forgot Password?</asp:HyperLink>
            
            <asp:HyperLink ID="hyplink_register" CssClass="l_links" runat="server" 
                NavigateUrl="~/USER/Login_Register.aspx">Register</asp:HyperLink>
            
            <br />
            
            <asp:Label ID="lbl_result1" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </div> 
        </div>
        
            
            
           
        </div>
    <!--Login End-->  
      
        
        <div style="width:auto; float:right; cursor:pointer;">
        <img id="closeimg1" alt="FeedBack" src="../images/unavailable.png" />
        </div>
        
    </div>
    <a id="logintext" class="logintext" href="#">LogIn</a> 
    <%--<asp:LinkButton ID="logintext" CausesValidation="false" class="logintext" runat="server">LogIn</asp:LinkButton>--%>
   <div id="login-success" style="display:none;">
        <div id="logout_links" class="bg_style2" style="width:120px; height:20px; margin-left:235px;">        
            <asp:LinkButton ID="lb_profile" CssClass="l_links" runat="server" onclick="lb_profile_Click">Profile</asp:LinkButton>
            
            <%--<asp:LinkButton ID="lb_orderhistory" CssClass="l_links" runat="server" 
                onclick="lb_orderhistory_Click">Order History</asp:LinkButton>--%>
            
            <asp:LinkButton ID="lb_logout" CssClass="l_links" runat="server" onclick="lb_logout_Click">Logout</asp:LinkButton>
            </div>
        </div>
    
</div>
 
</body>