<%@ Page Title="Home | Quill & Inks" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="assignment_draft._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
     <div id="container_home" class="grid_12">       
         <section class="contentpanel">
             <h2 class="welcome-head"> “Life is what happens to us while we are making other plans.” ― Allen Saunders </h2>
             <div id="slider-sale-banner" class="grid_12">
                <ul class="bxslider">
                    <li><img src="Images/salesbanner/Sale-Banner-A.jpg" alt="Special Offer Sale Banner Starts From 15th October" width="723" height="209" /><!-- reference --></li>
                    <li> <img src="Images/salesbanner/Sale-Banner-B.jpg" alt="Fantastic Sale Banner Limited Time Only Enjoy up to 50% Discount on Selected Items" width="723" height="209" /><!-- reference --></li>
                    <li><img src="Images/salesbanner/Sale-Banner-C.jpg" alt="Limited time only Stock Clearance Sale Enjoy up to 50% discount from 2pm to 6pm" width="723" height="209" /><!-- reference --></li>
                </ul>
            </div>
         </section>
         <section class="contents-showcase grid_12">
                <h2 class="welcome-head-section">Top Trending</h2>
                 <asp:Repeater ID="rptrDisplay" runat="server" DataSourceID="featuredsds">
                     <HeaderTemplate><ul></HeaderTemplate>
                     <ItemTemplate>
                         <li class="product-display">
                             <a href="<%# Eval("ProductId", "product-display.aspx?Id={0}") %>" class="planners">
                                 <img src="Images/uploadedimages/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" class="filo" width="300" height="300" alt="This is an image of a <%#Eval("AltText") %>" />
                                 <img src="Images/product-hover/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" class="hide" width="300" height="300" alt="This is the inside image of a <%#Eval("AltText") %>" />
                             </a>
                         </li>                         
                     </ItemTemplate>
                     <FooterTemplate></ul></FooterTemplate>
                 </asp:Repeater>
                
                 <asp:SqlDataSource ID="featuredsds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" SelectCommand="SELECT tbl_products.ProductId, tbl_products.ImageId, tbl_products.Condition, tb_images.Extension, tb_images.AltText, tbl_products.ProductName, tbl_products.ProductDesc, tbl_products.StockQty, tbl_products.Price, tb_categories.CategoryName FROM tbl_products INNER JOIN tb_images ON tbl_products.ImageId = tb_images.ImageId INNER JOIN tb_categories ON tbl_products.CategoryId = tb_categories.CategoryId WHERE (tbl_products.Condition LIKE '%' + @Condition + '%')">
                     <SelectParameters>
                         <asp:Parameter DefaultValue="Brand" Name="Condition" Type="String" />
                        
                     </SelectParameters>
                 </asp:SqlDataSource>
          
                
         </section>
  
        </div>
</asp:Content>
