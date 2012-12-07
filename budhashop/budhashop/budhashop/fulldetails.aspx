<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master"  AutoEventWireup="true" CodeBehind="fulldetails.aspx.cs" Inherits="budhashop.fulldetails" Title="Product Details - Go Vedic - Online Shopping - Traditional and Natural Products" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style type="text/css">
#img_menu
    {
        display:none;
        position: absolute;
        z-index: 10002;
        text-align: left;
        padding:3px 3px 0px 3px;
             
        top: 280px;
        background-color:#962824;
        left: 550px;
       
        color: #789;
        
	border:2px #e1a729 solid;
	border-radius:5px;
        
    }
    
   
   

</style>
<%--Call for json to update in cart--%>
    <script type="text/javascript" src="script/CartJSONCall.js"></script>
    
<%--Call to Disply Item full Details based on Query String--%>
    <script src="script/fullDetailsPage.js" type="text/javascript"></script>
    
 <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<article style="height:20px;"></article>
 
  <%--<div id="box_header" style="width:985px;">
    	<h2>Product Details</h2>
    	
      
    </div>--%>
     <br clear="all" />
<section id="item_area" class="box_style" style="height:auto;">
  	<div style="text-align:center;">
    	<b style="text-align:center;border: 1px solid #F3C46D; padding:0px 5px 5px 5px; border-radius: 0px 0px 5px 5px; font-size:16px">Product Details</b>
       
    </div>
  	<br />
  	<%--<div id="full_details_box_header">
    	
      
    </div>--%>
    <!--Gallery Start-->
   <div id="box_content" style="overflow:hidden; overflow-x: hidden;  overflow-y: hidden; height:auto; width:970px; margin:10px 0;">
   
    <div style="height:auto; width:970px;">
        <!--full Details Start-->
        <!--full Details Header part Start-->
            
            <section id="full_header_part">
                <!--Cart items img CL Start-->
               
            <aside id="f_d_cl1">
				<section id="f_d_img"> 
					
					<div id="f_d_img_placeholder"><a id="imgItem" href="#" target="_self"></a></div>
					<div id="img_menu">
                           <a id="fullimg" href="#" ></a>
                        </div>
			  </section>
			  
			  <section id="f_d_fields">
					
                          <div id="f_d_field_area">
                              
                             
                              <div id="f_d_field" class="style4"><a id="nameTxt"></a>
                              </div>
                                                       
                          </div>
						  <div id="f_d_field_area">
                              <div id="f_d_label">Product Id :</div>
                              <div id="f_d_field" class="style4"><a id="idTxt"></a>
                             </div>
                          </div>
						  <div id="f_d_field_area">
                              <div id="f_d_label">Price :</div>
                              <div id="f_d_field" class="style4">Rs.<a id="priceTxt"></a>
                              </div>
                              <div id="f_d_but">
                                    <div id="addCartBtn"></div>
                              </div>
                          </div>
                          <div id="f_d_field_area"">
                              <div id="f_d_label">
                                  <div id="typeheader"></div>
                              </div>
                              <span id="fillfeild" class="style4" style="margin-left:-200px;"></span>
                              <br />
                              <asp:Label ID="lbl_validate" runat="server" Font-Bold="true" ForeColor="Red" style="margin-left:-250px;"></asp:Label>
                          </div>
					
			  </section>
            </aside>
            <!--Cart items img CL End-->
            <!--Other details start-->
            <aside id="f_d_cl2">
                 <section id="f_d_des" style="border-top:#f3c46d 1px solid; height:auto;">
                 <h3 style="color:#512912;">Description</h3><br />
                <div id="descBox" style="color:#512912; margin:10px 0; height:auto;">
                </div>
                                                     
                </section>
                
            </aside>
            <!--Other details end-->
            </section>
        <!--full Details Header part End-->
       <%-- <section></section>--%>
        <!--full Details Body part Start-->
           <%-- <section id="f_d_body">
               
            </section>--%>
        <!--full Details Body part End-->
        
        <!--full Details End-->
    </div>
    </div>
    <aside style=" width:inherit; text-align:right;">
       <div style=" padding-right:350px; padding-bottom:15px; padding-top:10px;">
                <div style="float:right;">
               <div class="fb-like" data-send="false" data-layout="button_count" data-width="100" data-show-faces="false"></div>
              </div>
               <div style="float:right;"><a href="https://twitter.com/share" class="twitter-share-button" data-via="twitterapi" data-lang="en">Tweet</a>
                
                <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
               </div>
               <div>
               <!-- Place this tag where you want the +1 button to render. -->
                <div class="g-plusone" data-size="medium"></div>

                <!-- Place this tag after the last +1 button tag. -->
                <script type="text/javascript">
                  (function() {
                    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                    po.src = 'https://apis.google.com/js/plusone.js';
                    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                  })();
                </script>
                </div>
                </div>
                </aside>
    </section>
<div style="height:160px;">
<div id="backBtn" style="float:left; margin:20px 0 0 330px; background:#AC7713; padding:5px;border:#981d18 solid 1px;
	border-radius:5px;"></div>
	
	<div id="featuredBtn" style="float:left; margin:20px 0 0 30px; background:#AC7713; padding:5px;border:#981d18 solid 1px;
	border-radius:5px;"></div>
    	
   </div> 	



</asp:Content>
