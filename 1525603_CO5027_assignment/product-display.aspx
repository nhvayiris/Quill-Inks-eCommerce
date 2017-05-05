<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="product-display.aspx.cs" Inherits="assignment_draft.product_display" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <main class="content-change">

        <asp:Repeater ID="rptProductDisplay" runat="server" DataSourceID="SqlDataSource1"  >
            <HeaderTemplate><div></HeaderTemplate>
            <ItemTemplate>
                <div class="left-cont grid_5">
                    <div>
                        <asp:Label ID="lblProdName" CssClass="productLbl" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                    </div>
                    <div>
                        <p class="productLbl">BND&#36; <asp:Label ID="productLblPrice" runat="server" Text='<%#Eval("Price", "{0:##0.00}") %>'></asp:Label></p>
                    </div>
                    
                    <div>
                        <p class="productLbl">Condition: </p>
                        <p id="productDesc" class="product-description"><%#Eval("Condition") %> </p>
                    </div>
                </div>
                <div class="right-cont grid_6">
                    <img src="Images/uploadedimages/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" id="ImageProduct" class="productImage" width="500" height="500" alt="This is an image of a <%#Eval("AltText") %>" />
                </div>
            </ItemTemplate>
            <FooterTemplate></div></FooterTemplate>
        </asp:Repeater>
        <div >
            <p class="productLbl">Select Quantity: </p>
            <asp:DropDownList ID="ddStockQty" runat="server" CssClass="qty">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="give-space">
            <asp:LinkButton ID="linkToCart" runat="server" CssClass="cartBtn" OnClick="linkToCart_Click">Add To Cart</asp:LinkButton>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:qiwebcon %>" 
            SelectCommand="SELECT tbl_products.ProductId, tbl_products.ProductName, tbl_products.ProductDesc, tbl_products.StockQty, tbl_products.Price, tbl_products.ImageId, tbl_products.CategoryId, tbl_products.Condition, tb_images.Extension, tb_images.AltText, tbl_products.ProductId AS Expr1, tbl_products.ProductName AS Expr2, tbl_products.ProductDesc AS Expr3, tbl_products.StockQty AS Expr4, tbl_products.Price AS Expr5, tbl_products.ImageId AS Expr6, tbl_products.CategoryId AS Expr7, tbl_products.Condition AS Expr8, tbl_products.IsOnSale, tbl_products.StockCondition FROM tb_images INNER JOIN tbl_products ON tb_images.ImageId = tbl_products.ImageId 
            WHERE (tbl_products.ProductId = @ProductId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductId" QueryStringField="Id" />
            </SelectParameters>
            
        </asp:SqlDataSource>
    </main>

    <asp:Panel ID="contentnotFound" runat="server" Enabled="False">
        <div>
            <h2 class="welcome-head-section">We're sorry for the inconvenience!</h2>
        </div>
        <div>
            <p class="error">404</p>
            <p class="errorclass">The page you requested cannot be found.</p>
        </div>
        <div class="errorclass">
            <p>The reason might be:</p>
            <ol>
                <li>The page is out of date and has been removed.</li>
                <li>URL address is typed wrongly.</li>
            </ol>
            <p>What you can do:</p>
            <ol>
                <li>Return to <a href="~/default.aspx" runat="server">Home</a></li>
            </ol>
        </div>
    </asp:Panel>
</asp:Content>
