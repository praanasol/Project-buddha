<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="budhashop.UserControls.login" %>

<style type="text/css">

    .style5
    {
        width: 100%;
        background-color: #66FFFF;
    }
    .style35
    {
    	padding-left:20px;
    }
    .style37
    {
        width: 176px;
    }
    .style38
    {
    }
    .style39
    {
    }
    .style41
    {
    }
</style>

<style type="text/css">
    #login
    {	
        font-family: "Courier New" , Courier, monospace;
        font-size: 23px;
        color: #364700;
        font-weight: bold;
        text-decoration: none;
    }
    	
    #login_menu
    {
        display: none;
        position: absolute;
        width:420px;
        height:50px;
        right: 80px;
        background-color:Aqua;
    }
    .style42
    {
        width: 7px;
    }
</style>

<script src="../script/jquery-1.8.2.js" type="text/javascript"></script>
<script>

$(document).ready(function() {
            
            $(".login").click(function() {     			
                $("fieldset#login_menu").toggle("slow");
            });			
						 
			$("fieldset#login_menu").mouseup(function() {
				return false
			});			
			
			$(document).mouseup(function(e) {
				if($(e.target).parent("a.login").length==0) {
					$("fieldset#login_menu").hide();
				}
			});
			
			$("#btn_lclr").click(function(){
			    $("[id$=txt_lusername]").val('');
			    $("[id$=txt_lpassword]").val('');
                });
        });
         
</script>
<body>

<div>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <a id="login" class="login" href="#" target="_self">LogIn</a>
    
    <fieldset id="login_menu">
        
            <aside>
                
                    <asp:Label ID="lbl_status" runat="server" 
                        style="font-weight: 700; color: #009933"></asp:Label>&nbsp;
                    <asp:LinkButton ID="lb_logout" runat="server" Visible="False" 
                        onclick="lb_logout_Click">Logout</asp:LinkButton>
                
           
            
                
                    <asp:Label ID="lbl_uname" runat="server" ForeColor="Red" Text="*"></asp:Label>
              
                
                <asp:TextBox ID="txt_lusername" Text="UserName/EmailId"
                                            onfocus="if(this.value=='UserName/EmailId')this.value='';"
                                            onblur="if(this.value=='')this.value='UserName/EmailId';"
                                            runat="server" Width="181px"></asp:TextBox>
                
                
            
                
                <asp:TextBox ID="txt_lpassword" Text="Password"
                                            onfocus="if(this.value=='Password'){this.value=''};"
                                            onblur="if(this.value=='')this.value='Password';"
                                            runat="server" Width="181px"></asp:TextBox>
                
                
                    
                <asp:Button ID="btn_login" runat="server" Text="Go" 
                    onclick="btn_login_Click" />
                    </aside>
                
                <%--<td>
                <input type="button" id="btn_lclr" value="Clear" />
                </td>--%>
                
            
           <aside>
                
                <asp:HyperLink ID="hl_forgotpwd" runat="server" 
                    NavigateUrl="~/USER/ForgotPassword.aspx">Forgot Password?</asp:HyperLink>
               
                
                <asp:HyperLink ID="hl_register" runat="server" 
                    NavigateUrl="~/USER/Login_Register.aspx">Register</asp:HyperLink>
               
                
                    <asp:Label ID="lbl_pwd" runat="server" ForeColor="Red" Text="*"></asp:Label>
                
                <asp:Label ID="lbl_login" runat="server" ForeColor="Red"></asp:Label>
                </aside>
                
        
    </fieldset>
</div>


