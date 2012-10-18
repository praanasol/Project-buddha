<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Register.ascx.cs" Inherits="budhashop.UserControls.Register" %>

<script type="text/javascript">

   function checkEmail() {
      $("[id$=lbl_result2]").text("");
      var email = $("[id$=txt_emailid2]").val();
      var pwd = $("[id$=txt_pwd2]").val();
      var confirmpwd = $("[id$=txt_confirmpwd2]").val();
      var emailFormat = (/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
      if(email==""){$("[id$=lbl_result2]").text("Enter Email Id"); $("[id$=txt_emailid2]").focus();}
      else if(email.match(emailFormat)==null){$("[id$=lbl_result2]").text("Enter Valid Email Id");  $("[id$=txt_emailid2]").focus();}
      else if(pwd==""){$("[id$=lbl_result2]").text("Enter Password");   $("[id$=txt_pwd2]").focus();}
      else if(pwd.length < 5){$("[id$=lbl_result2]").text("Password Should Contain atleast 5 Characters");   $("[id$=txt_pwd2]").focus();}
      else if(pwd != confirmpwd){$("[id$=lbl_result2]").text("Passwords Do not Match");   $("[id$=txt_confirmpwd2]").focus();}
      else
      {
        budhashop.USER.Services.LoginControl.RegisterUser(email, pwd, OnCompleted, onerror);
      }
     }
        
    function OnCompleted(result) {
        var result1=false;
        result1=eval(result);
        
            if(result1)
            {
                $("[id$=txt_username2]").val('');
                $("[id$=txt_emailid2]").val('');
                $("[id$=txt_pwd2]").val('');
                $("[id$=lbl_result2]").text('');
                $("#overlay").hide();
                $("#dialog").hide();
                window.location="../USER/AddressPage.aspx";
            }
            else
            {
               $("[id$=lbl_result2]").text('Email Id Already Exists in our Databse');
            } 
        }
         
    function onerror(result){
        alert("Error calling service method.");
        }        
</script>

<table id="RegisterControl">
    <tr>
        <td style="text-align: center" colspan="2">
            New User Registration</td>
    </tr>
    <tr>
        <td style="text-align: center">Email Id:</td>
        <td style="text-align: center">
    <asp:TextBox ID="txt_emailid2" runat="server" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            Password:</td>
        <td style="text-align: center">
    <asp:TextBox ID="txt_pwd2" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            Confirm Password:</td>
        <td style="text-align: center">
    <asp:TextBox ID="txt_confirmpwd2" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: center" colspan="2">
    <input id="btn_register" type="button" value="Register" onclick="return checkEmail();" />
        </td>
    </tr>
    <tr>
        <td style="text-align: center" colspan="2">
    <a href="#" id="hyplink_login">Login</a></td>
    </tr>
    <tr>
        <td style="text-align: center" colspan="2">
    <asp:Label ID="lbl_result2" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
        </td>
    </tr>
</table>
