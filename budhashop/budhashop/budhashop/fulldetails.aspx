<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master"  AutoEventWireup="true" CodeBehind="fulldetails.aspx.cs" Inherits="budhashop.fulldetails" Title="Go Vedic - Online Shoping Cart - Treditional and Natural Products" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style type="text/css">
#img_menu
    {
        display: none;
       
        position: absolute;
        z-index: 10002;
        border: 1px transparent;
        text-align: left;
        padding: 1px;
             
        top: 397px;
        left: 205px;
       
        color: #789;
        
    }

</style>
<%--Call for json to update in cart--%>
<script type="text/javascript" src="script/CartJSONCall.js"></script>
<script type="text/javascript">
var Id = 0;
var grpc = 0;
var search1 = function() {
  var s = window.location.search.substr(1),
    p = s.split(/\&/), l = p.length, kv, r = {};
  if (l === 0) {return false;}
  while (l--) {
    kv = p[l].split(/\=/);
    r[kv[0]] = decodeURIComponent(kv[1] || '') || true;
  }
  return r;
}();

if(search1.id != null)
{
Id = search1.id;
}
else{

//redirect to home page
}
if(search1.grp != null)
{
grpc = search1.grp;
}
else{
//redirect to home page
}
var flag = 0;
if(grpc==1)
{
flag = 1;
}
else{
flag = 0;
}



$.ajax({
type: "POST",
contentType: "application/json; charset=utf-8",
url: "Services/Services.aspx/itemInfo",
data: "{'itemId':'"+ Id +"','grp':'"+ flag +"'}",
dataType: "json",
success: function(data) {

for (var i = 0; i < data.d.length; i++) {
$("#addCartBtn").append('<a id="addBtn" href="" class="f_d_link" onclick="DoAction('+ data.d[0].ItemId+','+ data.d[0].CatId+');">Add to Cart</a>');
 //$("#itemsBox").append('<aside id="inner_category_box" class="category_box_style"><div id="category_header"><a href="#" target="_self" class="link1">'+ data.d[0].ItemId+'</a></div><div id="img_placeholder"><a href="#" target="_self"><img src="'+data.d[i].ItemPath+'" alt="Items" title="Items" width="151" height="151" border="0"></a></div><div id="category_bottom_row"><div id="category_bottom_links"><div id="to_left" class="style2" style="margin-top:8px;">'+data.d[0].ItemPrice+'</div><div id="to_left"><div id="add" class="add_style"><div id="add_link"><a id = "addBtn'+ data.d[0].ItemId+'" href="" type="button" target="_self" class="add" onclick="DoAction('+ data.d[0].ItemId+','+ data.d[0].CatId+');">ADD</a></div></div></div> </div></div> </aside>');

$("#imgItem").append('<img src="'+data.d[0].ItemPath+'" alt="Item" title="Item" width="100" height="100" border="0">');
$("#fullimg").append('<img src="../itemimages/'+data.d[0].CatId+'/'+data.d[0].ItemId+'/'+data.d[0].ItemId+'Photomedium.jpg" alt="Items" title="Items" width="300" height="300" border="0"/>');

$("#idTxt").append(data.d[0].ItemId);
$("#nameTxt").append(data.d[0].ItemName);
$("#priceTxt").append(data.d[0].ItemPrice);
$("#descBox").append(data.d[0].ItemDesc);

}
},
error: function(result) {
alert("Error");
}
});


            
</script>
<script type="text/javascript">
            $(document).ready(function() {

                    $("[id$=imgItem]").hover(function(e) {          
                        e.preventDefault();
                        $("[id$=img_menu]").toggle();
                          });
        		
                    $("[id$=img_menu]").mouseup(function() {
                        return false
                    });
        		
                });
    </script>



 
<article style="height:40px;"></article>
  <br clear="all" />
  <div id="box_header" style="width:985px;">
    	<h2>Full Details...</h2>
      
    </div>
<section id="item_area" class="box_style" style="height:730px;">
  	<div id="full_details_box_header">
    	<div id="to_left"><h2>Product Details</h2></div>
      
    </div>
    <!--Gallery Start-->
   <div id="box_content" style="overflow:hidden; overflow-x: hidden;  overflow-y: hidden; height:650px; width:970px;">
   
    <div style="height:650px; width:970px;">
        <!--full Details Start-->
        <!--full Details Header part Start-->
            
            <section id="full_header_part">
                <!--Cart items img CL Start-->
            <aside id="f_d_cl1">
				<section id="f_d_img"> 
					
					<div id="f_d_img_placeholder"><a id="imgItem" href="#" target="_self"></a></div>
					<fieldset id="img_menu">
                           <a id="fullimg" href="#" ></a>
                        </fieldset>
			  </section>
			  <section id="f_d_fields">
					
                          <div id="f_d_field_area">
                              <div id="f_d_label">ID :</div>
                              <div id="f_d_field" class="style4"><a id="idTxt"></a>
                              </div>
                          </div>
						  <div id="f_d_field_area">
                              <div id="f_d_label" class="style1">Name :</div>
                              <div id="f_d_field" class="style4"><a id="nameTxt"></a>
                              </div>
                          </div>
						  <div id="f_d_field_area">
                              <div id="f_d_label">Price :</div>
                              <div id="f_d_field" class="style4">Rs.<a id="priceTxt"></a>
                              </div>
                          </div>
					
			  </section>
            </aside>
            <!--Cart items img CL End-->
            <!--Other details start-->
            <aside id="f_d_cl2">
                
                <div id="f_d_but">
                <div id="addCartBtn"></div>
            
          </div>
            </aside>
            <!--Other details end-->
            </section>
        <!--full Details Header part End-->
        <section></section>
        <!--full Details Body part Start-->
            <section id="f_d_body">
                <section id="f_d_des">
                <div id="descBox"></div>
                    <%--<p class="text">Jabong brings to you the chicest collection of latest apparels, footwear, accessories, jewelleries and more. Like you, we too follow the latest in fashion trends and it just helps us bring over thousands of new products exclusively selected for you. Explore big brands like Burberry, Calvin Klein, United Colors of Benetton, Arrow, Esprit, French Connection, Adidas, Reebok, Nike, Clarks, and so many others. While you take the best, we keep looking at what newer designs and styles the likes of Stella McCartney, Robert Cavalli, Zac Posen, and Marc Jacobs orchestrate, just in case, you want more from the shop.</p>
                    <p class="text">Jabong brings to you the chicest collection of latest apparels, footwear, accessories, jewelleries and more. Like you, we too follow the latest in fashion trends and it just helps us bring over thousands of new products exclusively selected for you. Explore big brands like Burberry, Calvin Klein, United Colors of Benetton, Arrow, Esprit, French Connection, Adidas, Reebok, Nike, Clarks, and so many others. While you take the best, we keep looking at what newer designs and styles the likes of Stella McCartney, Robert Cavalli, Zac Posen, and Marc Jacobs orchestrate, just in case, you want more from the shop.</p>
                    <p class="text">Jabong brings to you the chicest collection of latest apparels, footwear, accessories, jewelleries and more. Like you, we too follow the latest in fashion trends and it just helps us bring over thousands of new products exclusively selected for you. Explore big brands like Burberry, Calvin Klein, United Colors of Benetton, Arrow, Esprit, French Connection, Adidas, Reebok, Nike, Clarks, and so many others. While you take the best, we keep looking at what newer designs and styles the likes of Stella McCartney, Robert Cavalli, Zac Posen, and Marc Jacobs orchestrate, just in case, you want more from the shop.</p>
                    <p class="text">Jabong brings to you the chicest collection of latest apparels, footwear, accessories, jewelleries and more. Like you, we too follow the latest in fashion trends and it just helps us bring over thousands of new products exclusively selected for you. Explore big brands like Burberry, Calvin Klein, United Colors of Benetton, Arrow, Esprit, French Connection, Adidas, Reebok, Nike, Clarks, and so many others. While you take the best, we keep looking at what newer designs and styles the likes of Stella McCartney, Robert Cavalli, Zac Posen, and Marc Jacobs orchestrate, just in case, you want more from the shop.</p>
                      --%>                                      
                </section>
            </section>
        <!--full Details Body part End-->
        
        <!--full Details End-->
    </div>
    </div>
    </section>



</asp:Content>
