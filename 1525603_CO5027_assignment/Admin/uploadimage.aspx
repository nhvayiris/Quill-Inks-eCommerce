<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="uploadimage.aspx.cs" Inherits="assignment_draft.Admin.uploadproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div id="upload-images">

        <asp:Label ID="lblAltText" runat="server" Text="Image Description: "></asp:Label><asp:TextBox ID="txtAltText" runat="server"></asp:TextBox>

        <br />
        <asp:Image ID="CurrentImg" runat="server" />
        <br />
        <br />

        <asp:FileUpload ID="imageFileUpload" runat="server" />
        <asp:Button ID="btnUpload" runat="server" Text="Button" OnClick="btnUpload_Click" />
        <asp:Literal ID="litResult" runat="server"></asp:Literal>
    </div>
</asp:Content>
