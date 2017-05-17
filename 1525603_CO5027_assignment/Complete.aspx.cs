using System;
using PayPal.Api;

namespace assignment_draft.Members
{
    public partial class Complete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pnlCompleteShow.Visible = false;
            pnlHead.Visible = true;
        }
        protected void btnComplete_Click(object sender, EventArgs e)
        {
            var config = ConfigManager.Instance.GetProperties();
            var accessToken = new OAuthTokenCredential(config).GetAccessToken();
            var apiContext = new APIContext(accessToken);

            var paymentId = Session["paymentId"].ToString();

            if (!String.IsNullOrEmpty(paymentId))
            {
                var payment = new Payment() { id = paymentId }; //make payment object
                var payerId = Request.QueryString["PayerID"].ToString();
                var paymentExecution = new PaymentExecution() { payer_id = payerId };

                var executedPayment = payment.Execute(apiContext, paymentExecution);

                btnComplete.Visible = false;
                pnlCompleteShow.Visible = true;
                pnlHead.Visible = false;
            }
        }
    }
}