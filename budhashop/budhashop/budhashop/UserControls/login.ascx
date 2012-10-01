<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="budhashop.UserControls.login" %>

<style type="text/css">

    .style5
    {
        width: 100%;
        background-color: #66FFFF;
    }
    .style35
    {
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
        <table class="style5" id="table_login">
            <tr>
                <td class="style41" colspan="3">
                    <asp:Label ID="lbl_status" runat="server" 
                        style="font-weight: 700; color: #009933"></asp:Label>&nbsp;
                    <asp:LinkButton ID="lb_logout" runat="server" Visible="False" 
                        onclick="lb_logout_Click">Logout</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="style42">
                    <asp:Label ID="lbl_uname" runat="server" ForeColor="Red" Text="*"></asp:Label>
                </td>
                <td class="style37">
                <asp:TextBox ID="txt_lusername" Text="Enter UserName/EmailId"
                                            onfocus="if(this.value=='Enter UserName/EmailId')this.value='';"
                                            onblur="if(this.value=='')this.value='Enter UserName/EmailId';"
                                            runat="server" Width="181px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="style42">
                    <asp:Label ID="lbl_pwd" runat="server" ForeColor="Red" Text="*"></asp:Label>
                </td>
                <td class="style37">
                <asp:TextBox ID="txt_lpassword" Text="Enter Password"
                                            onfocus="if(this.value=='Enter Password'){this.value=''};"
                                            onblur="if(this.value=='')this.value='Enter Password';"
                                            runat="server" Width="181px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="style35" colspan="2">
                <asp:HyperLink ID="hl_forgotpwd" runat="server" 
                    NavigateUrl="~/USER/ForgotPassword.aspx">Forgot Password?</asp:HyperLink>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="style38" colspan="2">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_login" runat="server" Text="Login" 
                    onclick="btn_login_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" id="btn_lclr" value="Clear" />
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="style39" colspan="3">
                <asp:Label ID="lbl_login" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
    </fieldset>
</div>


