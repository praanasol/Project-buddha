<%@ Page Language="C#" MasterPageFile="~/MasterPage/MainMaster.Master" AutoEventWireup="true"
    CodeBehind="art_full.aspx.cs" Inherits="budhashop.Articles.art_full" %>

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
            padding: 3px 3px 0px 3px;
            top: 280px;
            background-color: #962824;
            left: 550px;
            color: #789;
            border: 2px #e1a729 solid;
            border-radius: 5px;
        }
    </style>
    <%--Call for json to update in cart--%>

    <script type="text/javascript" src="script/CartJSONCall.js"></script>

    <%--Call to Disply Item full Details based on Query String--%>

    <script src="script/fullDetailsPage.js" type="text/javascript"></script>

    <article style="height: 40px;">
    </article>
    <div id="box_header" style="width: 985px;">
        <h2>
            Product Details</h2>
    </div>
    <br clear="all" />
    <section id="item_area" class="box_style" style="height: auto;">
        <div id="box_content" style="overflow: hidden; overflow-x: hidden; overflow-y: hidden;
            height: auto; width: 970px; margin: 10px 0;">
            <div style="height: auto; width: 970px;">
                <section id="art_full_header_part" style="height:auto;">
                    <div id="art_header">
                        <h2>
                            Article Name...</h2>
                    </div>
                    <div id="a_f_field_area">
                        <div id="a_f_label">
                            By Author Name :</div>
                        <div id="a_f_field" class="style4">
                            fgdsgfds</div>
                    </div>
                    <br style="clear:both;" />
                    <aside id="a_f_cl1">
                        <section id="a_f_img">
                            <div id="a_f_img_placeholder">
                                <a id="imgItem" href="#" target="_self"></a>
                            </div>
                            <div id="img_menu">
                                <a id="fullimg" href="#"></a>
                            </div>
                        </section>
                    </aside>
                    <aside id="a_f_cl2">
                        <section id="a_f_des">
                            
                            <div id="descBox" style="width:380px;">gfdsfdsgfds
                            </div>
                        </section>
                    </aside>
                    <section id="f_d_des" style="height:auto;">
                    <p class="text">It works fine in Firefox, Safari, Opera and Chrome, but in IE9 the shadow simply doesn't show up at all. It doesn't work with an outer box shadow either, nor if I define the colour with a hex code instead of RGBA.

It's not an urgent problem as the buttons look fine without it, but I was wondering 
if anyone knew why this might be happening. I have checked that I have a valid doctype and there are no elements with border-collapse on the page.</p>
 <p class="text">It works fine in Firefox, Safari, Opera and Chrome, but in IE9 the shadow simply doesn't show up at all. It doesn't work with an outer box shadow either, nor if I define the colour with a hex code instead of RGBA.

It's not an urgent problem as the buttons look fine without it, but I was wondering 
if anyone knew why this might be happening. I have checked that I have a valid doctype and there are no elements with border-collapse on the page.</p>
                </section>
                </section>
                
            </div>
        </div>
    </section>
    
</asp:Content>
