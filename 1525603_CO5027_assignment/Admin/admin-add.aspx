<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="admin-add.aspx.cs" Inherits="assignment_draft.Admin.addproducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
    
   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <main class="main-content">
        <div id="admin-container" class="grid_12">
        <div class="addcomponent">
            <h2 class="login-head welcome-head">Add New Product</h2>
            <h3 class=" welcome-head-section">Product Name &amp; Category</h3>
            <asp:Label CssClass="adminadd" ID="lblProductName" runat="server" Text="Product Name: " AssociatedControlID="txtProductName"></asp:Label><asp:TextBox CssClass="admininput"  ID="txtProductName" runat="server" ></asp:TextBox>
        </div>
        <div>
            <asp:Label CssClass="adminadd" ID="lblProductCategory" runat="server" Text="Category: " AssociatedControlID="ddProductCategory"></asp:Label>
            <asp:DropDownList CssClass="admininput"  ID="ddProductCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryId"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:qiwebcon %>" SelectCommand="SELECT * FROM [tb_categories]"></asp:SqlDataSource>

        </div>
        <div class="addcomponent">
            <h3 class=" welcome-head-section">Image</h3>
            <div>
                <asp:Label CssClass="adminadd" ID="lblImagePath" runat="server" Text="Image: "></asp:Label>
                <asp:FileUpload ID="imageFileUpload" runat="server" />
            </div>
                
            <div>
                <asp:Label CssClass="adminadd" ID="lblAltText" runat="server" Text="Image Description: "></asp:Label>
                <asp:TextBox CssClass="admininput" ID="txtAltText" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
            
            <div >
                <asp:Image ID="CurrentImg" runat="server" />
            </div>
        </div>
        <div class="addcomponent">
            <h3 class=" welcome-head-section">Price Per Unit</h3>
            <asp:Label CssClass="adminadd" ID="lblPrice" runat="server" Text="Price: " AssociatedControlID="txtPrice"></asp:Label>
            <asp:TextBox CssClass="admininput" ID="txtPrice" runat="server"></asp:TextBox>
        </div>
        <div class="addcomponent">
            <h3 class=" welcome-head-section">Product Description</h3>
            <asp:Label CssClass="adminadd" ID="lbldesc" runat="server" Text="Description: " AssociatedControlID="txtDescription"></asp:Label>
            <asp:TextBox CssClass="admininput" ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="addcomponent">
            <h3 class=" welcome-head-section">Amount in stock</h3>
            <asp:Label CssClass="adminadd" ID="lblStock" runat="server" Text="Stock Quantity: " AssociatedControlID="txtStock"></asp:Label>
            <asp:TextBox CssClass="admininput" ID="txtStock" runat="server" TextMode="singleline"></asp:TextBox>
        </div>
        <div class="addcomponent">
            <h3 class=" welcome-head-section">Condition of the product</h3>
            <asp:Label CssClass="adminadd" ID="lblCondition" runat="server" Text="Condition: " AssociatedControlID="txtCondition"></asp:Label>
            <asp:TextBox CssClass="admininput" ID="txtCondition" runat="server" TextMode="Singleline"></asp:TextBox>
        </div>
        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="Add Product" CssClass="button" OnClick="btnSubmit_Click" />
        </div>
        <div >
            <asp:Literal ID="litSubmit" runat="server"></asp:Literal>
            <asp:Literal ID="litResult" runat="server"></asp:Literal>
        </div>
    </div>
    </main>
    

</asp:Content>
