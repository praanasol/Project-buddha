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
            
            $("tr").filter(function() {
                return $('td', this).length && !$('table', this).length
            })
                .click(function(event) {
                    var row = jQuery(this)
                    var itemString = row.children("td:eq(2)").text();
                    var addrString = row.children("td:eq(3)").text();
                    RowSelected(itemString,addrString);
                })
                .mouseover(function() {
                    $(this).css("cursor", "pointer");
                })
                .css({ background: "ffffff" }).hover(
                    function() { $(this).css({ background: "lightgreen" }); },
                    function() { $(this).css({ background: "#ffffff" }); }
                );
            
            $("#btnClose").click(function(){
                $("#itemsDiv").slideUp("slow");
            });
         });
         
//         function showitemsDiv()
//         {
//            $("#itemsDiv").show("slow");
//            $('#itemsDiv').css("top", +event.pageX);
//            $("#itemsDiv").animate({height:'300px',opacity:'0.4'},"slow");
//            $("#itemsDiv").animate({width:'300px',opacity:'0.8'},"slow");
//         }
         
         function RowSelected(itemString,addrString)
         {
            $("#itemsDiv").show();
            var primeArray = addrString.split(";");
            $("#NameA").html(primeArray[0]);
            $("#PhnA").html(primeArray[1]);
            $("#AdrA").html(primeArray[2]);
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "OrderHistory.aspx/GetOrderedItems",
                data: "{'itemString':'"+ itemString +"'}",
                dataType: "json",
               
                success: function(data) {
                    $("#itemTable tr:gt(0)").remove();
                    for (var i = 0; i < data.d.length; i++) {
                        $('#itemTable tr:last').after('<tr> <td>'+data.d[i].ItemId+'</td> <td>'+data.d[i].ItemName+'</td> <td><img src="'+data.d[i].ItemPath+'" width="60" height="50" border="1"></td> <td>'+data.d[i].BilledRate+'</td> <td>'+data.d[i].ItemQty+'</td> <td>'+data.d[i].TotalRate+'</td> </tr>');
                    }
                   },
                error: function(data) {
                alert(data);
                }
             });
         }
         
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
    <div style="float:left; width:40%; height:500px; overflow-x:auto;">
    
    <asp:GridView ID="orderGrid" runat="server" AutoGenerateColumns="False" >
             <%--AllowPaging="true" PageSize ="3" OnPageIndexChanging= "itemGrid_PageIndexChanging">--%>
                
             <Columns>
                 <asp:TemplateField HeaderText="Purchase Id">
                     <ItemTemplate>
                         <asp:Label ID="lbl_PurchaseId" runat="server" Text='<%# Eval("PurchaseId") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="User Id">
                     <ItemTemplate>
                         <asp:Label ID="lbl_UserId" runat="server" Text='<%# Eval("Uid") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                  <asp:TemplateField HeaderText="Item String" HeaderStyle-CssClass="hiddenColumn" ItemStyle-CssClass="hiddenColumn">
                     <ItemTemplate>
                         <asp:Label ID="itemString" runat="server" Text='<%# Eval("ItemString") %>'></asp:Label>
                     </ItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Address String" HeaderStyle-CssClass="hiddenColumn" ItemStyle-CssClass="hiddenColumn">
                     <ItemTemplate>
                         <asp:Label ID="itemString" runat="server" Text='<%# Eval("ShippingAddress") %>'></asp:Label>
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
        <div id="itemsDiv" style="background:lightgreen; display:none; position:absolute;">
            <a href="#" id="btnClose" style="float:right;">Close</a><br />
            <div>
                <%--<asp:Label ID="itemsCount" runat="server"></asp:Label>
                <asp:Label ID="totalBill" runat="server"></asp:Label>
                <asp:Label ID="dateP" runat="server"></asp:Label>--%>
                <label id="NameA"></label><br />
                <label id="PhnA"></label><br />
                <label id="AdrA"></label><br />
            </div>
            <br />
            <div id="itemsList">
                <table id="itemTable" border="1">
                    <tr>
                        <th>Item Id</th>
                        <th>Name</th>
                        <th>Image</th>
                        <th>Billed Rate</th>
                        <th>Quantity</th>
                        <th>Total Rate</th>
                    </tr>
                </table>
            </div>
        </div>
    
    </div>
    
    </form>
</body>
</html>
