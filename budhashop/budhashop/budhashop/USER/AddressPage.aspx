<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true" CodeBehind="AddressPage.aspx.cs" Inherits="budhashop.USER.AddressPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div id="adressDiv" runat="server" visible="true">
        <table style="width:auto;">
            <tr>
                <td>
                    Email Id:</td>
                <td></td>
                <td>
                    <asp:TextBox ID="txt_emailid" runat="server" Width="180px" ReadOnly="True"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    Name:</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="*" 
                        ControlToValidate="txt_uname" SetFocusOnError="True" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txt_uname" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    Phone Num:</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" 
                        ControlToValidate="txt_phno" ErrorMessage="*" SetFocusOnError="True" 
                        ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txt_phno" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txt_phno" ErrorMessage="Enter Valid 10 digit Mobile Number" 
                        SetFocusOnError="True" ValidationExpression="\d{10}" ValidationGroup="1"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Address:</td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv3" runat="server" 
                        ControlToValidate="txt_address" ErrorMessage="*" SetFocusOnError="True" 
                            ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:TextBox ID="txt_address" runat="server" TextMode="MultiLine" Width="180px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:Label ID="lbl_status" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
            <p>Change my Profile with above details <asp:CheckBox ID="cb_profilechange" runat="server" /></p>
        <asp:Button ID="ConfirmBtn" runat="server" Text="Confirm" OnClick="ConfirmBtn_Click" ValidationGroup="1" />
        </div>
        <div id="cartData">
        <asp:GridView ID="cartDataGV" runat="server" Visible="false">
        
        </asp:GridView>
        
        </div>
<asp:HiddenField ID="totalHidden" runat="server" />
</asp:Content>

