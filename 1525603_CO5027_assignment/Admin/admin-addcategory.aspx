<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="admin-addcategory.aspx.cs" Inherits="assignment_draft.Admin.addproductcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">

    <main class="main-content">
        <div id="admin-container" class="grid_12">
            <div class="addcomponent">
                <h2 class="login-head welcome-head">Add New Product Category</h2>
                <h3 class=" welcome-head-section">Product Category</h3>
                <asp:Label CssClass="adminadd" ID="lblCategory" runat="server" Text="New Product Category: " AssociatedControlID="txtProductCategory"></asp:Label>
                <asp:TextBox CssClass="admininput" ID="txtProductCategory" runat="server"></asp:TextBox>
            </div>
            <div class="addcomponent">
                <asp:Label CssClass="adminadd" ID="lblCategoryCode" runat="server" Text="Category Code: " AssociatedControlID="txtCategoryCode"></asp:Label>
                <asp:TextBox CssClass="admininput" ID="txtCategoryCode" runat="server"></asp:TextBox>
            </div>

            <div>
                <asp:Button ID="btnSubmit" runat="server" Text="Add New Category" CssClass="button" OnClick="btnSubmit_Click" />
            </div>
            <div>
                                <asp:Button ID="btnBack" runat="server" Text="Back to Admin Page" CssClass="button" OnClick="btnBack_Click" />

            </div>
            <div class="addcomponent">
                <asp:Literal ID="litSubmit" runat="server"></asp:Literal>
                <asp:Literal ID="litResult" runat="server"></asp:Literal>
            </div>

        </div>
    </main>


</asp:Content>
