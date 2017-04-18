<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="assignment_draft.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">

    <main class="main-content">

        <div class="loginWrapper grid_5">
            <h2 class="login-head welcome-head">Login</h2>
            <div>
                <asp:Label ID="lblUsername" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="txtLoginUser" runat="server"></asp:TextBox>
            </div>

            <div>
                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                <asp:TextBox ID="txtLoginPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>

            <div>
                <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Log In" OnClick="btnLogin_Click" />
            <asp:Literal ID="litLoginError" runat="server"></asp:Literal>

        </div>

        <div class="loginWrapper grid_6">
            <h2 class="login-head welcome-head">Register</h2>

            <div>
                <asp:Label ID="lblEmail" runat="server" Text="Username: "></asp:Label><asp:TextBox ID="tbRegusername" runat="server"></asp:TextBox>

            </div>
            <div>
                <asp:Label ID="lblRegPassword" runat="server" Text="Password: "></asp:Label><asp:TextBox ID="tbRegPassword" runat="server" TextMode="Password"></asp:TextBox>

            </div>

            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
            <asp:Literal ID="litRegister" runat="server"></asp:Literal>

        </div>

    </main>




</asp:Content>
