 
    $(function () {
            $("[id$=SearchAll]").autocomplete({
                minLength: 0,
                delay: 0,
                cache: true,
                source: function (req, addToList) {

                    var popList = new GetAutoCompleteService.searchItems();
                    popList.GetModels(req.term, function (model) {

                        var listItems = [];
                        if (model.length > 0) {
                            for (var key = 0; key < model.length; key++) {
                                listItems.push(model[key].ItemName);
                            }
                        } else {
                            listItems.push("No Matching Model.");
                        }
                        addToList(listItems);
                    }, function onError() {
                    });
                },
                focus: function(event, ui) {
                        $('[id$=SearchAll]').flushCache();
                            $("[id$=SearchAll]").val(ui.item.ItemName);
                            return false;
                        },
                        select: function(event, ui) {
                        
                            $("[id$=SearchAll]").val(ui.item.ItemName);
                          //$('#area_hidden').val(ui.item.ID);
                           // var k=$('#area_hidden').val();
                            return false;
                        }
            });

            $("[id$=SearchAll]").click(function () {
                // close if already visible
                if ($("[id$=SearchAll]").autocomplete("widget").is(":visible")) {
                    $("[id$=SearchAll]").autocomplete("close");
                    return;
                }

                // work around a bug (likely same cause as #5265)
                $(this).blur();

                // pass empty string as value to search for, displaying all results
                $("[id$=SearchAll]").autocomplete("search", "");
                $("[id$=SearchAll]").focus();
            });
        });

    
    
  <script type="text/javascript">

    $(document).ready(function () {
        $('#SearchAll').autocomplete( {
         source: function (request, response) {
                    //console.log(request.term);
             $.ajax
             ({
                 url: "../Services/Services.aspx/FetchItemNames",
                 data: "{}",//'prefixText': '" + request.term + "'
                 dataType: "json",
                 type: "POST",
                 contentType: "application/json; charset=utf-8",
                 dataFilter: function (data) {
                     //console.log(data.toString());
                     //alert(data.toString());
                     return data;
                 },
                 success: function (data) {
                     // console.log(data.d.toString());
                     response($.map(data.d, function (item) {
                         // console.log(item.Isin)
                         // console.log(item.Name)
                         return
                         {
                             label: item.ItemName.toString(),
                             value: item.ItemName.toString()
                         }
                     }));
                },
                 error: function (XMLHttpRequest, textStatus, errorThrown) {
                     alert(textStatus);
                 }
             });
         },
         minLength: 2
         });
    });

</script>