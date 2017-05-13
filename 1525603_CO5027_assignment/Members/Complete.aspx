<%@ Page Title="Complete Purchase | Quill & Inks" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="Complete.aspx.cs" Inherits="assignment_draft.Members.Complete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <main>
        <div class="OrderSummary">
            <asp:Panel ID="pnlHead" runat="server">
                <h2 class="welcome-head-cart ">Please Complete your purchase</h2>
            </asp:Panel>
            <asp:Button ID="btnComplete" OnClick="btnComplete_Click" CssClass="button" runat="server" Text="Confirm Purchase" />
            <asp:Panel ID="pnlCompleteShow" runat="server">
                <div id="completeShow">
                    <h2 class="welcome-head">Thank you for your purchase!</h2>
                    <h3 class="welcome-head-section">Your order is now ready for shipment!</h3>
                </div>
            </asp:Panel>


        </div>

    </main>

</asp:Content>
