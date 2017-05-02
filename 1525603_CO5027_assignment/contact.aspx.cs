using System;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web.UI.WebControls;

namespace assignment_draft
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            litSuccess.Visible = false;

        }

        protected void SubmitEnquiry()
        {
            SmtpClient smtpClient = new SmtpClient();

            smtpClient.Host = "smtp.gmail.com";
            smtpClient.Port = 587;
            smtpClient.EnableSsl = true;

            NetworkCredential credentials = new NetworkCredential("nha1525603@gmail.com", "P@55word");

            smtpClient.Credentials = credentials;

            MailMessage msg = new MailMessage(txtContactMail.Text, "nha1525603@gmail.com");
            msg.Subject = "A new email from the website - " + ddSubject.Text.ToString();
            msg.Body = "From: " + txtContactName.Text + "\n" +
                "Email: " + txtContactMail.Text + "\n" +
                "Subject: " + ddSubject.Text + "\n" +
                "Question: \n" + txtMessageBox.Text + "\n";
            smtpClient.Send(msg);
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                SubmitEnquiry();
                litSuccess.Text = "Your enquiry has been successfully sent! Please wait for our representatives to respond within 3 working days.";
                litSuccess.Visible = true;
                ddSubject.SelectedIndex = 0;
                txtContactMail.Text = "";
                txtContactName.Text = "";
                txtMessageBox.Text = "";
                confirmationEnquiry();
            }
            catch (Exception error)
            {
                litSuccess.Text = "We apologize for the inconvenience but your message cannot be sent" + error;

            }
        }

        protected void confirmationEnquiry()
        {
            SmtpClient smtpClient = new SmtpClient();

            smtpClient.Host = "smtp.gmail.com";
            smtpClient.Port = 587;
            smtpClient.EnableSsl = true;

            NetworkCredential credentials = new NetworkCredential("noreplynha@gmail.com", "P@55word");

            smtpClient.Credentials = credentials;

            MailMessage msg = new MailMessage("noreplynha@gmail.com", "nha1525603@gmail.com");
            msg.Subject = "We have received your enquiry!";
            msg.Body = "We have received your enquiry, please wait for 3 days for our representatives to respond, if waiting period exceeds 3 days, do not hesitate to call us by phone. Thank you!";
            smtpClient.Send(msg);
        }

        
    }
}