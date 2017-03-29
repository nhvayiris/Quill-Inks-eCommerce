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
                    <span>
                        <p class="productLbl">Product: <%# Eval("ProductName") %></p>
                    </span>
                    <span>
                        <p class="productLbl">Price Per Unit: BND&#36; <%#Eval("Price") %></p></span>
                    <span>
                        <p class="productLbl">Quantity Available: <%#Eval("StockQty") %></p></span><!--change db to show total stockqty-->
                    <span>
                        <p class="productLbl">Select Quantity: <asp:DropDownList runat="server" ID="ddStockQty" CssClass="qty" DataSourceID="SqlDataSource1" DataTextField="StockQty" DataValueField="StockQty"></asp:DropDownList></p></span>
                    <span>
                        <p class="productLbl">Condition: </p><p id="productDesc" class="product-description"><%#Eval("Condition") %> </p>
                    </span>
            
                     
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

 








</asp:Content>
