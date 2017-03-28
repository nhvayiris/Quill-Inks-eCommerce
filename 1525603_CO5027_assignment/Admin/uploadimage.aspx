<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="uploadimage.aspx.cs" Inherits="assignment_draft.Admin.uploadproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 56%;
        }
        .auto-style3 {
            width: 16%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <div id="upload-images">
        <table>
            <tr>
                <td class="auto-style3">Image: </td>
                <td class="auto-style1"><asp:FileUpload ID="imageFileUpload" runat="server" /></td>
                
                
            </tr>
            <tr>
                <td class="auto-style3"><asp:Label ID="lblAltText" runat="server" Text="Image Description: "></asp:Label></td>
                <td class="auto-style1"> <asp:TextBox ID="txtAltText" runat="server"></asp:TextBox>></td>
                 </tr> 
            <tr>
                <td class="auto-style3"></td>
                <td class="auto-style1"> <asp:Button ID="Button1" runat="server" Text="Button" OnClick="btnUpload_Click" /><br /><asp:Literal ID="litResult" runat="server"></asp:Literal></td>
                
            </tr>
            <tr> <td class="auto-style3"></td>
                <td class="auto-style1"><asp:Image ID="CurrentImg" runat="server" /></td>
                 </tr> 
            
        </table> <br /> <br /> <br /> </div> 
  
</asp:Content>
