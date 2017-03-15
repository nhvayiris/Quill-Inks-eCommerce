<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="assignment_draft._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
     <div id="container_home" class="grid_12">

            <div id="header" class="grid_12">
                <h1>Welcome, enjoy shopping!</h1>
            </div>

            <div id="slider-sale-banner" class="grid_12">
                <ul class="bxslider">
                    <li><img src="Images/salesbanner/Sale-Banner-A.jpg" alt="Special Offer Sale Banner Starts From 15th October" width="723" height="209" /></li>
                    <li> <img src="Images/salesbanner/Sale-Banner-B.jpg" alt="Fantastic Sale Banner Limited Time Only Enjoy up to 50% Discount on Selected Items" width="723" height="209" /></li>
                    <li><img src="Images/salesbanner/Sale-Banner-C.jpg" alt="Limited time only Stock Clearance Sale Enjoy up to 50% discount from 2pm to 6pm" width="723" height="209" /></li>
                </ul>
            </div>

            <div id="product-showcase" class="grid_12">
                
            </div><!-- end product showcase; switch to repeater // this will be the category //images will be replaced with icons-->
        </div>
</asp:Content>
