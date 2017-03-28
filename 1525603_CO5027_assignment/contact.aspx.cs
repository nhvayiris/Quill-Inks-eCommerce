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
            
        }

        protected void SubmitEnquiry()
        {
            SmtpClient smtpClient = new SmtpClient();

            smtpClient.Host = "smtp.gmail.com";
            smtpClient.Port = 587;
            smtpClient.EnableSsl = true;

            NetworkCredential credentials = new NetworkCredential("nha1525603@gmail.com", "P@55word");

            smtpClient.Credentials = credentials;

            MailMessage msg = new MailMessage("nha1525603@gmail.com", "recipient@domain.com");
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
            }
            catch (Exception)
            {
                litFailed.Text = "Your message was unsuccessfully send, please try again!";
            }
        }

        
    }
}