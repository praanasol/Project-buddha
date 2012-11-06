 <script type="text/javascript">
   $('#but2').click(function(){
   var grpWidth = $('#groupItems').css("margin-left").replace("px","");
   if(grpWidth == -970){$('#but2').css("display","none");}
     if(grpWidth == -2910){$('#but2').css("display","none"); return;}
     else{
     
      $('#groupItems').animate({
        'margin-left': '-=970px'
      },1500);
      $('#but1').css("display","inherit")
      }
      return false;
   });
   $('#but1').click(function(){
   var grpWidth = $('#groupItems').css("margin-left").replace("px","");
   if(grpWidth == -970){$('#but1').css("display","none");}
     if(grpWidth == 0){$('#but1').css("display","none");return;}
     else{
      $('#groupItems').animate({
        'margin-left': '+=970px'
      },1500);
      $('#but2').css("display","inherit");
      }
      return false;
   });
</script>