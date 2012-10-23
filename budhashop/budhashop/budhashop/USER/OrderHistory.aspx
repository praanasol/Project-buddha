<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="budhashop.USER.OrderHistory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    
    <style type="text/css">
        .hiddenColumn
        {
            display: none;
        }
    </style>

    <script src="../script/jquery-1.8.2.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            
            $("#btnClose").click(function(){
                $("#itemsDiv").hide("slow");
            });
         });
         
         function showitemsDiv()
         {
            $("#itemsDiv").show("slow");
//            $('#itemsDiv').css("top", +event.pageX);
//            $("#itemsDiv").animate({height:'300px',opacity:'0.4'},"slow");
//            $("#itemsDiv").animate({width:'300px',opacity:'0.8'},"slow");
         }
         
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
    <div style="float:left; width:40%;">
    
    <asp:GridView ID="orderGrid" runat="server" AllowPaging="True" 
             AutoGenerateColumns="False" 
             DataKeyNames="PurchaseId,Uid,NoItems,TotalBilledRate,PurchaseDate,DeliveredFlag,ItemString,ShippingAddress" 
             OnPageIndexChanging="orderGrid_PageIndexChanging" 
             onrowcommand="orderGrid_RowCommand" PageSize="10" 
            onrowdatabound="orderGrid_RowDataBound">
             <%--AllowPaging="true" PageSize ="3" OnPageIndexChanging= "itemGrid_PageIndexChanging">--%>
                
             <Columns>
                 <asp:TemplateField HeaderStyle-CssClass="hiddenColumn" ItemStyle-CssClass="hiddenColumn" FooterStyle-CssClass="hiddenColumn">
                     <ItemTemplate>
                         <asp:LinkButton ID="lb_Show" runat="server" 
                             CommandArgument="<%# Container.DisplayIndex %>" CommandName="show">Full Details</asp:LinkButton>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Purchase Id">
                     <ItemTemplate>
                         <asp:Label ID="lbl_PurchaseId" runat="server" Text='<%# Eval("PurchaseId") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="User Id">
                     <ItemTemplate>
                         <asp:Label ID="lbl_UserId" runat="server" Text='<%# Eval("Uid") %>'></asp:Label>
                         <asp:HiddenField ID="HiddenItemStr" runat="server" Value='<%#Eval("ItemString") %>'/>
                         <asp:HiddenField ID="HiddenAddrStr" runat="server" Value='<%#Eval("ShippingAddress") %>'/>

                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Quantity">
                     <ItemTemplate>
                         <asp:Label ID="lbl_itemQty" runat="server" Text='<%# Eval("NoItems") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Billed Rate">
                     <ItemTemplate>
                         <asp:Label ID="lbl_totalBR" runat="server" Text='<%# Eval("TotalBilledRate") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Date Purchased">
                     <ItemTemplate>
                         <asp:Label ID="lbl_purchaseDate" runat="server" Text='<%# Eval("PurchaseDate") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Deliverd">
                     <ItemTemplate>
                         <asp:Label ID="lbl_Delivered" runat="server" Text='<%# Eval("DeliveredFlag") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
             </Columns>
         </asp:GridView>
    
    </div>
    
    <div style="float:left; width:60%;">
    
        <div id="itemsDiv" runat="server" style="background:lightgreen; display:none; position:absolute;">
            <a href="#" id="btnClose" style="float:right;">Close</a>
            <div style="width:80px;">
                <asp:Label ID="itemsCount" runat="server"></asp:Label>
                <asp:Label ID="totalBill" runat="server"></asp:Label>
                <asp:Label ID="dateP" runat="server"></asp:Label>
                <asp:Label ID="NameA" runat="server"></asp:Label>
                <asp:Label ID="PhnA" runat="server"></asp:Label>
                <asp:Label ID="AdrA" runat="server"></asp:Label>
            </div>
            <div>
                <asp:GridView ID="SelectedOrderGrid" runat="server" AutoGenerateColumns="False" style="text-align: center">
                    <Columns>
                        <asp:TemplateField HeaderText="Item Id">
                            <ItemTemplate>
                                <asp:Label ID="lbl_itemId" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lbl_itemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image_itemImage" runat="server" Height="50px" Width="60px" 
                                    ImageUrl='<%# Eval("ImagePath") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:Label ID="lbl_itemQty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Billed Rate">
                            <ItemTemplate>
                                <asp:Label ID="lbl_itemBR" runat="server" Text='<%# Eval("BilledRate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Rate">
                            <ItemTemplate>
                                <asp:Label ID="lbl_itemTR" runat="server" Text='<%# Eval("TotalRate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        
        </div>
    
    </div>
    
    </form>
</body>
</html>
