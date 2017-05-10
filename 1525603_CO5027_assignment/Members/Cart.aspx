<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="assignment_draft.Members.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <main>
        <section class="contentpanel">
            <h2 class="welcome-head-cart">Shopping Cart</h2>

            <asp:LinkButton ID="backbtn" runat="server" OnClick="backbtn_Click">&larr; Back to Product</asp:LinkButton>

            <asp:Repeater runat="server" ID="rptrCart" OnItemCommand="rptrCart_ItemCommand" OnItemDataBound="rptrCart_ItemDataBound">
                <HeaderTemplate>
                    <div>
                        <ul>
                </HeaderTemplate>
                <ItemTemplate>
                    <li class="product-display grid_12">

                        <div class="right-cont">
                            <img src="../Images/uploadedimages/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" id="ImageProduct" class="productImageCart" width="200" height="200" alt="" />
                        </div>
                        <div>
                            <p class="productLbl">
                                ID #
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductId") %>'></asp:Label>
                            </p>
                        </div>
                        <div>
                            <asp:Label ID="lblProdName" CssClass="productLbl" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        </div>
                        <div>
                            <p class="productLbl">
                                GBP &pound;
                                <asp:Label ID="productLblPrice" runat="server" Text=' <%#Eval("Price", "{0:##0.00}") %> '></asp:Label>
                            </p>
                        </div>
                        <div>
                            <p class="productLbl">Quantity: <asp:Label ID="Label1" runat="server" Text=' <%#Eval("Quantity") %> '></asp:Label></p>
                        </div>
                        <div>
                            <asp:LinkButton CommandName="Remove" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "ProductId") %>' ToolTip="Remove product from cart!" CssClass="productLbl" ID="lnkDelete" runat="server">Remove</asp:LinkButton>
                        </div>
                    </li>

                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                    </div>
                    <asp:Label CssClass="productLbl" ID="lblEmptyItem" runat="server" Text="There are no items in cart!" Visible="false"></asp:Label>
                </FooterTemplate>
            </asp:Repeater>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>"
                DeleteCommand="DELETE FROM [tb_Cart] WHERE [CartId] = @original_CartId AND [ClientId] = @original_ClientId AND [ProductId] = @original_ProductId AND [Quantity] = @original_Quantity AND [Extension] = @original_Extension">
                <DeleteParameters>
                    <asp:Parameter Name="original_CartId" Type="Int32" />
                    <asp:Parameter Name="original_ClientId" Type="String" />
                    <asp:Parameter Name="original_ProductId" Type="Int32" />
                    <asp:Parameter Name="original_Quantity" Type="Int32" />
                    <asp:Parameter Name="original_Extension" Type="String" />
                </DeleteParameters>
                
            </asp:SqlDataSource>

        </section>
        <asp:Panel runat="server" ID="totalPanel">
            <div class="contentpanel">
                <div>
                    <asp:Button ID="btnShop" CssClass="button" runat="server" OnClick="btnShop_Click" Text="Continue Shopping" />
                </div>
                <div>
                    <asp:Button ID="btnCheckOut" CssClass="button" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" />
                </div>
            </div>
        </asp:Panel>

    </main>


</asp:Content>
