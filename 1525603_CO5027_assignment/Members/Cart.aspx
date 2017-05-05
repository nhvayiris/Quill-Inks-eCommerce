<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="assignment_draft.Members.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">

    <main>
        <section class="contentpanel">
            <h2>Shopping Cart</h2>

            <asp:LinkButton ID="backbtn" runat="server" OnClick="backbtn_Click">&larr; Back to Product</asp:LinkButton>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CartId" DataSourceID="SqlDataSource1" EmptyDataText="No Item in Cart!" OnRowDataBound="gvCart_RowDataBound">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="ProductName" HeaderText="Product " />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:c}" HtmlEncode="false" />
                    <asp:BoundField DataField="ProductId" HeaderText="ProductId" SortExpression="ProductId" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <img src="Images/uploadedimages/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" width="500" height="500" alt="" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Repeater runat="server" ID="rptrCart" DataSourceID="SqlDataSource1" OnItemDataBound="rptrCart_ItemDataBound">
                <HeaderTemplate>
                    <div>
                </HeaderTemplate>
                <ItemTemplate>
                    <div>
                    <div class="left-cont grid_5">
                        <div>
                            <asp:Label ID="lblProdName" CssClass="productLbl" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </div>
                        <div>
                            <p class="productLbl">BND&#36;
                                <asp:Label ID="productLblPrice" runat="server" Text='<%#Eval("Price", "{0:##0.00}") %>'></asp:Label></p>
                        </div>
                        <div>
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

                    </div>
                    <div class="right-cont grid_6">
                        <img src="../Images/uploadedimages/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" id="ImageProduct" class="productImageCart" width="200" height="200" alt="" />
                    </div>
                    
                    </div>
                </ItemTemplate>
                <FooterTemplate></div>
                    <asp:Label ID="lblEmptyItem" runat="server" Text="There are no items in cart!" Visible="false"></asp:Label>
                </FooterTemplate>
            </asp:Repeater>





            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" DeleteCommand="DELETE FROM [tb_Cart] WHERE [CartId] = @CartId" InsertCommand="INSERT INTO [tb_Cart] ([ClientId], [Price], [ProductId], [IsInBasket], [Quantity], [ImageId], [Extension]) VALUES (@ClientId, @Price, @ProductId, @IsInBasket, @Quantity, @ImageId, @Extension)" SelectCommand="SELECT tb_Cart.*, tbl_products.ProductName, tbl_products.Price, tbl_products.ImageId, tbl_products.CategoryId FROM [tb_Cart] INNER JOIN tbl_products ON tbl_products.ProductId = tb_Cart.ProductId" UpdateCommand="UPDATE [tb_Cart] SET [ClientId] = @ClientId, [Price] = @Price, [ProductId] = @ProductId, [IsInBasket] = @IsInBasket, [Quantity] = @Quantity, [ImageId] = @ImageId, [Extension] = @Extension WHERE [CartId] = @CartId">
                <DeleteParameters>
                    <asp:Parameter Name="CartId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ClientId" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="ProductId" Type="Int32" />
                    <asp:Parameter Name="IsInBasket" Type="Boolean" />
                    <asp:Parameter Name="Quantity" Type="Int32" />
                    <asp:Parameter Name="ImageId" Type="Int32" />
                    <asp:Parameter Name="Extension" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ClientId" Type="String" />
                    <asp:Parameter Name="Price" Type="Decimal" />
                    <asp:Parameter Name="ProductId" Type="Int32" />
                    <asp:Parameter Name="IsInBasket" Type="Boolean" />
                    <asp:Parameter Name="Quantity" Type="Int32" />
                    <asp:Parameter Name="ImageId" Type="Int32" />
                    <asp:Parameter Name="Extension" Type="String" />
                    <asp:Parameter Name="CartId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>



            <div id="price">Total Cost<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></div>



        </section>
        <section class="contentpanel">
            <div>
                <asp:Button ID="btnShop" runat="server" Text="Continue Shopping" />
            </div>
            <div>
                <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" />
            </div>
        </section>
    </main>


</asp:Content>
