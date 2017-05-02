<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="assignment_draft.Members.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <main>
        <div class="Order Summary">
            <p class="welcome-head">Order Confirmation</p>
            <asp:Repeater ID="rptrCart" runat="server">
                <HeaderTemplate>
                    <ul>
                </HeaderTemplate>
                <ItemTemplate>
                    <li>
                        <div>
                            <img src="Images/uploadedimages/<%#Eval ("ImageId") %><%#Eval ("Extension") %>" class="filo" width="300" height="300" alt="This is an image of a <%#Eval("AltText") %>" />
                        </div>
                        <div>
                            <p class="sale-displayhead"><%# Eval("ProductName") %></p>
                            <p class="sale-displayhead">BND&#36; <%#Eval("Price") %></p>
                            <p class="sale-displayhead">Quantity Available: <%#Eval("StockQty") %></p>
                            
                            <p class="sale-displaybody">IN STOCK!</p>
                        </div>
                    </li>
                </ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>
            </asp:Repeater>

            <div class="orderTotal">
                <div>
                    <asp:Label ID="lblSummary" runat="server" Text="Order Summary"></asp:Label></div>
                <div>
                    <asp:Label ID="lblSubtotal" runat="server" Text="Subtotal"></asp:Label></div>
                <div>
                    <asp:Label ID="lblShipping" runat="server" Text="Shipping cost: BND &#36; 0.00"></asp:Label></div>
                <div>
                    <asp:Label ID="lblGrandTotal" runat="server" Text="Grand Total: "></asp:Label></div>
            </div>

        </div>

        <asp:Button ID="btnPaypalCheckout" runat="server" Text="Proceed with Payment" />
    </main>
</asp:Content>