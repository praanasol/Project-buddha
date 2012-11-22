<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="budhashop.UserControls.login" %>


<body>

    <script src="../script/loginControl.js" type="text/javascript"></script>
    
    <style type="text/css">
        .logintext
        {
        	margin-top:22px;
    	    float:right;
    	    width:55px;
    	    height:20px;
            background: #6E1C1C;
            font-family: "Courier New" , Courier, monospace;
            font-size: 16px;
            color: #d67d1c;
            font-weight: bold;
            text-decoration: none;
            padding: 6px 10px 5px 11px;
            border-radius:5px;
            display:none;
            /*border:solid 1px;
            border-top-color:#6E1C1C;
             border-bottom-color:#ac7713;
             border-left-color:#ac7713;
             border-right-color:#ac7713;*/
           
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
            border-radius:5px;
            border:solid 1px;
            border-top-color:#ac7713;
             border-bottom-color:#ac7713;
             border-left-color:#ac7713;
             border-right-color:#ac7713;
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
    
    <script type="text/javascript" language="javascript">
        function controlEnter (obj, event)
        {      
             var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;      
             if (keyCode == 13) {                  
                document.getElementById(obj).click();
                            return false;      
             }      
             else  {
                           return true; 
             } 
        }
    </script>
    
<div style="width: 350px;">
       
    <div  id="user-status" style="display:none; margin-top:18px;">
    <!--Login Start-->
        <div id="login-required">
            <div id="l_f_bg" class="bg_style2">
            <div id="login_form">
            <asp:TextBox ID="txt_emailid1" CssClass="login_form_style" runat="server" Text="Email ID..."
                onfocus="if(this.value=='Email ID...')this.value='';" onblur="if(this.value=='')this.value='Email ID...';"></asp:TextBox>
            </div>
             <div id="login_form">
            <asp:TextBox ID="txt_pwd1" CssClass="login_form_style" runat="server" TextMode="Password" value="      "
                onfocus="if(this.value=='      ')this.value='';" onblur="if(this.value=='')this.value='      ';"></asp:TextBox>
            </div>
            
            <div id="go_but" style="float:left; margin-left:8px;">
            
        	<a href="" id="btn_login1" class="l_go" onclick="return checkLogin1();" runat="server">Go</a>
                <%--<input id="btn_login1" type="button" value="Go" onclick="return checkLogin1();" />--%>
                
             </div>   
               <div id="login_links">
            
            <asp:HyperLink ID="hyplink_forgotpwd" CssClass="l_links" runat="server" 
                NavigateUrl="~/USER/ForgotPassword.aspx">Forgot Password?</asp:HyperLink>
            
            <asp:HyperLink ID="hyplink_register" CssClass="l_links" runat="server" 
                NavigateUrl="~/USER/LoginRegister.aspx">Register</asp:HyperLink>
            
            <br />
            <asp:Label ID="lbl_result1" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
           
           
            </div> 
             <div style="width:auto; float:right;cursor:pointer;">
             
        <img id="closeimg1" alt="close" src="../images/close.png"  />
        </div>
        </div>
        
            
            
           
        </div>
    <!--Login End-->  
      
        
        
        
    </div>
    <a id="logintext" class="logintext" href="#">Login</a> 
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