<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="admin-defaultpage.aspx.cs" Inherits="assignment_draft.Admin.admin_defaultpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">

    <section id="adminpage">
        <div id="admin-controls">
        <asp:LinkButton ID="btnAddProduct" runat="server" CssClass="button" PostBackUrl="~/addproduct.aspx">Add New Product</asp:LinkButton>
        <asp:GridView ID="gridviewProduct" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="adminsds" AllowSorting="True" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ProductId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ProductId" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                <asp:BoundField DataField="ProductDesc" HeaderText="Product Description" SortExpression="ProductDesc" />
                <asp:BoundField DataField="StockQty" HeaderText="Stock" SortExpression="StockQty" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="ImageId" HeaderText="Image" SortExpression="ImageId" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />
            </Columns>
            </asp:GridView>


            <asp:SqlDataSource ID="adminsds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebConString %>" DeleteCommand="DELETE FROM [tb_products] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [tb_products] ([ProductName], [ProductDesc], [StockQty], [Price], [ImageId], [CategoryId]) VALUES (@ProductName, @ProductDesc, @StockQty, @Price, @ImageId, @CategoryId)" SelectCommand="SELECT tb_products.ProductId, tb_products.ProductName, tb_products.ProductDesc, tb_products.StockQty, tb_products.Price, tb_products.ImageId, tb_categories.CategoryName FROM tb_products INNER JOIN tb_categories ON tb_products.CategoryId = tb_categories.CategoryId" UpdateCommand="UPDATE [tb_products] SET [ProductName] = @ProductName, [ProductDesc] = @ProductDesc, [StockQty] = @StockQty, [Price] = @Price, [ImageId] = @ImageId, [CategoryId] = @CategoryId WHERE [ProductId] = @ProductId">
                <DeleteParameters>
                    <asp:Parameter Name="ProductId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="ProductDesc" Type="String" />
                    <asp:Parameter Name="StockQty" Type="Int32" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="ImageId" Type="String" />
                    <asp:Parameter Name="CategoryId" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="ProductDesc" Type="String" />
                    <asp:Parameter Name="StockQty" Type="Int32" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="ImageId" Type="String" />
                    <asp:Parameter Name="CategoryId" Type="String" />
                    <asp:Parameter Name="ProductId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        <asp:LinkButton ID="btnAddCategory" runat="server" PostBackUrl="~/addproductcategory.aspx">Add New Product Category</asp:LinkButton>
        <asp:GridView ID="gridviewCategory" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CategoryId" DataSourceID="admincatsds">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="CategoryId" HeaderText="ID" ReadOnly="True" SortExpression="CategoryId" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />
            </Columns>
            </asp:GridView>

            
            <asp:SqlDataSource ID="admincatsds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebConString %>" DeleteCommand="DELETE FROM [tb_categories] WHERE [CategoryId] = @CategoryId" InsertCommand="INSERT INTO [tb_categories] ([CategoryId], [CategoryName]) VALUES (@CategoryId, @CategoryName)" SelectCommand="SELECT * FROM [tb_categories]" UpdateCommand="UPDATE [tb_categories] SET [CategoryName] = @CategoryName WHERE [CategoryId] = @CategoryId">
                <DeleteParameters>
                    <asp:Parameter Name="CategoryId" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CategoryId" Type="String" />
                    <asp:Parameter Name="CategoryName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CategoryName" Type="String" />
                    <asp:Parameter Name="CategoryId" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <div id="imageupload">
             <asp:LinkButton ID="LinkButton1" runat="server" CssClass="button" PostBackUrl="~/uploadimage.aspx">Upload New Product Image</asp:LinkButton>

            </div>
        </div>
    </section>
</asp:Content>
