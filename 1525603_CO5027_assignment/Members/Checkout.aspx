<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="assignment_draft.Members.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <main>
        <div class="OrderSummary">
            <h2 class="welcome-head-cart ">Order Confirmation</h2>
            <asp:Literal ID="litError" runat="server"></asp:Literal>



            <asp:Panel ID="pnlCheckout" runat="server">
                <h2 class="welcome-head">Ordered Items for checkout!</h2>
                <div class="checkOut">
                    <asp:Repeater ID="rptrCart" runat="server">
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="product-display grid_10">
                                <div>
                                    <img src="../Images/uploadedimages/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" class="filo" width="180" height="180" alt="" />
                                </div>
                                <div class="cart-item">
                                    <div>
                                        <p class="sale-displayhead"><%# Eval("ProductName") %></p>
                                    </div>
                                    <div>
                                        <asp:Label ID="lblPrice" CssClass="sale-displayhead" runat="server" Text="GBP &pound; "><%#Eval("Price", "{0:##0.00}") %></asp:Label>
                                    </div>
                                    <div>
                                        <asp:Label ID="lblQuantity" CssClass="sale-displayhead" runat="server" Text="Quantity Ordered: "><%#Eval("Quantity") %></asp:Label>
                                    </div>
                                </div>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate></ul></FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="left-cont">
                    <div class="orderTotalcart grid_4">
                        <div>
                            <asp:Label ID="lblSummary" CssClass="productLbl-cart" runat="server" Text="Order Summary"></asp:Label>
                        </div>
                        <div>
                            <p class="productLbl-cart-content">
                                Subtotal: GBP &pound;
                                <asp:Label ID="lbtotal" CssClass="sale-displayhead" runat="server"></asp:Label>
                            </p>
                            <asp:Label ID="lblShipping" CssClass="productLbl-cart-content" runat="server" Text="Shipping cost: GBP &pound; 0.00"></asp:Label>
                        </div>
                        <div>
                            <p class="productLbl-cart-content">
                                Grand Total: GBP &pound;
                                <asp:Label ID="lbGrandTotal" CssClass="sale-displayhead" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div>
                            <p class="productLbl-cart-content">
                                Total Items In Cart:
                                <asp:Label ID="lblTotalQty" CssClass="sale-displayhead" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div>
                            <asp:Button ID="btnPaypalCheckout" CssClass="button-cart" runat="server" Text="Proceed with Payment" OnClick="btnPaypalCheckout_Click" />
                        </div>
                    </div>

                </div>
            </asp:Panel>
        </div>
    </main>
</asp:Content>
