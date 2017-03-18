<%@ Page Title="Contact | Quill & Inks" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="assignment_draft.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
    <!-- Google maps -->
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyDVhNKCZTY5wLai8clTTqj7c97DaNnR8Sk"></script>
    <script src="Scripts/googlemaps.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <h2><%: Title %> Us!</h2>
    <div id="contact-box">
        <div id="left-content">
            <asp:Panel ID="Panel1" runat="server">
                <h2>Your Voice, We Listen.</h2>
                <div id="contact_form_container">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblContactName" runat="server" Text="Name: "></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtContactName" runat="server" Width="320px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqFieldVal1" runat="server" ErrorMessage="This field cannot be empty!" ControlToValidate="txtContactName" ValidationGroup="save"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblContactMail" runat="server" Text="E-mail: "></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtContactMail" runat="server" Width="320px"></asp:TextBox>
                                <asp:RegularExpressionValidator runat="server" ID="RegExpValid" SetFocusOnError="true" Text="Example: username@samplemail.com"
                                    ControlToValidate="txtContactMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                                    ValidationGroup="save" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblSubject" runat="server" Text="Subject: "></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="ddSubject" runat="server" Height="20px" Width="325px">
                                    <asp:ListItem>--Select--</asp:ListItem>
                                    <asp:ListItem>Ask a question</asp:ListItem>
                                    <asp:ListItem>Customer Support Ticket</asp:ListItem>
                                    <asp:ListItem>Report a bug</asp:ListItem>
                                    <asp:ListItem>Others</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="ReqFieldVal3" runat="server" ErrorMessage="Select a subject!" InitialValue="--Select--" ControlToValidate="ddSubject" ValidationGroup="save"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMessageBox" runat="server" Text="Message: "></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtMessageBox" runat="server" Height="96px" TextMode="MultiLine" Width="320px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ReqFieldVal4" runat="server" ErrorMessage="This field cannot be empty!" ControlToValidate="txtMessageBox" ValidationGroup="save"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAttachment" runat="server" Text="Attachments: "></asp:Label></td>
                            <td>
                                <asp:FileUpload ID="FileUpload" runat="server" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btnSend" runat="server" Text="Submit Enquiry" OnClick="btnSend_Click" ValidationGroup="save" /><asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
                                <br />
                                <br />
                                <asp:Literal ID="litSuccess" runat="server"></asp:Literal>
                                <asp:Literal ID="litFailed" runat="server"></asp:Literal>
                            </td>

                        </tr>

                    </table>
                    <!-- end table -->
                </div>
                <!-- end contact form div -->
            </asp:Panel>

        </div>
        <div id="right-content">
            <h2>Locate Us</h2>
            <!-- google map API to show the location of the store-->
            <div id="map" style="width: 304px; top: 68px; left: 172px; position: absolute; height: 238px">
                <img width="600" src="https://maps.googleapis.com/maps/api/staticmap?center=Laksamana+College+of+Business,+Bandar+Seri+Begawan&zoom=18&scale=2&size=600x300&maptype=roadmap&format=jpg&visual_refresh=true&markers=size:mid%7Ccolor:0xff0000%7Clabel:We+are+here%7CLaksamana+College+of+Business,+Bandar+Seri+Begawan" alt="Google Map of Laksamana College of Business, Bandar Seri Begawan" />
            </div>
            <p>Plaza Abdul Razak</p>
            <p>Jalan Laksamana</p>
            <p>Bandar Seri Begawan</p>
        </div>
        <!-- end map div -->
    </div>
</asp:Content>
