$(document).ready(function() {

 $('[id$=contentDiv]').jScrollPane({
                    horizontalGutter:5,
                    verticalGutter:5,
                    'showArrows': false
                });
                
                $('[id$=itemsDiv]').jScrollPane({
                    horizontalGutter:5,
                    verticalGutter:5,
                    'showArrows': false
                });
                
              

 $('.scroll-pane').jScrollPane({
                    horizontalGutter:5,
                    verticalGutter:5,
                    'showArrows': false
                });
                
               
                
                $('.jspDrag').hide();
                $('.jspScrollable').mouseenter(function(){
                    $(this).find('.jspDrag').stop(true, true).fadeIn('slow');
                });
                $('.jspScrollable').mouseleave(function(){
                    $(this).find('.jspDrag').stop(true, true).fadeOut('slow');
                });
});