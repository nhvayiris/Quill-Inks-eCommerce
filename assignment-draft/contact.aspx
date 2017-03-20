<%@ Page Title="Contact | Quill & Inks" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="assignment_draft.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
    <!-- Google maps -->


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">


    <main class="main-content">
        <section class="contact-panel">
            <h2 class="head-title">Contacts</h2>

            <div class="usercontactform grid_12">
                <div class="userdetailform grid_6">
                    <h3>Contact Us</h3>
                    <asp:Label ID="lblContactName" runat="server" Text="Name: " AssociatedControlID="txtContactName" class="contact-label"></asp:Label>
                    <asp:TextBox ID="txtContactName" runat="server" class="contact-input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ValidFieldName" runat="server" ErrorMessage="This field cannot be empty!" ControlToValidate="txtContactName" ValidationGroup="save"></asp:RequiredFieldValidator>

                    <asp:Label ID="lblContactMail" runat="server" Text="E-mail: " AssociatedControlID="txtContactMail" class="contact-label"></asp:Label>
                    <asp:TextBox ID="txtContactMail" runat="server" class="contact-input"></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ID="ValidEmail"  SetFocusOnError="true" Text="Please enter a valid email address. Example: username@samplemail.com"
                        ControlToValidate="txtContactMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                        ValidationGroup="save" />

                    <asp:Label ID="lblSubject" runat="server" Text="Subject: " AssociatedControlID="ddSubject" class="contact-label"></asp:Label>
                    <asp:DropDownList ID="ddSubject" runat="server" class="dropdown-input">
                        <asp:ListItem>--Please Select an option--</asp:ListItem>
                        <asp:ListItem>Ask a question</asp:ListItem>
                        <asp:ListItem>Customer Support Ticket</asp:ListItem>
                        <asp:ListItem>Stock Query</asp:ListItem>
                        <asp:ListItem>Problems Logging In/Register</asp:ListItem>
                        <asp:ListItem>Others</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:RequiredFieldValidator ID="ValidDD" runat="server" ErrorMessage="Please select a subject!" InitialValue="--Please Select an option--" ControlToValidate="ddSubject" ValidationGroup="save"></asp:RequiredFieldValidator>

                    <asp:Label ID="lblMessageBox" runat="server" Text="Message: " AssociatedControlID="txtMessageBox" class="contact-label"></asp:Label>
                    <asp:TextBox ID="txtMessageBox" runat="server" TextMode="MultiLine" class="message-input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ValidMessage" runat="server" ErrorMessage="This field cannot be empty!" ControlToValidate="txtMessageBox" ValidationGroup="save"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="btnSend" runat="server" Text="Submit" OnClick="btnSend_Click" ValidationGroup="save" Width="150px" />                    
                    <br />
                    <br />
                    <asp:Literal ID="litSuccess" runat="server"></asp:Literal>
                    <asp:Literal ID="litFailed" runat="server"></asp:Literal>
                </div>
                <div class="contact-details grid_5">
                    <h3>Contact Information</h3>
                    <h4>Telephone: </h4>
                    <div>
                        <p>01234 98765 </p>
                    </div>
                    <h4>Address : </h4>
                    <div>
                        <p>Plaza Abdul Razak</p>
                        <p>Jalan Laksamana Abdul Razak</p>
                        <p>Bandar Seri Begawan</p>
                    </div>
                    <h4>Opening Hours: </h4>
                    <div>
                        <p>We are open Monday to Saturday from 10am - 5pm. </p>
                    </div>                    
                </div>
                <div class="googlemapapi grid_12">
                    <h3> Find Us Here! </h3>
                    <div id="map">
                    </div>
                    <!-- if JS is disabled -->
                    <!--<img width="1000" height="750" src="https://maps.googleapis.com/maps/api/staticmap?center=Laksamana+College+of+Business,+Bandar+Seri+Begawan&zoom=18&scale=2&size=600x300&maptype=roadmap&format=jpg&visual_refresh=true&markers=size:mid%7Ccolor:0xff0000%7Clabel:We+are+here%7CLaksamana+College+of+Business,+Bandar+Seri+Begawan" alt="Map of Laksamana College of Business at Plaza Abdul Razak, Jalan Laksamana Abdul Razak, Bandar Seri Begawan" />-->
                    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyDVhNKCZTY5wLai8clTTqj7c97DaNnR8Sk"></script>
                    <script src="Scripts/googlemaps.js"></script>
                </div>
            </div>
        </section>
    </main>



</asp:Content>
