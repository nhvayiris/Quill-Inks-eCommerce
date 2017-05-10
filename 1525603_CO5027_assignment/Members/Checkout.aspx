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
                    <asp:Repeater ID="rptrCart" runat="server" >
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="product-display grid_10">
                                <div>
                                    <img src="../Images/uploadedimages/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" class="filo" width="300" height="300" alt="" />
                                </div>
                                <div>
                                    <p><%# Eval("ProductName") %></p>
                                    <asp:Label ID="lblPrice" runat="server" Text="BND&#36; "><%#Eval("Price", "{0:##0.00}") %></asp:Label>
                                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity Ordered: "><%#Eval("Quantity") %></asp:Label>
                                    <p class="sale-displaybody">IN STOCK!</p>
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
                            <p>
                                <asp:Label ID="lblSubtotal" CssClass="productLbl-cart-content" runat="server" Text="Subtotal:"></asp:Label><asp:Label ID="lbtotal" runat="server"></asp:Label>
                            </p>
                        </div>
                        <div>
                            <asp:Label ID="lblShipping" CssClass="productLbl-cart-content" runat="server" Text="Shipping cost: BND &#36; 0.00"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="lblGrandTotal" CssClass="productLbl-cart-content" runat="server" Text="Grand Total: "></asp:Label><asp:Label ID="lbGrandTotal" runat="server"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="lblQty" CssClass="productLbl-cart-content" runat="server" Text="Total Quantity: "></asp:Label><asp:Label ID="lblTotalQty" runat="server"></asp:Label>

                        </div>
                        <div>
                            <asp:Button ID="btnPaypalCheckout" runat="server" Text="Proceed with Payment" OnClick="btnPaypalCheckout_Click" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </main>
</asp:Content>
