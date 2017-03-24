<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="addproducts.aspx.cs" Inherits="assignment_draft.Admin.addproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">

    <div id="admin-product-container">
        <asp:Label ID="lblProductName" runat="server" Text="Product Name: " AssociatedControlID="txtProductName"></asp:Label>
        <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblProductCategory" runat="server" Text="Category: " AssociatedControlID="ddProductCategory"></asp:Label>
        <asp:DropDownList ID="ddProductCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryId"></asp:DropDownList>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebConString %>" SelectCommand="SELECT * FROM [tb_categories]"></asp:SqlDataSource>
        <br />



        <br />



        <asp:Label ID="lblImagePath" runat="server" Text="Image: " AssociatedControlID="ddImagefile"></asp:Label>

        <asp:DropDownList ID="ddImagefile" runat="server"></asp:DropDownList>


        <br />


        <asp:Label ID="lblPrice" runat="server" Text="Price: " AssociatedControlID="txtPrice"></asp:Label>

        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>


        <br />


        <asp:Label ID="lbldesc" runat="server" Text="Description: " AssociatedControlID="txtDescription"></asp:Label>

        <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>



        <br />



        <asp:Button ID="btnSubmit" runat="server" Text="Send" OnClick="btnSubmit_Click" />



        <asp:Literal ID="litSubmit" runat="server"></asp:Literal>
        <asp:Literal ID="litResult" runat="server"></asp:Literal>

    </div>

</asp:Content>
