<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="navigation.ascx.cs" Inherits="budhashop.UserControls.navigation" %>

<script type="text/javascript">
        $(document).ready(function(){
                               
              //var catArray = []; 
	            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Services/Services.aspx/FetchCatNames",
                dataType: "json",
                data: "{}",
               
                success: function(data) {
                
                var items = [];

                $.each(data.d, function(i, item) {

                items.push('<li><a href="itemspage.aspx?catid=' + item.CatId+ '">' + item.CatName + '</a></li>');
               // catArray.push(item.CatId);

                });  // close each()

               $('#navitems').append( items.join('') );
//               for(var i=0;i<data.d.length;i++)
//               {
//                    catArray[i] = data.d[i].CatId;
//                     $("#navitems ").append('<li><a href="itemspage.aspx?catid='+data.d[i].CatId+'" target="_self">'+data.d[i].CatName+'</a></li>');
//               }

                
                    
                    
                    
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
          });
    </script>
        <nav id="nav">
            	<ul id="navitems">
                	<li><a href="../itemspage.aspx?catid=1" target="_self">Pooja Items</a></li>
                    
                    
               
                </ul>
            </nav>