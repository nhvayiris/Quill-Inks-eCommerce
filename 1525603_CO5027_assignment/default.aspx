<%@ Page Title="Home | Quill & Inks" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="assignment_draft._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">

    <div class="searchbox">
        <div class="searchcont">
            <asp:Button CssClass="icon" runat="server" ID="btnSearch" Text="Search" OnClick="btnSearch_Click" ValidationGroup="save" />
            <asp:Label CssClass="contact-label-search" ToolTip="Search for items e.g Leather or Diary" ID="lblsearch" runat="server" AssociatedControlID="tbSearch" Text="Search"></asp:Label>
            <asp:TextBox ID="tbSearch" CssClass="box" runat="server" ToolTip="Search for items e.g Leather or Diary" placeholder="Search for item..."></asp:TextBox>
            <asp:RequiredFieldValidator ID="searchVal" runat="server" ErrorMessage="Cannot search for empty keyword" ControlToValidate="tbSearch" CssClass="lit-panel-search" ValidationGroup="save"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div id="container_home" class="grid_12">
        <div class="contentpanel">
            <h2 class="welcome-head">“Life is what happens to us while we are making other plans.” ― Allen Saunders </h2>
            <div class="banner-slideshow">
                <ul class="slidepane">
                    <li>
                        <img src="Images/salesbanner/Sale-Banner-A.jpg" alt="Special Offer Sale Banner Starts From 15th October" width="900" height="209" /><!-- images taken from https://www.shutterstock.com/image-vector/sale-banners-design-252691153?src=i9Z633TFu0ogPQf5CQkd2A-1-65 --></li>
                    <li>
                        <img src="Images/salesbanner/Sale-Banner-B.jpg" alt="Fantastic Sale Banner Limited Time Only Enjoy up to 50% Discount on Selected Items" width="900" height="209" /><!-- images taken from https://www.shutterstock.com/image-vector/sale-banners-design-252691153?src=i9Z633TFu0ogPQf5CQkd2A-1-65 --></li>
                    <li>
                        <img src="Images/salesbanner/Sale-Banner-C.jpg" alt="Limited time only Stock Clearance Sale Enjoy up to 50% discount from 2pm to 6pm" width="900" height="209" /><!-- images taken from https://www.shutterstock.com/image-vector/sale-banners-design-252691153?src=i9Z633TFu0ogPQf5CQkd2A-1-65 --></li>
                </ul>
            </div><!--end banner-slideshow -->
        </div><!--end contentpanel -->
        
        <asp:Literal ID="productLiteral" runat="server"></asp:Literal>

        <div class="contents-showcase grid_12">
            <asp:Repeater ID="rptrDisplay" runat="server" DataSourceID="featuredsds">
                <HeaderTemplate>
                    <div><img src="Images/SALEBANNER.png" width="200" height="47" alt="" /></div>
                    <ul>
                </HeaderTemplate>
                <ItemTemplate>
                    <li class="product-display">

                        <a href="<%# string.Format("product-display.aspx?Id={0}", HttpUtility.UrlEncode(Eval ("ProductId").ToString())) %>" class="planners">
                            <img src="Images/uploadedimages/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" class="filo" width="300" height="300" alt="This is an image of a <%#Eval("AltText") %>" />
                            <img src="Images/product-hover/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" class="hide" width="300" height="300" alt="This is the inside image of a <%#Eval("AltText") %>" />
                        </a>
                        <p class="sale-displayhead"><%# Eval("ProductName") %></p>
                        <p class="sale-displaybody">GBP &pound; <%#Eval("Price", "{0:##0.00}") %></p>
                    </li>
                </ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>
            </asp:Repeater>

            <asp:SqlDataSource ID="featuredsds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>"
                SelectCommand="SELECT tbl_products.ProductId, tbl_products.IsOnSale, tbl_products.ImageId, tbl_products.Condition, tb_images.Extension, tb_images.AltText, tbl_products.ProductName, tbl_products.ProductDesc, tbl_products.StockQty, tbl_products.Price, tb_categories.CategoryName FROM tbl_products INNER JOIN tb_images ON tbl_products.ImageId = tb_images.ImageId INNER JOIN tb_categories ON tbl_products.CategoryId = tb_categories.CategoryId WHERE IsOnSale = 1">
            </asp:SqlDataSource>

            <asp:ListView runat="server" ID="lv">
                <LayoutTemplate>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                </LayoutTemplate>
                <ItemTemplate>
                    <a href="<%# string.Format("product-display.aspx?Id={0}", HttpUtility.UrlEncode(Eval ("ProductId").ToString()), HttpUtility.UrlEncode(Eval("ImageId").ToString())) %>" class="planners">
                        <img src="Images/uploadedimages/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" class="filo" width="300" height="300" alt="" />
                        <img src="Images/product-hover/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" class="hide" width="300" height="300" alt="" />
                    </a>
                </ItemTemplate>
            </asp:ListView>
            <!-- search list -->

            <asp:Panel runat="server" ID="statPnl">
                <div>
                    <h2 class="welcome-head-section">Product Not Found!</h2>
                </div>
            </asp:Panel>
            <!-- product not found panel -->

            <div class="contents-showcase grid_12">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="productsds">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li class="product-display">
                            <a href="<%# string.Format("product-display.aspx?Id={0}", HttpUtility.UrlEncode(Eval ("ProductId").ToString()), HttpUtility.UrlEncode(Eval("ImageId").ToString())) %>" class="planners">
                                <img src="Images/uploadedimages/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" class="filo" width="300" height="300" alt="This is an image of a <%#Eval("AltText") %>" />
                                <img src="Images/product-hover/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" class="hide" width="300" height="300" alt="This is the inside image of a <%#Eval("AltText") %>" />
                            </a>
                            <p class="sale-displayhead"><%# Eval("ProductName") %></p>
                            <p class="sale-displaybody">GBP &pound; <%#Eval("Price", "{0:##0.00}") %></p>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate></ul></FooterTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="productsds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" SelectCommand="SELECT tbl_products.*, tb_images.ImageId, tb_images.Extension, tb_images.AltText, tb_categories.CategoryName 
FROM tb_categories 
INNER JOIN tbl_products 
ON tb_categories.CategoryId = tbl_products.CategoryId 
INNER JOIN tb_images 
ON tbl_products.ImageId = tb_images.ImageId
WHERE StockCondition = 1"></asp:SqlDataSource>
            </div>

        </div>
        <!-- end div showcase -->

    </div>
</asp:Content>
