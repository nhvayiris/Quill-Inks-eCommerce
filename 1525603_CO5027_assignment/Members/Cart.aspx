<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="assignment_draft.Members.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">

    <main>

        <asp:Panel ID="pnlShoppingCart" runat="server">
    </asp:Panel>
        <table>
            <tr>
                <td>
                    <b>Total: </b>
                </td>
                <td>
                    <asp:Literal ID="litTotal" runat="server" Text=""></asp:Literal>
                </td>
            </tr>

            <tr>
                <td>
                    <b>Vat: </b>
                </td>
                <td>
                    <asp:Literal ID="litVat" runat="server" Text="" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Shipping: </b>
                </td>
                <td>
                    £ 15
                </td>
            </tr>

            <tr>
                <td>
                    <b>Total Amount: </b>
                </td>
                <td>
                    <asp:Literal ID="litTotalAmount" runat="server" Text="" />
                </td>
            </tr>

            <tr>
                <td>
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Index.aspx" OnClick="LinkButton1_Click">Continue Shopping</asp:LinkButton> &nbsp;&nbsp; or                     
                    <asp:Button ID="Button3" runat="server" Text="Check Out" CssClass="button" Width="250px" PostBackUrl="~/Pages/Success.aspx" />

                    <br />

                    <asp:LinkButton ID="litPaypal" Text="" runat="server" />
                </td>
            </tr>

        </table>



        <section class="contentpanel">
            <h2>Shopping Cart</h2>
            <asp:Repeater ID="rptrCart" runat="server" DataSourceID="cartds">
                <HeaderTemplate>
                    <ul>
                </HeaderTemplate>
                <ItemTemplate>
                    <li>
                        <div>
                            <img src="Images/uploadedimages/<%# DataBinder.Eval (Container.DataItem, "ImageId") %><%#DataBinder.Eval(Container.DataItem,"Extension") %>" class="filo" width="300" height="300" alt="This is an image of a <%#Eval("AltText") %>" />
                        </div>
                        <div>
                            <p class="sale-displayhead"><%# DataBinder.Eval (Container.DataItem,"ProductName") %></p>
                            <p class="sale-displayhead">BND&#36; <%#DataBinder.Eval (Container.DataItem,"Price") %></p>
                            <p class="sale-displayhead">Quantity Available: <%#DataBinder.Eval (Container.DataItem,"StockQty") %></p>
                            <asp:Button ID="Button1" runat="server" Text="Update Cart" /><asp:Button ID="Button2" runat="server" Text="Remove" />
                            <p class="sale-displayhead">
                                Select Quantity:
                                <asp:DropDownList runat="server" ID="ddStockQty" CssClass="qty" DataTextField="StockQty" DataValueField="StockQty">
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
                            </p>
                            <p class="sale-displaybody">IN STOCK!</p>
                        </div>
                    </li>
                </ItemTemplate>
                <FooterTemplate></ul></FooterTemplate>
            </asp:Repeater>

            <asp:SqlDataSource ID="cartds" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" SelectCommand="SELECT tbl_products.*, tb_images.ImageId, tb_images.Extension, tb_images.AltText, tb_categories.CategoryName 
FROM tb_categories 
INNER JOIN tbl_products 
ON tb_categories.CategoryId = tbl_products.CategoryId 
INNER JOIN tb_images 
ON tbl_products.ImageId = tb_images.ImageId
WHERE StockCondition = 1"></asp:SqlDataSource>

        </section>
        <section class="contentpanel">
            <div>
                <asp:Button ID="btnShop" runat="server" Text="Continue Shopping" /></div>
            <div>
                <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" /></div>
        </section>
    </main>

</asp:Content>
