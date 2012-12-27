<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="navigation.ascx.cs" Inherits="budhashop.UserControls.navigation" %>
<script type="text/javascript">
$(document).ready(function(){
                               
               var catArray = [];
	            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "../Services/Services.aspx/FetchCatNames",
                dataType: "json",
                data: "{}",
               
                success: function(data) {
                
                var items = [];

                $.each(data.d, function(i, item) {

                items.push('<li><a href="../itemspage.aspx?catid=' + item.CatId+ '" tittle="' + item.desc+ '">' + item.CatName + '</a></li>');
               catArray.push(parseInt(item.CatId));

                });  // close each()

               $('[id$=navitems]').append( items.join('') );
              $('[id$=footerNav]').append( items.join('') );
               $('[id$=navitems]').append('<li><a href="../Articles/articleHome.aspx" tittle="Gyaan - Govedic.com">Gyaan</a></li>' );
              $('[id$=footerNav]').append( '<li><a href="../Articles/articleHome.aspx" tittle="Gyaan - Govedic.com">Gyaan</a></li>' );
               $('[id$=navitems]').append('<li><a href="../Articles/articleHome.aspx" tittle="Gyaan - Govedic.com">Vasthra</a></li>' );
              $('[id$=footerNav]').append( '<li><a href="../Articles/articleHome.aspx" tittle="Gyaan - Govedic.com">Vasthra</a></li>' );
               $('[id$=navitems]').append( '<li><a href="../about.aspx" tittle="Gyaan - Govedic.com">About</a></li>' );
                 
                   
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
             
          });




</script>

            <nav id="nav">
            	<ul id="navitems">
            	    <li><a href="../homepage.aspx" target="_self" style="font-size:10px; padding:10px 5px;">Home</a></li>
                </ul>
            </nav>
    

        