<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeBehind="profilepage.aspx.cs" Inherits="budhashop.Merchant.profilepage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Merchant Profile Page</title>
    <link href="../Styles/admin.css" rel="stylesheet" type="text/css" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
    <%--<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.2.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js" type="text/javascript"></script>--%>
    <script type="text/javascript">
        $(document).ready(function() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Services/SearchIt.asmx/FetchMerchantItemNames",
                dataType: "json",
                data: "{}",
                dataFilter: function(data) { return data; },
                success: function(data) {
                    $.ui.autocomplete.prototype._renderMenu = function( ul, items ) {
                        var self = this;
                        $.each( items, function( index, item ) {
                            if (index < 12) // here we define how many results to show
                            {self._renderItem( ul, item );}
                        });
                    }
                    $("[id$=txt_search]").autocomplete({
                        minLength: 1,
                        source: data.d,
                        focus: function(event, ui) {
                            $("#txt_search").val(ui.item.value);
                            return false;
                        },
                        select: function(event, ui) {
                            $("#txt_search").val(ui.item.value);
                            $('#hdn_itemId').val(ui.item.ItemId);
                            return false;
                        }
                    });
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
            
            $( "#txt_datepick1" ).datepicker({
                changeMonth: true,
                changeYear: true
            });
            $( "#txt_datepick2" ).datepicker({
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
    
    <style type="text/css">
       .ui-datepicker {
         font-size:12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <p style="color:#000; text-align:center; font-size:21px;"><b>Merchant Page</b></p>
    
    
    <div style="width:100%;height:230px; margin-top:-58px;">
    
        <div style=" background-color:#460505;padding:3px; border-radius:20px;float:left; "><a href="../homepage.aspx" target="_blank" style="margin-right:20px;"><img src="../images/logo.gif" width="200" height="80" alt="home" title="Home"></a></div>
       
        <div id="ProfileDiv" class="div1" style="margin-left:10px; width:370px; float:right;">
            <div class="div_height">
                <asp:LinkButton ID="lb_mlogout" runat="server" Text="Logout" onclick="lb_mlogout_Click" CssClass="linkbuttons" style="float:right;"></asp:LinkButton>
            </div>
            <div class="div_height">
                <asp:Label ID="lbl_mName" runat="server" Text="Name:" CssClass="lbl_name"></asp:Label>
                <asp:TextBox ID="txt_mName" runat="server" ReadOnly="true" CssClass="txt_boxes"></asp:TextBox>
            </div>
            <div class="div_height">
                <asp:Label ID="lbl_mType" runat="server" Text="Type:" CssClass="lbl_name"></asp:Label>
                <asp:TextBox ID="txt_mType" runat="server" ReadOnly="true" CssClass="txt_boxes"></asp:TextBox>
            </div>
            <div class="div_height" style="height:56px;">
                <asp:Label ID="lbl_mAddress" runat="server" Text="Address:" CssClass="lbl_name"></asp:Label>
                <asp:TextBox ID="txt_mAddress" runat="server" TextMode="MultiLine" ReadOnly="true" CssClass="txt_boxes"></asp:TextBox>
            </div>
            <div class="div_height">
                <asp:Label ID="lbl_mPhno" runat="server" Text="Phone Number:" CssClass="lbl_name"></asp:Label>
                <asp:TextBox ID="txt_mPhno" runat="server" ReadOnly="true" CssClass="txt_boxes"></asp:TextBox>
            </div>
        </div>
    </div>
    
        <p></p>
        <div id="ItemsDiv" class="div1" style="float:left; width:auto; height:600px;">
            <div class="lbl_heading">Items List:<asp:Button ID="btn_ClearCache" runat="server" 
                    Text="Clear Cache" CssClass="buttons" style="float:right;" 
                    onclick="btn_ClearCache_Click" /></div>
            <p></p>
            <asp:Label ID="lbl_itemSts" runat="server" ForeColor="Orange"></asp:Label>
            <asp:GridView ID="itemGrid" runat="server" AutoGenerateColumns="False" EmptyDataText="No Items" 
            onrowcancelingedit="itemGrid_RowCancelingEdit" 
            onrowediting="itemGrid_RowEditing" onrowupdating="itemGrid_RowUpdating" 
            DataKeyNames="ItemId" AllowPaging="True" 
            onpageindexchanging="itemGrid_PageIndexChanging" style="text-align: center">
            <Columns>
                <asp:TemplateField HeaderText="Action">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lb_update" runat="server" CommandName="Update" 
                            ValidationGroup="update">Update</asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="lb_cancel" runat="server" CommandName="Cancel">Cancel</asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lb_edit" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item Id">
                    <EditItemTemplate>
                        <asp:Label ID="lbl_editiid" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_iid" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Item Name" ControlStyle-Width="150px">
                    <EditItemTemplate>
                        <asp:Label ID="lbl_editiname" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_iname" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" Visible="false">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="rfv_descr" runat="server" ErrorMessage="*" ControlToValidate="txt_editidescr" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txt_editidescr" runat="server" Text='<%# Eval("Description") %>' 
                            TextMode="MultiLine" ReadOnly="True" CssClass="txt_boxes"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txt_idescr" runat="server" Text='<%# Eval("Description") %>' 
                            TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Image">
                    <EditItemTemplate>
                        <asp:Image ID="img_editiimage" runat="server" Height="40px" 
                            ImageUrl='<%# Eval("ImagePath") %>' Width="50px" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="img_iimage" runat="server" Height="40px" 
                            ImageUrl='<%# Eval("ImagePath") %>' Width="50px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Billed Rate">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="rfv_BR" runat="server" ErrorMessage="*" ControlToValidate="txt_editBR" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txt_editBR" runat="server" Text='<%# Eval("BilledRate") %>' CssClass="txt_boxes" Width="60px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rev_BR" runat="server" ErrorMessage="*" ValidationExpression="^\d{1,6}(?:[.]\d{1,})?$" ControlToValidate="txt_editBR" ValidationGroup="update" SetFocusOnError="true" ToolTip="Enter Valid Billed Rate(Max:10Lakhs)"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_billedrate" runat="server" Text='<%# Eval("BilledRate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="rfv_Qty" runat="server" ErrorMessage="*" ControlToValidate="txt_editQty" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txt_editQty" runat="server" Text='<%# Eval("Qty") %>' CssClass="txt_boxes" Width="60px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rev_Qty" runat="server" ErrorMessage="*" ValidationExpression="^\d+$" ControlToValidate="txt_editQty" ValidationGroup="update" SetFocusOnError="true" ToolTip="Enter Valid Quantity"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_qty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Net Rate">
                    <EditItemTemplate>
                        <asp:RequiredFieldValidator ID="rfv_NR" runat="server" ErrorMessage="*" ControlToValidate="txt_editNR" ValidationGroup="update" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txt_editNR" runat="server" Text='<%# Eval("NetRate") %>' CssClass="txt_boxes" Width="60px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="rev_NR" runat="server" ErrorMessage="*" ValidationExpression="^\d{1,6}(?:[.]\d{1,})?$" ControlToValidate="txt_editNR" ValidationGroup="update" SetFocusOnError="true" ToolTip="Enter Valid NetRate(Max:10Lakhs)"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_netrate" runat="server" Text='<%# Eval("NetRate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MerchantId" Visible="false">
                    <EditItemTemplate>
                        <asp:Label ID="lbl_editmerchantId" runat="server" Text='<%# Eval("MId") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lbl_merchantId" runat="server" Text='<%# Eval("MId") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
            
        </div>
        <p></p>
  
        <p></p>
        <div id="OrdersDiv" class="div1" style="float:left; width:auto; margin-left:10px; height:600px;">
            <div class="lbl_heading">Orders List:</div>
            <p></p>
            <div id="searchDiv" runat="server">
                <div class="div_height" style="height:35px">
                    <asp:TextBox ID="txt_search" runat="server" Placeholder="Select Item Name" CssClass="txt_boxes"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_search" runat="server" ControlToValidate="txt_search" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="search1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rev_search" runat="server" ControlToValidate="txt_search" ErrorMessage="*" SetFocusOnError="true" ValidationExpression="^([a-zA-Z0-9\s_\-.@#*]*)$" ValidationGroup="search1" ToolTip="Enter Valid Item Name"></asp:RegularExpressionValidator>
                    <asp:Button ID="btn_search1" runat="server" Text="Search" ValidationGroup="search1" onclick="btn_search1_Click" CssClass="buttons" />
                </div>
                <div class="div_height" style="height:50px">
                    <asp:TextBox ID="txt_datepick1" runat="server" Placeholder="Select Start Date" CssClass="txt_boxes"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_datepick1" runat="server" ControlToValidate="txt_datepick1" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="search"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cv_datepick1" runat="server" ControlToValidate="txt_datepick1" Type="Date" Operator="DataTypeCheck" ValidationGroup="search" ErrorMessage="*" SetFocusOnError="true" ToolTip="Enter valid date"></asp:CompareValidator>
                    <br />
                    <asp:TextBox ID="txt_datepick2" runat="server" Placeholder="Select End Date" CssClass="txt_boxes"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_datepick2" runat="server" ControlToValidate="txt_datepick2" ErrorMessage="*" SetFocusOnError="true" ValidationGroup="search"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cv_datepick2" runat="server" ControlToValidate="txt_datepick2" Type="Date" Operator="DataTypeCheck" ValidationGroup="search" ErrorMessage="*" SetFocusOnError="true" ToolTip="Enter valid date"></asp:CompareValidator>
                    <asp:Button ID="btn_search" runat="server" Text="Search" 
                        ValidationGroup="search" onclick="btn_search_Click" CssClass="buttons" />
                </div>
            </div>
            <asp:Label ID="lbl_search" runat="server" ForeColor="Red"></asp:Label>
            <asp:Button ID="btn_refresh" runat="server" Text="Reset" Visible="true" onclick="btn_refresh_Click" CssClass="buttons" />
            <p></p>
            <asp:GridView ID="gv_MerchantOrders" runat="server" AutoGenerateColumns="False" 
                EmptyDataText="No Orders Yet" AllowPaging="True" 
                onpageindexchanging="gv_MerchantOrders_PageIndexChanging" style="text-align:center;">
                <Columns>
                    <asp:TemplateField HeaderText="Item Id">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ItemId" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Name"  ControlStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ItemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="img_ItemImage" runat="server" Height="40px" ImageUrl='<%# Eval("ImagePath") %>' Width="50px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ItemQty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Purchase Date">
                        <ItemTemplate>
                            <asp:Label ID="lbl_PurchaseDate" runat="server" Text='<%# Eval("Date","{0:dd/MM/yy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:GridView ID="gv_MerchantOrdersSearch" runat="server" AutoGenerateColumns="False" 
                EmptyDataText="No Orders Found, Try different search" AllowPaging="True" 
                onpageindexchanging="gv_MerchantOrdersSearch_PageIndexChanging" 
                style="text-align:center;">
                <Columns>
                    <asp:TemplateField HeaderText="Item Id">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ItemId" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Name"  ControlStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ItemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="img_ItemImage" runat="server" Height="40px" ImageUrl='<%# Eval("ImagePath") %>' Width="50px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="lbl_ItemQty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Purchase Date">
                        <ItemTemplate>
                            <asp:Label ID="lbl_PurchaseDate" runat="server" Text='<%# Eval("Date","{0:dd/MM/yy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            
        </div>
              <div id="LowItemsDiv" class="div1" style="float:left; width:auto; margin-left:10px; margin-top:50px; height:310px;">
            <div class="lbl_heading">Items With Quantity Lessthan 5:</div>
            <p></p>
            <asp:GridView ID="gv_lowItems" runat="server" AutoGenerateColumns="false" EmptyDataText="No Items with Quantity < 5" 
                AllowPaging="true" PageSize="5" OnPageIndexChanging="gv_lowItems_PageIndexChanging" style="text-align:center; margin-left:10px;">
                <Columns>
                    <asp:TemplateField HeaderText="Item Id">
                        <ItemTemplate>
                            <asp:Label ID="lbl_itemId" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item Name"  ControlStyle-Width="120px">
                        <ItemTemplate>
                            <asp:Label ID="lbl_itemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="img_itemImage" runat="server" Height="40px" ImageUrl='<%# Eval("ImagePath") %>' Width="50px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="lbl_itemQty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div>
            <asp:HiddenField ID="hdn_itemId" runat="server" Value="0" />
        </div>
    </form>
</body>
</html>