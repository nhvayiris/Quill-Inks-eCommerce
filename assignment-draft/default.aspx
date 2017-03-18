<%@ Page Title="Home | Quill & Inks" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="assignment_draft._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
     <div id="container_home" class="grid_12">
         <div class="breadcrumb">
             <!--insert breadcrumb here-->
         </div>
            <div id="header" class="grid_12">
                <h1>Welcome, enjoy shopping!</h1>
            </div>

            <div id="slider-sale-banner" class="grid_12">
                <ul class="bxslider">
                    <li><img src="Images/salesbanner/Sale-Banner-A.jpg" alt="Special Offer Sale Banner Starts From 15th October" width="723" height="209" /><!-- reference --></li>
                    <li> <img src="Images/salesbanner/Sale-Banner-B.jpg" alt="Fantastic Sale Banner Limited Time Only Enjoy up to 50% Discount on Selected Items" width="723" height="209" /><!-- reference --></li>
                    <li><img src="Images/salesbanner/Sale-Banner-C.jpg" alt="Limited time only Stock Clearance Sale Enjoy up to 50% discount from 2pm to 6pm" width="723" height="209" /><!-- reference --></li>
                </ul>
            </div>

            <div id="product-showcase" class="grid_12">
                <h2>Top Trending</h2>
                <ul id="product-list">
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>4</li>
                    <li>5</li>
                    <li>6</li>
                    <li>7</li>
                    <li>8</li>
                </ul>
            </div><!-- end product showcase; switch to repeater // this will be the category //images will be replaced with icons-->
        </div>
</asp:Content>
