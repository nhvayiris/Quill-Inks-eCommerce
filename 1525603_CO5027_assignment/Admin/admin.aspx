<%@ Page Title="Admin | Quill & Inks" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="assignment_draft.Admin.admin_defaultpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <section class="adminpage">
        <h2 class="head-title welcome-head">Welcome admin!</h2>
        <h3 class="welcome-head-section">Don't forget to log out after you have done with your work!</h3>
    </section>

    <div>
        <ul class="admin-nav">
            <li>Admin Features: </li>
            <li><a href="../Admin/admin.aspx?Manage=AllRecords">Show All Records</a></li>
            <li><a href="../Admin/admin.aspx?Manage=Product">Product</a></li>
            <li><a href="../Admin/admin.aspx?Manage=Category">Category</a></li>
            <li><a href="../Admin/admin.aspx?Manage=Image">Image</a></li>
        </ul>
    </div>

    <asp:Panel ID="Panel1" runat="server">
        <asp:Repeater ID="rptrShowAllRecord" runat="server" DataSourceID="showalladminds">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>

                <li class="product-display">
                    <a href="#" class="planners">
                        <img src="../Images/uploadedimages/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" class="filo" width="300" height="300" alt="This is an image of a <%#Eval("AltText") %>" /></a>
                    <p class="sale-displayhead"><%# Eval("ProductName") %></p>
                    <p class="sale-displaybody">GBP &pound; <%#Eval("Price", "{0:##0.00}") %></p>
                </li>

            </ItemTemplate>
            <FooterTemplate></ul></FooterTemplate>
        </asp:Repeater>
        <asp:SqlDataSource ID="showalladminds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" SelectCommand="SELECT tbl_products.ProductId, tbl_products.IsOnSale, tbl_products.ImageId, tbl_products.Condition, tb_images.Extension, tb_images.AltText, tbl_products.ProductName, tbl_products.ProductDesc, tbl_products.StockQty, tbl_products.Price, tb_categories.CategoryName
FROM tbl_products
INNER JOIN tb_images 
ON tbl_products.ImageId = tb_images.ImageId 
INNER JOIN tb_categories 
ON tbl_products.CategoryId = tb_categories.CategoryId "></asp:SqlDataSource>
    </asp:Panel>
    <!-- show all records panel -->

    <asp:Panel ID="AdminProductPanel" runat="server">
        <div class="adminborder grid_12">
            <div>
                <h2 class="login-head welcome-head">Add New Product</h2>

                <asp:FormView ID="addformview" OnItemCommand="addformview_ItemCommand" runat="server" DataKeyNames="ProductId" DataSourceID="adminsds" DefaultMode="Insert" RenderOuterTable="False" OnItemUpdated="addformview_ItemUpdated">

                    <InsertItemTemplate>
                        <div>
                            <asp:Label CssClass="adminadd" ToolTip="Product name" ID="lblProductName" runat="server" Text="Product Name: " AssociatedControlID="ProductNameTextBox"></asp:Label>
                            <asp:TextBox CssClass="admininput" ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
                            <asp:RequiredFieldValidator ID="reqProdVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="ProductNameTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        </div>

                        <div>
                            <asp:Label CssClass="adminadd" ToolTip="Description of product" ID="lblProductDesc" runat="server" Text="Product Description: " AssociatedControlID="ProductDescTextBox"></asp:Label>
                            <asp:TextBox CssClass="admininput" ID="ProductDescTextBox" TextMode="MultiLine" runat="server" Text='<%# Bind("ProductDesc") %>' />
                            <asp:RequiredFieldValidator ID="reqProdDescVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="ProductDescTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:Label CssClass="adminadd" ToolTip="Number of stock available" ID="lblStockQty" runat="server" Text="Quantity in Stock: " AssociatedControlID="StockQtyTextBox"></asp:Label>
                            <asp:TextBox CssClass="admininput" ID="StockQtyTextBox" runat="server" Text='<%# Bind("StockQty") %>' />
                            <asp:RequiredFieldValidator ID="reqStockQty" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="StockQtyTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:Label CssClass="adminadd" ToolTip="Price per item" ID="lblPrice" runat="server" Text="Price: GBP &pound; " AssociatedControlID="PriceTextBox"></asp:Label>
                            <asp:TextBox CssClass="admininput" ID="PriceTextBox" runat="server" Text='<%# Bind("Price" ,"{0:##0.00}") %>' />
                            <asp:RequiredFieldValidator ID="reqPriceVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="PriceTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regWidthValid" runat="server" CssClass="lit-panel adminvalid" ControlToValidate="PriceTextBox" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ErrorMessage="Please enter the correct format, number followed by 2 decimal place i.e. 30.99"></asp:RegularExpressionValidator>
                        </div>
                        <div>
                            <asp:Label CssClass="adminadd" ToolTip="Select a category" ID="lblCategory" runat="server" Text="Category: " AssociatedControlID="ddProductCategory"></asp:Label>
                            <asp:DropDownList SelectedValue='<%# Bind("CategoryId") %>' CssClass="admininput" ID="ddProductCategory" runat="server" DataSourceID="ddcategoryds" DataTextField="CategoryName" DataValueField="CategoryId"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="reqCateVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="ddProductCategory" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:Label CssClass="adminadd" ToolTip="Condition of the item e.g Brand New, Limited, Used etc" ID="lblCondition" runat="server" Text="Condition: " AssociatedControlID="ConditionTextBox"></asp:Label>
                            <asp:TextBox CssClass="admininput" ToolTip="Condition of the item e.g Brand New, Limited, Used etc" ID="ConditionTextBox" runat="server" Text='<%# Bind("Condition") %>' />
                            <asp:RequiredFieldValidator ID="reqCondVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="ConditionTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:Literal ID="litAddProduct" runat="server"></asp:Literal>
                        </div>
                        <div>
                            <asp:Button CssClass="button" ID="InsertButton" OnClick="InsertButton_Click" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="save" />
                            <asp:Button CssClass="buttoncancel" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </div>
                    </InsertItemTemplate>

                    <EditItemTemplate>
                        <div>
                            <asp:Label CssClass="adminadd" ToolTip="Product name" ID="lblProductName" runat="server" Text="Product Name: " AssociatedControlID="ProductNameTextBox"></asp:Label>
                            <asp:TextBox CssClass="admininput" ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
                            <asp:RequiredFieldValidator ID="reqProdVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="ProductNameTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        </div>

                        <div>
                            <asp:Label CssClass="adminadd" ToolTip="Description of product" ID="lblProductDesc" runat="server" Text="Product Description: " AssociatedControlID="ProductDescTextBox"></asp:Label>
                            <asp:TextBox CssClass="admininput" ID="ProductDescTextBox" TextMode="MultiLine" runat="server" Text='<%# Bind("ProductDesc") %>' />
                            <asp:RequiredFieldValidator ID="reqProdDescVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="ProductDescTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:Label CssClass="adminadd" ToolTip="Number of stock available" ID="lblStockQty" runat="server" Text="Quantity in Stock: " AssociatedControlID="StockQtyTextBox"></asp:Label>
                            <asp:TextBox CssClass="admininput" ID="StockQtyTextBox" runat="server" Text='<%# Bind("StockQty") %>' />
                            <asp:RequiredFieldValidator ID="reqStockQty" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="StockQtyTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:Label CssClass="adminadd" ToolTip="Price per item" ID="lblPrice" runat="server" Text="Price: GBP &pound; " AssociatedControlID="PriceTextBox"></asp:Label>
                            <asp:TextBox CssClass="admininput" ID="PriceTextBox" runat="server" Text='<%# Bind("Price" ,"{0:##0.00}") %>' />
                            <asp:RequiredFieldValidator ID="reqPriceVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="PriceTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regWidthValid" runat="server" CssClass="lit-panel adminvalid" ControlToValidate="PriceTextBox" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ErrorMessage="Please enter the correct format, number followed by 2 decimal place i.e. 30.99"></asp:RegularExpressionValidator>
                        </div>
                        <div>
                            <asp:Label CssClass="adminadd" ToolTip="Select a category" ID="lblCategory" runat="server" Text="Category: " AssociatedControlID="ddProductCategory"></asp:Label>
                            <asp:DropDownList SelectedValue='<%# Bind("CategoryId") %>' CssClass="admininput" ID="ddProductCategory" runat="server" DataSourceID="ddcategoryds" DataTextField="CategoryName" DataValueField="CategoryId"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="reqCateVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="ddProductCategory" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:Label CssClass="adminadd" ToolTip="Condition of the item e.g Brand New, Limited, Used etc" ID="lblCondition" runat="server" Text="Condition: " AssociatedControlID="ConditionTextBox"></asp:Label>
                            <asp:TextBox CssClass="admininput" ToolTip="Condition of the item e.g Brand New, Limited, Used etc" ID="ConditionTextBox" runat="server" Text='<%# Bind("Condition") %>' />
                            <asp:RequiredFieldValidator ID="reqCondVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="ConditionTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <asp:Literal ID="litAddProduct" runat="server"></asp:Literal>
                        </div>
                        <div>
                            <asp:Button ID="UpdateButton" CssClass="button" runat="server" CausesValidation="True" ValidationGroup="save" CommandName="Update" Text="Update" />
                            <asp:Button ID="UpdateCancelButton" CssClass="buttoncancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
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
                    SelectCommand="SELECT * FROM [tbl_products]" DeleteCommand="DELETE FROM [tbl_products] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [tbl_products] ([ProductName], [ProductDesc], [StockQty], [Price], [ImageId], [CategoryId], [Condition], [IsOnSale], [StockCondition]) VALUES (@ProductName, @ProductDesc, @StockQty, @Price, @ImageId, @CategoryId, @Condition, @IsOnSale, @StockCondition)" UpdateCommand="UPDATE [tbl_products] SET [ProductName] = @ProductName, [ProductDesc] = @ProductDesc, [StockQty] = @StockQty, [Price] = @Price, [ImageId] = @ImageId, [CategoryId] = @CategoryId, [Condition] = @Condition, [IsOnSale] = @IsOnSale, [StockCondition] = @StockCondition WHERE [ProductId] = @ProductId">
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
                        <asp:Parameter Name="IsOnSale" Type="Boolean" />
                        <asp:Parameter Name="StockCondition" Type="Boolean" />
                    </InsertParameters>

                    <UpdateParameters>
                        <asp:Parameter Name="ProductName" Type="String" />
                        <asp:Parameter Name="ProductDesc" Type="String" />
                        <asp:Parameter Name="StockQty" Type="Int32" />
                        <asp:Parameter Name="Price" Type="Decimal" />
                        <asp:Parameter Name="ImageId" Type="Int32" />
                        <asp:Parameter Name="CategoryId" Type="String" />
                        <asp:Parameter Name="Condition" Type="String" />
                        <asp:Parameter Name="IsOnSale" Type="Boolean" />
                        <asp:Parameter Name="StockCondition" Type="Boolean" />
                        <asp:Parameter Name="ProductId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="ddcategoryds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" SelectCommand="SELECT * FROM [tb_categories]"></asp:SqlDataSource>

            </div>
        </div>
        <div class="adminborder grid_12">

            <div>
                <h2 class="login-head welcome-head">Manage Products</h2>
                <asp:GridView OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" CssClass="gridtable" ID="GridView1" runat="server" DataKeyNames="ProductId" DataSourceID="adminsds" CellSpacing="-1" GridLines="None" AutoGenerateColumns="False">
                    <Columns>

                        <asp:BoundField DataField="ProductDesc" HeaderText="Description" />
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                        <asp:BoundField DataField="Price" DataFormatString="£{0:###,###,###.00}" HeaderText="Price" />
                        <asp:BoundField DataField="Condition" HeaderText="Condition" />
                        <asp:BoundField DataField="StockQty" HeaderText="In Stock" />
                        <asp:BoundField DataField="ProductId" HeaderText="Image Id" />
                        <asp:BoundField DataField="CategoryId" HeaderText="Category Id" />
                        <asp:BoundField DataField="StockCondition" HeaderText="In Stock" />
                        <asp:CommandField ShowDeleteButton="true" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbEdit"  CommandName="Select" runat="server">Edit</asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <div class="adminborder grid_12">
            <asp:FormView ID="editFV" runat="server" DataKeyNames="ProductId" DataSourceID="adminsds" DefaultMode="Edit" RenderOuterTable="False">



                <EditItemTemplate>
                    <div>
                        <asp:Label CssClass="adminadd" ToolTip="Product name" ID="lblProductName" runat="server" Text="Product Name: " AssociatedControlID="ProductNameTextBox"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="ProductNameTextBox" runat="server" Text='<%# Bind("ProductName") %>' />
                        <asp:RequiredFieldValidator ID="reqProdVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="ProductNameTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                    </div>

                    <div>
                        <asp:Label CssClass="adminadd" ToolTip="Description of product" ID="lblProductDesc" runat="server" Text="Product Description: " AssociatedControlID="ProductDescTextBox"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="ProductDescTextBox" TextMode="MultiLine" runat="server" Text='<%# Bind("ProductDesc") %>' />
                        <asp:RequiredFieldValidator ID="reqProdDescVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="ProductDescTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:Label CssClass="adminadd" ToolTip="Number of stock available" ID="lblStockQty" runat="server" Text="Quantity in Stock: " AssociatedControlID="StockQtyTextBox"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="StockQtyTextBox" runat="server" Text='<%# Bind("StockQty") %>' />
                        <asp:RequiredFieldValidator ID="reqStockQty" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="StockQtyTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:Label CssClass="adminadd" ToolTip="Price per item" ID="lblPrice" runat="server" Text="Price: GBP &pound; " AssociatedControlID="PriceTextBox"></asp:Label>
                        <asp:TextBox CssClass="admininput" ID="PriceTextBox" runat="server" Text='<%# Bind("Price" ,"{0:##0.00}") %>' />
                        <asp:RequiredFieldValidator ID="reqPriceVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="PriceTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regWidthValid" runat="server" CssClass="lit-panel adminvalid" ControlToValidate="PriceTextBox" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ErrorMessage="Please enter the correct format, number followed by 2 decimal place i.e. 30.99"></asp:RegularExpressionValidator>
                    </div>
                    <div>
                        <asp:Label CssClass="adminadd" ToolTip="Select a category" ID="lblCategory" runat="server" Text="Category: " AssociatedControlID="ddProductCategory"></asp:Label>
                        <asp:DropDownList SelectedValue='<%# Bind("CategoryId") %>' CssClass="admininput" ID="ddProductCategory" runat="server" DataSourceID="ddcategoryds" DataTextField="CategoryName" DataValueField="CategoryId"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="reqCateVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="ddProductCategory" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:Label CssClass="adminadd" ToolTip="Condition of the item e.g Brand New, Limited, Used etc" ID="lblCondition" runat="server" Text="Condition: " AssociatedControlID="ConditionTextBox"></asp:Label>
                        <asp:TextBox CssClass="admininput" ToolTip="Condition of the item e.g Brand New, Limited, Used etc" ID="ConditionTextBox" runat="server" Text='<%# Bind("Condition") %>' />
                        <asp:RequiredFieldValidator ID="reqCondVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="ConditionTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                    </div>
                    <div>
                        <asp:Literal ID="litAddProduct" runat="server"></asp:Literal>
                    </div>
                    <div>
                        <asp:Button ID="UpdateButton" CssClass="button" runat="server" CausesValidation="True" ValidationGroup="save" CommandName="Update" Text="Update" />
                        <asp:Button ID="UpdateCancelButton" CssClass="buttoncancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
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
        </div>
        <div class="adminborder grid_12">
            <asp:GridView CssClass="gridtable" ID="editGV" runat="server" DataKeyNames="ProductId" DataSourceID="adminsds" CellSpacing="-1" GridLines="None" AutoGenerateColumns="False">
                <Columns>

                    <asp:CommandField ShowSelectButton="True" />

                    <asp:BoundField DataField="ProductDesc" HeaderText="Description" />
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="Price" DataFormatString="£{0:###,###,###.00}" HeaderText="Price" />
                    <asp:BoundField DataField="Condition" HeaderText="Condition" />
                    <asp:BoundField DataField="StockQty" HeaderText="In Stock" />
                    <asp:BoundField DataField="ProductId" HeaderText="Image Id" />
                    <asp:BoundField DataField="CategoryId" HeaderText="Category Id" />
                    <asp:BoundField DataField="StockCondition" HeaderText="In Stock" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbEdit" CommandName="Edit" runat="server">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>


    </asp:Panel>
    <!-- product panel -->

    <asp:Panel ID="AdminCategoryPanel" runat="server">
        <div class="adminborder grid_12">
            <div>
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
                            <asp:RequiredFieldValidator ID="reqCatIdVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="txtProductCategory" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtProductCategory" ValidationExpression="^(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{1,8}$" ErrorMessage="Incorrect format, max of 8 characters, atleast one uppercase and one number"></asp:RegularExpressionValidator>
                        </div>

                        <div>
                            <asp:Label CssClass="adminadd" ID="lblCategoryCode" runat="server" Text="Category Name: " AssociatedControlID="txtCategoryCode"></asp:Label>
                            <asp:TextBox CssClass="admininput" ID="txtCategoryCode" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqCatVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="txtCategoryCode" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        </div>

                        <div>
                            <asp:Button CssClass="button" ID="InsertButton" runat="server" ValidationGroup="save" CausesValidation="True" CommandName="Insert" Text="Insert" />
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

            </div>
        </div>
        <div class="adminborder grid_12">
            <div>
                <asp:GridView CssClass="gridtable" ID="GridView2" OnRowDataBound="GridView2_RowDataBound" runat="server" AutoGenerateColumns="False" DataKeyNames="CategoryId" DataSourceID="admincatsds" CellSpacing="-1" GridLines="None">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" ReadOnly="True" SortExpression="CategoryId" />
                        <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <!-- add product category -->
    </asp:Panel>
    <!-- category panel -->

    <asp:Panel ID="AdminImagePanel" runat="server">
        <div class="adminborder grid_12">
            <div>
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
                            <asp:Label ID="lblExtension" ToolTip="Image extension files e.g .jpg" CssClass="adminadd" runat="server" Text="Extension: " AssociatedControlID="ExtensionTextBox"></asp:Label>
                            <asp:TextBox ID="ExtensionTextBox" ToolTip="Image extension files e.g .jpg" CssClass="admininput" runat="server" Text='<%# Bind("Extension") %>' />
                            <asp:RequiredFieldValidator ID="reqExtVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="ExtensionTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        </div>

                        <div>
                            <asp:Label CssClass="adminadd" ToolTip="Select Images with extension files such as .jpg" ID="lblImagePath" runat="server" Text="Image: "></asp:Label>
                            <asp:FileUpload ID="imageFileUpload" ToolTip="Select Images with extension files such as .jpg" CssClass="admininput" runat="server" />
                            <asp:RequiredFieldValidator ID="reqImgVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="imageFileUpload" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        </div>

                        <div>
                            <asp:Label ID="lblWidth" CssClass="adminadd" ToolTip="Width of image, must be an integer" runat="server" Text="Width: " AssociatedControlID="WidthTextBox"></asp:Label>
                            <asp:TextBox ID="WidthTextBox" runat="server" ToolTip="Width of image, must be an integer" CssClass="admininput" Text='<%# Bind("Width") %>' />
                            <asp:RequiredFieldValidator ID="reqWidthVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="WidthTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regWidthValid" runat="server" CssClass="lit-panel adminvalid" ControlToValidate="WidthTextBox" ValidationExpression="^\d+$" ErrorMessage="Only numbers are allowed!"></asp:RegularExpressionValidator>
                        </div>

                        <div>
                            <asp:Label ID="lblHeight" CssClass="adminadd" ToolTip="Height of image, must be an integer" runat="server" Text="Height: " AssociatedControlID="HeightTextBox"></asp:Label>
                            <asp:TextBox ID="HeightTextBox" runat="server" ToolTip="Height of image, must be an integer" CssClass="admininput" Text='<%# Bind("Height") %>' />
                            <asp:RequiredFieldValidator ID="reqHeightVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="HeightTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regHeightValid" runat="server" CssClass="lit-panel adminvalid" ControlToValidate="HeightTextBox" ValidationExpression="^\d+$" ErrorMessage="Only numbers are allowed!"></asp:RegularExpressionValidator>
                        </div>
                        <div>
                        <asp:Label ID="lblAlt" CssClass="adminadd" ToolTip="Alternative text for screen readers to aid people with visual disabilities" runat="server" Text="Description: " AssociatedControlID="AltTextTextBox"></asp:Label>
                        <asp:TextBox ID="AltTextTextBox" runat="server" ToolTip="Alternative text for screen readers to aid people with visual disabilities" CssClass="admininput" Text='<%# Bind("AltText") %>' />
                        <asp:RequiredFieldValidator ID="reqAltTextVal" CssClass="lit-panel adminvalid" ValidationGroup="save" ControlToValidate="AltTextTextBox" runat="server" ErrorMessage="This field is cannot be empty!"></asp:RequiredFieldValidator>
                        </div>

                        <asp:Button CssClass="button" ID="InsertButton" runat="server" ValidationGroup="save" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        <asp:Button CssClass="buttoncancel" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>

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

            </div>
        </div>
        <div class="adminborder grid_12">
            <div>
                <asp:GridView OnRowDataBound="newimagegv_RowDataBound" CssClass="gridtable" ID="newimagegv" runat="server" DataSourceID="newimageds" CellSpacing="-1" GridLines="None">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <!-- add image -->
    </asp:Panel>
    <!-- image panel -->


</asp:Content>
