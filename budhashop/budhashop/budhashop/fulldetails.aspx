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
        text-align: left;
        padding: 1px;
             
        top: 397px;
        left: 205px;
       
        color: #789;
        
	border:2px #e1a729 solid;
	border-radius:5px;
        
    }
    
   

</style>
<%--Call for json to update in cart--%>
    <script type="text/javascript" src="script/CartJSONCall.js"></script>
    
<%--Call to Disply Item full Details based on Query String--%>
    <script src="script/fullDetailsPage.js" type="text/javascript"></script>
    
 
<article style="height:40px;"></article>
 
  <div id="box_header" style="width:985px;">
    	<h2>Full Details...</h2>
      
    </div>
     <br clear="all" />
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
                              <div id="f_d_but">
                <div id="addCartBtn"></div>
            
          </div>
                          </div>
					
			  </section>
            </aside>
            <!--Cart items img CL End-->
            <!--Other details start-->
            <aside id="f_d_cl2">
                
                
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
