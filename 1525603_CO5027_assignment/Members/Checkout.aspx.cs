using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assignment_draft.Members
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ss = HttpContext.Current.User.Identity.Name;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["qiwebcon"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT ClientId , Sum(tbl_products.Price*tb_Cart.Quantity) As subTotal, SUM(tb_Cart.Quantity) As totalQty FROM [tb_Cart] INNER JOIN tbl_products ON tbl_products.ProductId = tb_Cart.ProductId WHERE ClientId = '" + ss + "'" + " group by tb_Cart.ClientId", con);
            SqlDataReader sdr;
            sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                lbtotal.Text = sdr["subTotal"].ToString();
                lblTotalQty.Text = sdr["totalQty"].ToString();
            }

            sdr.Close();
            con.Close();

            con.Open();

            

            SqlCommand cmd1 = new SqlCommand("SELECT ClientId ,tb_Cart.[ProductId] ,[Quantity] ,[Extension], tbl_products.ProductName, tbl_products.Price, tbl_products.ImageId, tbl_products.CategoryId FROM [tb_Cart] INNER JOIN tbl_products  ON tbl_products.ProductId = tb_Cart.ProductId  WHERE ClientId ='" + HttpContext.Current.User.Identity.Name + "'", con);
            //cmd1.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rptrCart.DataSource = dt;
            rptrCart.DataBind();
            cmd1.Dispose();

        }

        protected void btnPaypalCheckout_Click(object sender, EventArgs e)
        {
            foreach (RepeaterItem i in rptrCart.Items)
            {
                string sT = string.Empty;
                string qT = string.Empty;
                try
                {
                    using (SqlConnection sc = new SqlConnection(ConfigurationManager.ConnectionStrings["qiwebcon"].ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand ("SELECT ClientId , Sum(tbl_products.Price*tb_Cart.Quantity) As subTotal, SUM(tb_Cart.Quantity) As totalQty FROM [tb_Cart] INNER JOIN tbl_products ON tbl_products.ProductId = tb_Cart.ProductId group by tb_Cart.ClientId ", sc))
                        {
                            sc.Open();
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                sT = reader[1].ToString();
                                qT = reader[2].ToString();
                            }
                        }
                    }
                } catch (Exception ex)
                {
                    litError.Text = "Error: " + ex;
                }




                    // Authenticate with PayPal
                    var config = ConfigManager.Instance.GetProperties();
                    var accessToken = new OAuthTokenCredential(config).GetAccessToken();
                    //Get APIContext Object
                    var apiContext = new APIContext(accessToken);

                    var examPaperItem = new Item();
                    examPaperItem.name = "Total Items";
                    examPaperItem.currency = "BND";
                    examPaperItem.price = sT;
                    examPaperItem.sku = ""; //sku is stock keeping unit - e.g. manufacturer code
                    examPaperItem.quantity = qT;

                    var transactionDetails = new Details();
                    transactionDetails.tax = "0";
                    transactionDetails.shipping = "0";
                    transactionDetails.subtotal = sT;

                    var transactionAmount = new Amount();
                    transactionAmount.currency = "BND";
                    transactionAmount.total = sT;
                    transactionAmount.details = transactionDetails;

                    var transaction = new Transaction();
                    transaction.description = "Your order of Past Exam papers";
                    transaction.invoice_number = Guid.NewGuid().ToString(); //this should ideally be the id of a record storing the order
                    transaction.amount = transactionAmount;
                    transaction.item_list = new ItemList
                    {
                        items = new List<Item> { examPaperItem }
                    };

                    var payer = new Payer();
                    payer.payment_method = "paypal";

                    var redirectUrls = new RedirectUrls();
                    string strPathQuery = HttpContext.Current.Request.Url.PathAndQuery;
                    string strUrl = HttpContext.Current.Request.Url.AbsoluteUri.Replace(strPathQuery, "/");
                    redirectUrls.cancel_url = strUrl + "Cancel.aspx";
                    redirectUrls.return_url = strUrl + "CompletePurchase.aspx";

                    var payment = Payment.Create(apiContext, new Payment
                    {
                        intent = "sale",
                        payer = payer,
                        transactions = new List<Transaction> { transaction },
                        redirect_urls = redirectUrls
                    });

                    Session["paymentId"] = payment.id;

                    foreach (var link in payment.links)
                    {
                        if (link.rel.ToLower().Trim().Equals("approval_url"))
                        {
                            //found the appropriate link, send the user there
                            Response.Redirect(link.href);
                        }
                    }


                }

            

                
            

            
            }

        protected void rptrCart_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["qiwebcon"].ConnectionString);
            
           

        }
    }
    }
