<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="product-display.aspx.cs" Inherits="assignment_draft.product_display" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <asp:FormView ID="formview1" runat="server" DataSourceID="viewproductsds">
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
            CategoryName:
            <asp:TextBox ID="CategoryNameTextBox" runat="server" Text='<%# Bind("CategoryName") %>' />
            <br />
            Expr1:
            <asp:Label ID="Expr1Label1" runat="server" Text='<%# Eval("Expr1") %>' />
            <br />
            Extension:
            <asp:TextBox ID="ExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>' />
            <br />
            AltText:
            <asp:TextBox ID="AltTextTextBox" runat="server" Text='<%# Bind("AltText") %>' />
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
            CategoryName:
            <asp:TextBox ID="CategoryNameTextBox" runat="server" Text='<%# Bind("CategoryName") %>' />
            <br />

            Extension:
            <asp:TextBox ID="ExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>' />
            <br />
            AltText:
            <asp:TextBox ID="AltTextTextBox" runat="server" Text='<%# Bind("AltText") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <div class="left-panel">                              
            <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Bind("ProductName") %>' />
                <br />                
            <asp:Label ID="ProductDescLabel" runat="server" Text='<%# Bind("ProductDesc") %>' />
                <br />
                Type:
            <asp:Label ID="CategoryNameLabel" runat="server" Text='<%# Bind("CategoryName") %>' />
                <br />
                In Stock:
            <asp:Label ID="StockQtyLabel" runat="server" Text='<%# Bind("StockQty") %>' />
                <br />
                Price: BND$
            <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' />
                <br />
            </div>
            <div id="right-panel">
                <img src="Images/uploadedimages/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" width="300" height="300" alt="This is an image of a <%#Eval("AltText") %>" />
                <br />

                Condition:
            <asp:Label ID="ConditionLabel" runat="server" Text='<%# Bind("Condition") %>' />
                <br />
                
            </div>



        </ItemTemplate>

    </asp:FormView>
    <asp:SqlDataSource ID="viewproductsds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" SelectCommand="SELECT tbl_products.*, tb_categories.CategoryName, tb_images.ImageId AS Expr1, tb_images.Extension, tb_images.AltText FROM tb_categories INNER JOIN tbl_products ON tb_categories.CategoryId = tbl_products.CategoryId INNER JOIN tb_images ON tbl_products.ImageId = tb_images.ImageId"></asp:SqlDataSource>
</asp:Content>
