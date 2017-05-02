<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="assignment_draft.Admin.admin_defaultpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <section class="adminpage">
        <h2 class="head-title welcome-head">Welcome admin!</h2>
        <h3 class="welcome-head-section">Don't forget to log out after you have done with your work!</h3>
    </section>
    <div class="adminborder grid_12">
            <section>
                <h2 class="login-head welcome-head">Manage Products</h2>
                <asp:GridView OnRowDataBound="GridView1_RowDataBound" CssClass="gridtable" ID="GridView1" runat="server" DataKeyNames="ProductId" DataSourceID="adminsds" CellSpacing="-1" GridLines="None">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
            </section>
    </div>
    <!-- edit/delete product -->

    <div class="adminborder grid_12">
        <section>
            <h2 class="login-head welcome-head">Add New Product</h2>
            <asp:FormView ID="addformview" runat="server" DataKeyNames="ProductId" DataSourceID="adminsds" DefaultMode="Insert" RenderOuterTable="False">

                <InsertItemTemplate>
                    <div>
                        <asp:Label CssClass="adminadd" ID="lblProductName" runat="server" Text="Product Name: " AssociatedControlID="ProductNameTextBox"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
                    </div>

                    <div>
                        <asp:Label CssClass="adminadd" ID="lblProductDesc" runat="server" Text="Product Description: " AssociatedControlID="ProductDescTextBox"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="ProductDescTextBox" runat="server" Text='<%# Bind("ProductDesc") %>' />
                    </div>
                    <div>
                        <asp:Label CssClass="adminadd" ID="lblStockQty" runat="server" Text="Quantity in Stock: " AssociatedControlID="StockQtyTextBox"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="StockQtyTextBox" runat="server" Text='<%# Bind("StockQty") %>' />
                    </div>
                    <div>
                        <asp:Label CssClass="adminadd" ID="lblPrice" runat="server" Text="Price: BND$ " AssociatedControlID="PriceTextBox"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    </div>
                    <div>
                        <asp:Label CssClass="adminadd" ID="lblCategory" runat="server" Text="Category: " AssociatedControlID="ddProductCategory"></asp:Label>
                        <asp:DropDownList SelectedValue='<%# Bind("CategoryId") %>' CssClass="admininput" ID="ddProductCategory" runat="server" DataSourceID="ddcategoryds" DataTextField="CategoryName" DataValueField="CategoryId"></asp:DropDownList>
                    </div>
                    <div>
                        <asp:Label CssClass="adminadd" ID="lblCondition" runat="server" Text="Condition: " AssociatedControlID="ConditionTextBox"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="ConditionTextBox" runat="server" Text='<%# Bind("Condition") %>' />
                    </div>
                    <div>
                        <asp:Literal ID="litAddProduct" runat="server"></asp:Literal>
                    </div>
                    <div>
                        <asp:Button CssClass="button" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" OnClientClick="return confirm('New product is added into the system!');"/>
                        <asp:Button CssClass="buttoncancel" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </div>
                </InsertItemTemplate>

                <EditItemTemplate>
                    <div>
                        <asp:Label ID="lblProductName" runat="server" Text="Product Name: " AssociatedControlID="ProductNameTextBox"></asp:Label>
                        <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
                    </div>
                    <div>
                        <asp:Label ID="lblProductDesc" runat="server" Text="Product Description: " AssociatedControlID="ProductDescTextBox"></asp:Label>
                        <asp:TextBox ID="ProductDescTextBox" runat="server" Text='<%# Bind("ProductDesc") %>' />
                    </div>
                    <div>
                        <asp:Label ID="lblStockQty" runat="server" Text="In Stock: " AssociatedControlID="StockQtyTextBox"></asp:Label>
                        <asp:TextBox ID="StockQtyTextBox" runat="server" Text='<%# Bind("StockQty") %>' />
                    </div>
                    <div>
                        <asp:Label ID="lblPrice" runat="server" Text="Price: BND$ " AssociatedControlID="PriceTextBox"></asp:Label>
                        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    </div>
                    <div>
                        <asp:Label ID="lblCategory" runat="server" Text="Category: " AssociatedControlID="ddProductCategory"></asp:Label>
                        <asp:DropDownList SelectedValue='<%# Bind("CategoryId") %>' CssClass="admininput" ID="ddProductCategory" runat="server" DataSourceID="ddcategoryds" DataTextField="CategoryName" DataValueField="CategoryId"></asp:DropDownList>
                    </div>
                    <div>
                        <asp:Label ID="lblCondition" runat="server" Text="Condition: " AssociatedControlID="ConditionTextBox"></asp:Label>
                        <asp:TextBox ID="ConditionTextBox" runat="server" Text='<%# Bind("Condition") %>' />
                    </div>
                    <div>
                        <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </div>
                </EditItemTemplate>

                <ItemTemplate>

                    <div>
                        <asp:Label ID="lblProductName" runat="server" Text="Product Name: " AssociatedControlID="ProductNameTextBox"></asp:Label>
                        <asp:TextBox ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
                    </div>
                    <div>
                        <asp:Label ID="lblProductDesc" runat="server" Text="Product Description: " AssociatedControlID="ProductDescTextBox"></asp:Label>
                        <asp:TextBox ID="ProductDescTextBox" runat="server" Text='<%# Bind("ProductDesc") %>' />

                    </div>
                    <div>
                        <asp:Label ID="lblStockQty" runat="server" Text="In Stock: " AssociatedControlID="StockQtyTextBox"></asp:Label>
                        <asp:TextBox ID="StockQtyTextBox" runat="server" Text='<%# Bind("StockQty") %>' />
                    </div>
                    <div>
                        <asp:Label ID="lblPrice" runat="server" Text="Price: BND$ " AssociatedControlID="PriceTextBox"></asp:Label>
                        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    </div>

                    <div>
                        <asp:Label ID="lblImage" runat="server" Text="Image: " AssociatedControlID="ImageIdTextBox"></asp:Label>
                        <asp:TextBox ID="ImageIdTextBox" runat="server" Text='<%# Bind("ImageId") %>' />
                    </div>

                    <div>
                        <asp:Label ID="lblCategory" runat="server" Text="Category: " AssociatedControlID="ddProductCategory"></asp:Label>
                        <asp:DropDownList SelectedValue='<%# Bind("CategoryId") %>' CssClass="admininput" ID="ddProductCategory" runat="server" DataSourceID="ddcategoryds" DataTextField="CategoryName" DataValueField="CategoryId"></asp:DropDownList>
                    </div>

                    <div>
                        <asp:Label ID="lblCondition" runat="server" Text="Condition: " AssociatedControlID="ConditionTextBox"></asp:Label>
                        <asp:TextBox ID="ConditionTextBox" runat="server" Text='<%# Bind("Condition") %>' />
                    </div>

                    <div>
                        <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </div>
                </ItemTemplate>

            </asp:FormView>

            <asp:SqlDataSource ID="adminsds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>"
                DeleteCommand="DELETE FROM [tbl_products] WHERE [ProductId] = @ProductId"
                InsertCommand="INSERT INTO [tbl_products] ([ProductName], [ProductDesc], [StockQty], [Price], [ImageId], [Condition]) VALUES (@ProductName, @ProductDesc, @StockQty, @Price, @ImageId, @Condition)"
                SelectCommand="SELECT * FROM [tbl_products]"
                UpdateCommand="UPDATE [tbl_products] SET [ProductName] = @ProductName, [ProductDesc] = @ProductDesc, [StockQty] = @StockQty, [Price] = @Price, [ImageId] = @ImageId, [CategoryId] = @CategoryId, [Condition] = @Condition WHERE [ProductId] = @ProductId">
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

            <asp:SqlDataSource ID="ddcategoryds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" SelectCommand="SELECT * FROM [tb_categories]"></asp:SqlDataSource>

        </section>


    </div>
    <!-- add new product -->

    <div class="adminborder grid_12">
        <section>
            <h2 class="login-head welcome-head">Add New Product Category</h2>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="CategoryId" DataSourceID="admincatsds" DefaultMode="Insert" RenderOuterTable="False">
                <EditItemTemplate>

                    <div>
                        <asp:Label CssClass="adminadd" ID="lblcatId" runat="server" Text="New Product Category: " AssociatedControlID="txtProductCategory"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="txtProductCategory" runat="server" Text='<%# Eval("CategoryId") %>'></asp:TextBox>
                    </div>

                    <div>
                        <asp:Label CssClass="adminadd" ID="lblCategoryCode" runat="server" Text="Category Code: " AssociatedControlID="txtCategoryCode"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="txtCategoryCode" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                    </div>


                    <div>
                        <asp:Button CssClass="button" ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        <asp:Button CssClass="buttoncancel" ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </div>
                </EditItemTemplate>


                <InsertItemTemplate>
                    <div>
                        <asp:Label CssClass="adminadd" ID="Label1" runat="server" Text="New Product Category: " AssociatedControlID="txtProductCategory"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="txtProductCategory" runat="server" Text='<%# Eval("CategoryId") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtProductCategory" ValidationExpression="^(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{1,8}$" ErrorMessage="Incorrect format, max of 8 characters, atleast one uppercase and one number"></asp:RegularExpressionValidator>
                    </div>

                    <div>
                        <asp:Label CssClass="lit-panel" ID="Label3" runat="server" Text="Please insert a new category name"></asp:Label>
                        <asp:Label CssClass="adminadd" ID="lblCategoryCode" runat="server" Text="Category Name: " AssociatedControlID="txtCategoryCode"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="txtCategoryCode" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                    </div>

                    <div>
                        <asp:Button CssClass="button" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" OnClientClick="return confirm('New product category is added into the system!');"/>
                        <asp:Button CssClass="buttoncancel" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </div>


                </InsertItemTemplate>
                <ItemTemplate>
                    <div>
                        <asp:Label CssClass="adminadd" ID="Label1" runat="server" Text="New Product Category: " AssociatedControlID="txtProductCategory"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="txtProductCategory" runat="server" Text='<%# Eval("CategoryId") %>'></asp:TextBox>
                    </div>

                    <div>
                        <asp:Label CssClass="adminadd" ID="lblCategoryCode" runat="server" Text="Category Code: " AssociatedControlID="txtCategoryCode"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="txtCategoryCode" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                    </div>

                </ItemTemplate>
            </asp:FormView>
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
            <asp:GridView CssClass="gridtable" ID="GridView2" OnRowDataBound="GridView2_RowDataBound" runat="server" AutoGenerateColumns="False" DataKeyNames="CategoryId" DataSourceID="admincatsds" CellSpacing="-1" GridLines="None">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" ReadOnly="True" SortExpression="CategoryId" />
                    <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                </Columns>
            </asp:GridView>
        </section>
    </div>
    <!-- add product category -->

    <div class="adminborder grid_12">
        <section>
            <h2 class="login-head welcome-head">Add New Image</h2>
            <asp:FormView ID="newimagefv" runat="server" DataKeyNames="ImageId" DataSourceID="newimageds" DefaultMode="Insert" RenderOuterTable="False">
                <EditItemTemplate>
                    <div>
                        <asp:Label ID="lblExtension" runat="server" Text="Extension: " AssociatedControlID="ExtensionTextBox"></asp:Label>
                        <asp:TextBox ID="ExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>' />
                    </div>

                    <div>
                        <asp:Label CssClass="adminadd" ID="lblImagePath" runat="server" Text="Image: "></asp:Label>
                        <asp:FileUpload ID="imageFileUpload" runat="server" />
                    </div>

                    <div>
                        <asp:Label ID="lblWidth" runat="server" Text="Width: " AssociatedControlID="WidthTextBox"></asp:Label>
                        <asp:TextBox ID="WidthTextBox" runat="server" Text='<%# Bind("Width") %>' />
                    </div>

                    <div>
                        <asp:Label ID="lblHeight" runat="server" Text="Height: " AssociatedControlID="HeightTextBox"></asp:Label>
                        <asp:TextBox ID="HeightTextBox" runat="server" Text='<%# Bind("Height") %>' />
                    </div>

                    <div>
                        <asp:Label ID="lblAlt" runat="server" Text="Description: " AssociatedControlID="AltTextTextBox"></asp:Label>
                        <asp:TextBox ID="AltTextTextBox" runat="server" Text='<%# Bind("AltText") %>' />
                    </div>




                    <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div>
                        <asp:Label CssClass="lit-panel" ID="Label2" runat="server" Text="You may insert the extension file of the image such as .png, .jpeg or .gif"></asp:Label>
                        <asp:Label CssClass="adminadd" ID="lblExtension" runat="server" Text="Extension: " AssociatedControlID="ExtensionTextBox"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="ExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>' />
                    </div>

                    <div>
                        <asp:Label CssClass="lit-panel" ID="lblMessage" runat="server" Text="Please rename your image file before uploading into the system to the numbers accordingly to the name of the product ID as indicated at the edit/delete section for example 89.jpg"></asp:Label>
                    </div>

                    <div>
                        <asp:Label CssClass="adminadd" ID="lblImagePath" runat="server" Text="Image: "></asp:Label>
                        <asp:FileUpload ID="imageFileUpload" runat="server" />
                    </div>

                    <div>
                        <asp:Label CssClass="adminadd" ID="lblWidth" runat="server" Text="Width: " AssociatedControlID="WidthTextBox"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="WidthTextBox" runat="server" Text='<%# Bind("Width") %>' />
                    </div>

                    <div>
                        <asp:Label CssClass="adminadd" ID="lblHeight" runat="server" Text="Height: " AssociatedControlID="HeightTextBox"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="HeightTextBox" runat="server" Text='<%# Bind("Height") %>' />
                    </div>

                    <div>
                        <asp:Label CssClass="lit-panel" ID="Label3" runat="server" Text="Please include a descriptive description about the product based on the product appearance and/or type."></asp:Label>
                        <asp:Label CssClass="adminadd" ID="lblAlt" runat="server" Text="Description: " AssociatedControlID="AltTextTextBox"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="AltTextTextBox" runat="server" Text='<%# Bind("AltText") %>' />
                    </div>

                    <asp:Button CssClass="button" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert"  OnClientClick="return confirm('Image is added into the system!');"/>
                    <asp:Button CssClass="buttoncancel" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <div>
                        <asp:Label ID="lblExtension" runat="server" Text="Extension: " AssociatedControlID="ExtensionTextBox"></asp:Label>
                        <asp:TextBox ID="ExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>' />
                    </div>

                    <div>
                        <asp:Label CssClass="adminadd" ID="lblImagePath" runat="server" Text="Image: "></asp:Label>
                        <asp:FileUpload ID="imageFileUpload" runat="server" />
                    </div>

                    <div>
                        <asp:Label ID="lblWidth" runat="server" Text="Width: " AssociatedControlID="WidthTextBox"></asp:Label>
                        <asp:TextBox ID="WidthTextBox" runat="server" Text='<%# Bind("Width") %>' />
                    </div>

                    <div>
                        <asp:Label ID="lblHeight" runat="server" Text="Height: " AssociatedControlID="HeightTextBox"></asp:Label>
                        <asp:TextBox ID="HeightTextBox" runat="server" Text='<%# Bind("Height") %>' />
                    </div>

                    <div>
                        <asp:Label ID="lblAlt" runat="server" Text="Description: " AssociatedControlID="AltTextTextBox"></asp:Label>
                        <asp:TextBox ID="AltTextTextBox" runat="server" Text='<%# Bind("AltText") %>' />
                    </div>

                    <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="newimageds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" DeleteCommand="DELETE FROM [tb_images] WHERE [ImageId] = @ImageId" InsertCommand="INSERT INTO [tb_images] ([Extension], [Width], [Height], [AltText]) VALUES (@Extension, @Width, @Height, @AltText)" SelectCommand="SELECT * FROM [tb_images]" UpdateCommand="UPDATE [tb_images] SET [Extension] = @Extension, [Width] = @Width, [Height] = @Height, [AltText] = @AltText WHERE [ImageId] = @ImageId">
                <DeleteParameters>
                    <asp:Parameter Name="ImageId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Extension" Type="String" />
                    <asp:Parameter Name="Width" Type="Int32" />
                    <asp:Parameter Name="Height" Type="Int32" />
                    <asp:Parameter Name="AltText" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Extension" Type="String" />
                    <asp:Parameter Name="Width" Type="Int32" />
                    <asp:Parameter Name="Height" Type="Int32" />
                    <asp:Parameter Name="AltText" Type="String" />
                    <asp:Parameter Name="ImageId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView OnRowDataBound="newimagegv_RowDataBound" CssClass="gridtable" ID="newimagegv" runat="server" DataSourceID="newimageds" CellSpacing="-1" GridLines="None">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </section>
    </div>
    <!-- add image -->

</asp:Content>
