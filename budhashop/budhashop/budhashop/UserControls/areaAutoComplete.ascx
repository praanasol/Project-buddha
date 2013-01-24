<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="areaAutoComplete.ascx.cs" Inherits="budhashop.UserControls.areaAutoComplete" %>
   
    
      
    <script type="text/javascript"> 
            
           $(document).ready(function() {
	            $.ajax({
                type: "POST",
                url: "/Services/SearchIt.asmx/FetchAreaNames",
                dataType: "json",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataFilter: function(data1) { return data1; },
                success: function(data1) {
                
                $.ui.autocomplete.prototype._renderMenu = function( ul, items ) {
 var self = this;
 $.each( items, function( index, item ) {
    if (index < 12) // here we define how many results to show
       {self._renderItem( ul, item );}
    });
    }
                    $("[id$=txtArea]").autocomplete({
                        minLength: 1,
                        source: data1.d,
                        focus: function(event, ui) {
                            $("[id$=txtArea]").val(ui.item.AreaName);
                            
                            return false;
                        },
                        select: function(event, ui) {
                            $("[id$=txtArea]").val(ui.item.AreaName);
                            $('#selectedValue').text(ui.item.ID);
                                                        
                          $('[id$=hdArea]').val(ui.item.ID);
                          var k2=$("[id$=hdArea]").val(ui.item.ID);
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
    <asp:HiddenField ID="hdArea" runat="server"/>
    <asp:TextBox ID="txtArea" runat="server" class="search_form_style" Width="120" 
    ontextchanged="txtArea_TextChanged"> </asp:TextBox>
    
                                                                                        
<%--<div id="selectedValue"></div>--%>