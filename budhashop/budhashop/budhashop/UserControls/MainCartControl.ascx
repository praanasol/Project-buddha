<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainCartControl.ascx.cs" Inherits="budhashop.UserControls.MainCartControl" %>
<asp:Label ID="noOfItemsLbl" runat="server" Text=""></asp:Label>
<asp:Label ID="totalLbl" runat="server" Text=""></asp:Label>
<asp:Button ID="orderBtn" runat="server" Text="Order Items" />
<asp:Button ID="hideCartBtn" runat="server" Text="Hide" />
 <asp:UpdatePanel ID="upData" runat="server">
                                            <ContentTemplate>
                                                 <asp:HiddenField ID="hdnArea" runat="server" />
                                                <asp:DataList ID="itemCartDL" runat="server" RepeatColumns="0" RepeatDirection="Vertical" 
                                                    DataKeyField="Driver_ID">
                                                    <ItemTemplate>
                                                        <div>
                                                            <aside id="itemValues">
                                                                <asp:Label ID="noLbl" runat="server"> </asp:Label>
                                                                <asp:ImageButton runat="server" ID="itemImage"/>
                                                                <asp:TextBox  ID="qtyTxt" runat="server"></asp:TextBox>
                                                                <asp:Label ID="priceLbl" runat="server"> </asp:Label>
                                                                <asp:Label ID="rateLbl" runat="server"> </asp:Label>
                                                                <div>
                                                                <asp:LinkButton ID="updateBtn" runat="server">Update</asp:LinkButton>
                                                                <asp:LinkButton ID="Delete" runat="server">Delete</asp:LinkButton>
                                                                </div>
                                                                
                                                                
                                                                
                                                             </aside>
                                                                
                                                                    
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                </ContentTemplate>
                                                </asp:UpdatePanel>