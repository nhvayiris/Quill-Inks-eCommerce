<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="product-display.aspx.cs" Inherits="assignment_draft.product_display" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">

    <main class="content-change">

<asp:FormView ID="fView" runat="server" DataKeyNames="ProductId" DataSourceID="SqlDataSource1" RenderOuterTable="False">
    <EditItemTemplate>
        ProductId:
        <asp:Label ID="ProductIdLabel1" runat="server" Text='<%# Eval("ProductId") %>' />
        <br />
        ProductName:
        <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
        <br />
        ProductDesc:
        <asp:TextBox ID="ProductDescTextBox" runat="server" Text='<%# Bind("ProductDesc") %>' />
        <br />
        StockQty:
        <asp:TextBox ID="StockQtyTextBox" runat="server" Text='<%# Bind("StockQty") %>' />
        <br />
        Price:
        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
        <br />
        ImageId:
        <asp:TextBox ID="ImageIdTextBox" runat="server" Text='<%# Bind("ImageId") %>' />
        <br />
        CategoryId:
        <asp:TextBox ID="CategoryIdTextBox" runat="server" Text='<%# Bind("CategoryId") %>' />
        <br />
        Condition:
        <asp:TextBox ID="ConditionTextBox" runat="server" Text='<%# Bind("Condition") %>' />
        <br />
        Extension:
        <asp:TextBox ID="ExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>' />
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
    <InsertItemTemplate>
        ProductName:
        <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
        <br />
        ProductDesc:
        <asp:TextBox ID="ProductDescTextBox" runat="server" Text='<%# Bind("ProductDesc") %>' />
        <br />
        StockQty:
        <asp:TextBox ID="StockQtyTextBox" runat="server" Text='<%# Bind("StockQty") %>' />
        <br />
        Price:
        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
        <br />
        ImageId:
        <asp:TextBox ID="ImageIdTextBox" runat="server" Text='<%# Bind("ImageId") %>' />
        <br />
        CategoryId:
        <asp:TextBox ID="CategoryIdTextBox" runat="server" Text='<%# Bind("CategoryId") %>' />
        <br />
        Condition:
        <asp:TextBox ID="ConditionTextBox" runat="server" Text='<%# Bind("Condition") %>' />
        <br />
        Extension:
        <asp:TextBox ID="ExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>' />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
                 <div class="left-cont grid_5">
                    <div>
                        <p class="productLbl">Product: <%# Eval("ProductName") %></p>
                    </div>
                    <div>
                        <p class="productLbl">Price Per Unit: BND&#36; <%#Eval("Price") %></p></div>
                    <div>
                        <p class="productLbl">Quantity Available: <%#Eval("StockQty") %></p></div>
                    <div>
                        <p class="productLbl">Select Quantity: <asp:DropDownList  runat="server" ID="ddStockQty" CssClass="qty"  DataTextField="StockQty" DataValueField="StockQty">
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
                            
                            
                                                               </asp:DropDownList></p></div>
                    <div>
                        <p class="productLbl">Condition: </p><p id="productDesc" class="product-description"><%#Eval("Condition") %> </p>
                    </div>
                     <div class="addtocart">
                         <asp:LinkButton ID="linkToCart" runat="server" CssClass="cartBtn" OnClick="linkToCart_Click">Add To Cart</asp:LinkButton>
                         <asp:HiddenField ID="HiddenFieldAdd2Cart" runat="server" Value='<%# Eval("ProductId") %>'/>
                         <asp:LinkButton ID="buyNow" runat="server" CssClass="cartBtn">Buy Now</asp:LinkButton>
                     </div>
            
                     
        </div>

        <div class="right-cont grid_6">
            <img src="Images/uploadedimages/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" class="productImage" width="500" height="500" alt="This is an image of a <%#Eval("AltText") %>" />
        </div>

            </ItemTemplate>
    
    </asp:FormView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" SelectCommand="SELECT tbl_products.ProductId AS Expr1, tbl_products.ProductName AS Expr2, tbl_products.ProductDesc AS Expr3, tbl_products.StockQty AS Expr4, tbl_products.Price AS Expr5, tbl_products.ImageId AS Expr6, tbl_products.CategoryId AS Expr7, tbl_products.Condition AS Expr8, tb_images.Extension, tb_images.AltText, tbl_products.* FROM tb_images INNER JOIN tbl_products ON tb_images.ImageId = tbl_products.ImageId WHERE (tbl_products.ProductId = @ProductId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ProductId" QueryStringField="Id" />
                </SelectParameters>
    </asp:SqlDataSource>

        
        
    </main>

 
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="StockQty" DataValueField="" AppendDataBoundItems="True">
        <asp:ListItem Value="StockQty" Text="StockQty"></asp:ListItem>
    </asp:DropDownList>

    <asp:Panel ID="contentnotFound" runat="server" Enabled="False">
        <div>
        <h2  class="welcome-head-section">We're sorry for the inconvenience!</h2>
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
