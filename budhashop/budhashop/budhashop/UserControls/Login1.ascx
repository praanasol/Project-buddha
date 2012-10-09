<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login1.ascx.cs" Inherits="budhashop.UserControls.Login1" %>

<style type="text/css">
    .style1
    {
        text-align: center;
    }
</style>

<script src="../script/jquery-1.8.2.js" type="text/javascript"></script>
<script type="text/javascript">

   function checkLogin() {
      var email = $("[id$=txt_emailid]").val();
      var pwd = $("[id$=txt_pwd]").val();
      if(email==""){alert("Enter Email Id");}
      else if(pwd==""){alert("Enter Password");}
      else
      {
        budhashop.USER.Services.LoginControl.LoginUser(email, pwd, OnSucceeded, onerror);
      }
     }
        
    function OnSucceeded(result) {
        $("[id$=lbl_result]").text(result);
        var usersession='<%= this.Session["currentuser"] %>';
            if(usersession != "")
            {
                $("[id$=txt_emailid]").val('');
                $("[id$=txt_pwd]").val('');
                $("#overlay").hide();
                $("#dialog").hide();
//                document.write("You will be redirected to our main page in 5 seconds!");
//                setTimeout('Redirect()', 5000);
//                Redirect();
            }
        }
         
    function onerror(result){
        alert("Error calling service method.");
        }
    
//    function Redirect() {
//        window.location="../USER/AddressPage.aspx";
//        }        
</script>

<body>

    <table id="LoginControl" class="style1">
        <tr>
            <td colspan="3">Login</td>
        </tr>
        <tr>
            <td>Email Id:</td>
            <td>
                <asp:Label ID="lbl_emailid" runat="server" Font-Bold="False" ForeColor="Red" 
                    Text="*" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_emailid" runat="server" Width="180px" onfocus="this.BackColor = System.Drawing.Color.Yellow;" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Password</td>
            <td>
                <asp:Label ID="lbl_pwd" runat="server" Font-Bold="False" ForeColor="Red" 
                    Text="*" Visible="False"></asp:Label>
            </td>
            <td>
                 <asp:TextBox ID="txt_pwd" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <%--<asp:Button ID="btn_login" runat="server" Text="LogIn" OnClientClick="checkLogin()" />--%>
                <input id="btn_login" type="button" value="LogIn" onclick="return checkLogin();" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <a href="#" id="hyplink_register">Register</a>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            <asp:Label ID="lbl_result" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </td>
        </tr>
    </table>

</body>