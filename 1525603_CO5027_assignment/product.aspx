<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="assignment_draft.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div id="category-filter">
        <!-- left side -->
    </div>
    <div id="container_home" class="grid_12">  
    <section class="contents-showcase grid_12">
        <asp:Repeater ID="rptrDisplay" runat="server" DataSourceID="productsds" >
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
        <asp:SqlDataSource ID="productsds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" SelectCommand="SELECT tbl_products.*, tb_images.ImageId AS Expr1, tb_images.Extension, tb_images.AltText, tb_categories.CategoryName FROM tb_categories INNER JOIN tbl_products ON tb_categories.CategoryId = tbl_products.CategoryId INNER JOIN tb_images ON tbl_products.ImageId = tb_images.ImageId"></asp:SqlDataSource>
    </section>
        </div>
</asp:Content>
