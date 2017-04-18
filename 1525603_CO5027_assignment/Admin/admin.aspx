<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="assignment_draft.Admin.admin_defaultpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <section class="adminpage">
        <h2 class="head-title welcome-head">Welcome admin!</h2>
        <h3 class="welcome-head-section">Don't forget to log out after you have done</h3>
    </section>
    <section class="adminpage grid_12">
        <div id="admin-controls">
        <asp:LinkButton ID="btnAddProduct" runat="server" CssClass="button" PostBackUrl="~/Admin/admin-add.aspx">Add New Product</asp:LinkButton>

            <asp:FormView ID="FormView1" runat="server" DataSourceID="editds" AllowPaging="True" DataKeyNames="ProductId" DefaultMode="Edit" OnItemUpdated="FormView1_ItemUpdated">
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
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    ProductId:
                    <asp:Label ID="ProductIdLabel" runat="server" Text='<%# Eval("ProductId") %>' />
                    <br />
                    ProductName:
                    <asp:Label ID="ProductNameLabel" runat="server" Text='<%# Bind("ProductName") %>' />
                    <br />
                    ProductDesc:
                    <asp:Label ID="ProductDescLabel" runat="server" Text='<%# Bind("ProductDesc") %>' />
                    <br />
                    StockQty:
                    <asp:Label ID="StockQtyLabel" runat="server" Text='<%# Bind("StockQty") %>' />
                    <br />
                    Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Bind("Price") %>' />
                    <br />
                    ImageId:
                    <asp:Label ID="ImageIdLabel" runat="server" Text='<%# Bind("ImageId") %>' />
                    <br />
                    CategoryId:
                    <asp:Label ID="CategoryIdLabel" runat="server" Text='<%# Bind("CategoryId") %>' />
                    <br />
                    Condition:
                    <asp:Label ID="ConditionLabel" runat="server" Text='<%# Bind("Condition") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>


            </asp:FormView>
            <asp:SqlDataSource ID="editds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" DeleteCommand="DELETE FROM [tbl_products] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [tbl_products] ([ProductName], [ProductDesc], [StockQty], [Price], [ImageId], [CategoryId], [Condition]) VALUES (@ProductName, @ProductDesc, @StockQty, @Price, @ImageId, @CategoryId, @Condition)" SelectCommand="SELECT * FROM [tbl_products]" UpdateCommand="UPDATE [tbl_products] SET [ProductName] = @ProductName, [ProductDesc] = @ProductDesc, [StockQty] = @StockQty, [Price] = @Price, [ImageId] = @ImageId, [CategoryId] = @CategoryId, [Condition] = @Condition WHERE [ProductId] = @ProductId">
                <DeleteParameters>
                    <asp:Parameter Name="ProductId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="ProductDesc" Type="String" />
                    <asp:Parameter Name="StockQty" Type="Int32" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="ImageId" Type="Int32" />
                    <asp:Parameter Name="CategoryId" Type="String" />
                    <asp:Parameter Name="Condition" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="ProductDesc" Type="String" />
                    <asp:Parameter Name="StockQty" Type="Int32" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="ImageId" Type="Int32" />
                    <asp:Parameter Name="CategoryId" Type="String" />
                    <asp:Parameter Name="Condition" Type="String" />
                    <asp:Parameter Name="ProductId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        <asp:GridView CssClass="gridtable grid_12" ID="gridviewProduct" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="adminsds" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" ></asp:BoundField>
                <asp:BoundField DataField="ProductDesc" HeaderText="Description" SortExpression="ProductDesc" />
                <asp:BoundField DataField="StockQty" HeaderText="In Stock" SortExpression="StockQty" />
                <asp:BoundField DataField="Price" HeaderText="Price ($)" SortExpression="Price" />
                <asp:BoundField DataField="ImageId" HeaderText="Image No." SortExpression="ImageId" />
                <asp:BoundField DataField="CategoryId" HeaderText="Category" SortExpression="CategoryId" />
                <asp:BoundField DataField="Condition" HeaderText="Condition" SortExpression="Condition" />
            </Columns>
            </asp:GridView>


            <asp:SqlDataSource ID="adminsds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" DeleteCommand="DELETE FROM [tbl_products] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [tbl_products] ([ProductName], [ProductDesc], [StockQty], [Price], [ImageId], [CategoryId], [Condition]) VALUES (@ProductName, @ProductDesc, @StockQty, @Price, @ImageId, @CategoryId, @Condition)" SelectCommand="SELECT * FROM [tbl_products]" UpdateCommand="UPDATE [tbl_products] SET [ProductName] = @ProductName, [ProductDesc] = @ProductDesc, [StockQty] = @StockQty, [Price] = @Price, [ImageId] = @ImageId, [CategoryId] = @CategoryId, [Condition] = @Condition WHERE [ProductId] = @ProductId">
                <DeleteParameters>
                    <asp:Parameter Name="ProductId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="ProductDesc" Type="String" />
                    <asp:Parameter Name="StockQty" Type="Int32" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="ImageId" Type="Int32" />
                    <asp:Parameter Name="CategoryId" Type="String" />
                    <asp:Parameter Name="Condition" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="ProductDesc" Type="String" />
                    <asp:Parameter Name="StockQty" Type="Int32" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="ImageId" Type="Int32" />
                    <asp:Parameter Name="CategoryId" Type="String" />
                    <asp:Parameter Name="Condition" Type="String" />
                    <asp:Parameter Name="ProductId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        <asp:LinkButton CssClass="button" ID="btnAddCategory" runat="server" PostBackUrl="~/Admin/admin-addcategory.aspx">Add New Product Category</asp:LinkButton>
        <asp:FormView ID="FormView2" runat="server" AllowPaging="True" DataSourceID="editcatds" DefaultMode="Edit">
            </asp:FormView>
            <asp:SqlDataSource ID="editcatds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" DeleteCommand="DELETE FROM [tb_categories] WHERE [CategoryId] = @CategoryId" InsertCommand="INSERT INTO [tb_categories] ([CategoryId], [CategoryName]) VALUES (@CategoryId, @CategoryName)" SelectCommand="SELECT * FROM [tb_categories]" UpdateCommand="UPDATE [tb_categories] SET [CategoryName] = @CategoryName WHERE [CategoryId] = @CategoryId">
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
        <asp:GridView CssClass="gridtable" ID="gridviewCategory" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="CategoryId" DataSourceID="admincatsds">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="CategoryId" HeaderText="ID" ReadOnly="True" SortExpression="CategoryId" />
                <asp:BoundField DataField="CategoryName" HeaderText="Category" SortExpression="CategoryName" />
            </Columns>
            </asp:GridView>

            
            <asp:SqlDataSource ID="admincatsds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" DeleteCommand="DELETE FROM [tb_categories] WHERE [CategoryId] = @CategoryId" InsertCommand="INSERT INTO [tb_categories] ([CategoryId], [CategoryName]) VALUES (@CategoryId, @CategoryName)" SelectCommand="SELECT * FROM [tb_categories]" UpdateCommand="UPDATE [tb_categories] SET [CategoryName] = @CategoryName WHERE [CategoryId] = @CategoryId">
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

            
        </div>
    </section>
</asp:Content>
