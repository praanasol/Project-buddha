<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="mainSearch.ascx.cs" Inherits="budhashop.UserControls.mainSearch" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
 <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>

<script type="text/javascript"> 
            
           $(document).ready(function() {
	            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/Services/SearchIt.asmx/FetchItemNames",
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
                    $("[id$=SearchAll]").autocomplete({
                        minLength: 1,
                        source: data.d,
//                        focus: function(event, ui) {
//                       // $('[id$=SearchAll]').flushCache();
//                            $("[id$=SearchAll]").val(ui.item.ItemName);
//                            return false;
//                        },
                        select: function(event, ui) {
                        
                        window.location.replace(ui.item.ItemLink);
                        
                            //$("[id$=SearchAll]").val(ui.item.ItemLink);
                          //$('#area_hidden').val(ui.item.ID);
                           // var k=$('#area_hidden').val();
                            return false;
                        }
                    });
                    
                    
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        });
    </script>
    
    <asp:Panel ID="SearchUC" DefaultButton="searchBtn" runat="server">
     <div id="search_form"><asp:TextBox ID="SearchAll" runat="server"  CssClass="search_form_style" Text="Search..." onfocus="if(this.value==this.defaultValue)this.value='';" onblur="if(this.value=='')this.value=this.defaultValue;"></asp:TextBox></div>
        <div id="go_but" class="go_but_style">
        	<div id="go_link">
                <asp:LinkButton ID="searchBtn" runat="server" CssClass="go" Text="GO" 
                     OnClick="searchBtn_Click"></asp:LinkButton></div>
        </div>
    </asp:Panel>
        