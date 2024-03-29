﻿<%@ Page Title="Contact | Quill & Inks" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="assignment_draft.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContentPlaceholder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <main class="main-content">
        <section class="contact-panel">
            <h2 class="head-title welcome-head">We'd love to hear from you!</h2>
            <div class="usercontactform grid_12">
                <div class="userdetailform grid_6">
                    <h3 class="welcome-head-section">Contact Us</h3>
                    <p class="lit-panel">* Indicates a REQUIRED field (cannot be empty!)</p>
                    <asp:Label ID="lblContactName" runat="server" Text="Name *: " AssociatedControlID="txtContactName" CssClass="contact-label"></asp:Label>
                    <asp:TextBox ID="txtContactName" runat="server" CssClass="contact-input" placeholder="Your Name..." ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ValidFieldName" runat="server" ErrorMessage="This field cannot be empty!" ControlToValidate="txtContactName" ValidationGroup="save" CssClass="lit-panel"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblContactMail" runat="server" Text="E-mail *: " AssociatedControlID="txtContactMail" CssClass="contact-label"></asp:Label>
                    <asp:TextBox ID="txtContactMail" runat="server" CssClass="contact-input" placeholder="Your Email Address..."></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ValidEmailField" runat="server" ErrorMessage="This field cannot be empty!" ControlToValidate="txtContactMail" ValidationGroup="save" CssClass="lit-panel"></asp:RequiredFieldValidator><asp:RegularExpressionValidator runat="server" ID="ValidEmail" SetFocusOnError="true" Text="Please enter a valid email address. Example: username@samplemail.com"
                        ControlToValidate="txtContactMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                        ValidationGroup="save" CssClass="lit-panel" /><!-- (aelor, 2014) from http://stackoverflow.com/questions/22475946/how-to-validate-email-address-using-regularexpression-validator -->
                    <asp:Label ID="lblSubject" runat="server" Text="Subject *: " AssociatedControlID="ddSubject" CssClass="contact-label"></asp:Label>
                    <div class="ddcategory">
                        <div class="choose">
                            <asp:DropDownList ID="ddSubject" runat="server" CssClass="dropdown-input">
                                <asp:ListItem>--Please Select an option--</asp:ListItem>
                                <asp:ListItem>Ask a question</asp:ListItem>
                                <asp:ListItem>Customer Support Ticket</asp:ListItem>
                                <asp:ListItem>Stock Query</asp:ListItem>
                                <asp:ListItem>Problems Logging In/Register</asp:ListItem>
                                <asp:ListItem>Others</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <asp:RequiredFieldValidator ID="ValidDD" runat="server" ErrorMessage="Please select a subject!" InitialValue="--Please Select an option--" ControlToValidate="ddSubject" ValidationGroup="save" CssClass="lit-panel"></asp:RequiredFieldValidator>
                    <asp:Label ID="lblMessageBox" runat="server" Text="Message *: " AssociatedControlID="txtMessageBox" CssClass="contact-label"></asp:Label>
                    <asp:TextBox ID="txtMessageBox" runat="server" TextMode="MultiLine" CssClass="message-input" placeholder="Your Message..."></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ValidMessage" runat="server" ErrorMessage="This field cannot be empty!" ControlToValidate="txtMessageBox" ValidationGroup="save" CssClass="lit-panel"></asp:RequiredFieldValidator>
                    <div>
                        <asp:Button CssClass="buttoncontact" ID="btnSend" runat="server" Text="Submit" ValidationGroup="save" OnClick="btnSend_Click" Width="150px" />
                    </div>
                    <div class="givespace">
                        <asp:Literal ID="litSuccess" runat="server"></asp:Literal>
                    </div>
                </div>
                <!-- end userdetailform -->

                <div class="contact-details grid_5">
                    <h3 class="welcome-head-section">Contact Information</h3>
                    <h4 class="headspace">Call us: </h4>
                    <div>
                        <p>Call <a href="+0123498765">3498765</a> for more information!</p>
                    </div>
                    <h4 class="headspace">Visit us at : </h4>
                    <div>
                        <address class="address">
                            Plaza Abdul Razak,
                        Jalan Laksamana Abdul Razak,
                        Bandar Seri Begawan
                        </address>
                    </div>

                </div>
                <!-- end contact-details-->

                <div class="googlemapapi grid_12">
                    <h3 class="welcome-head-section">Find Us Here! </h3>
                    <div id="map">
                        <img src="Images/staticmap.jpg" alt="Map of Laksamana College of Business at Plaza Abdul Razak, Jalan Laksamana Abdul Razak, Bandar Seri Begawan" id="staticmap" width="1000" height="500" />
                    </div>
                    <script type="text/javascript" src="JS/scripts.js"></script>
                    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&key=AIzaSyDVhNKCZTY5wLai8clTTqj7c97DaNnR8Sk"></script>
                </div>
                <!-- end googlemapapi -->

            </div>
            <!-- end usercontactform-->

        </section>
        <!-- end section -->

    </main>
    <!-- end main -->
</asp:Content>
