<%@ Page Title="Login/Register | Quill & Inks" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="assignment_draft.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">

    <main class="main-content">
        <!-- start login -->
       

        <div class="loginWrapper grid_5" id="LogMasuk">
            <h2 class="login-head welcome-head">Login</h2>
            <div class="logininnerwrapper tabcontent">
                <div>
                    <asp:Label CssClass="contact-label" ID="lblUsername" runat="server" Text="Username:"></asp:Label>
                    <asp:TextBox CssClass="contact-input" ID="txtLoginUser" runat="server"></asp:TextBox>
                </div>

                <div>
                    <asp:Label CssClass="contact-label" ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                    <asp:TextBox CssClass="contact-input" ID="txtLoginPassword" runat="server" TextMode="Password"></asp:TextBox>
                </div>

                <asp:Button CssClass="buttonlogin" ID="btnLogin" runat="server" Text="Log In" OnClick="btnLogin_Click" />
                <div class="loginpanel">
                    <asp:Literal ID="litLoginError" runat="server"></asp:Literal>
                </div>
            </div>
        </div>

        <div class="loginWrapper grid_5" id="Register">
            <h2 class="login-head welcome-head">Register</h2>
            <div class="logininnerwrapper">
                <div>
                    <asp:Label CssClass="contact-label" ID="lblEmail" runat="server" Text="Username: "></asp:Label><asp:TextBox CssClass="contact-input" ID="tbRegusername" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Reqfieldregvalid" runat="server" ErrorMessage="This field cannot be empty!" ControlToValidate="tbRegusername" ValidationGroup="save" CssClass="lit-panel"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label CssClass="contact-label" ID="lblRegPassword" runat="server" Text="Password: "></asp:Label><asp:TextBox CssClass="contact-input" ID="tbRegPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Reqfieldpassvalid" runat="server" ErrorMessage="This field cannot be empty!" ControlToValidate="tbRegPassword" ValidationGroup="save" CssClass="lit-panel"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Label CssClass="contact-label" ID="lblconfirm" runat="server" Text="Confirm Password:"></asp:Label>
                    <asp:TextBox CssClass="contact-input" ID="tbconfirm" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match!" ControlToValidate="tbRegPassword" ControlToCompare="tbconfirm" CssClass="lit-panel"></asp:CompareValidator>
                    <asp:RegularExpressionValidator ValidationGroup="save" ID="RegularExprPassValid" Display="Dynamic" runat="server" ControlToValidate="tbRegPassword" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}" CssClass="lit-panel" ErrorMessage="Incorrect password format. Passwords must be at least 8 characters in length, contain at least one uppercase character, at least one lower case character, atleast one special character and at least one number. E.g. P@55word"></asp:RegularExpressionValidator><!-- Srinivas, 2014 from http://stackoverflow.com/questions/19605150/regex-for-password-must-be-contain-at-least-8-characters-least-1-number-and-bot -->
                </div>
                <asp:Button ValidationGroup="save" CssClass="buttonlogin" ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" />
                <div class="loginpanel">
                    <asp:Literal ID="litRegister" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </main>
</asp:Content>
