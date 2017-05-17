using System;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.AspNet.Identity;

namespace assignment_draft
{
    public partial class product_display : System.Web.UI.Page
    { 
        db_qiwebentity db = new db_qiwebentity();
        protected void Page_Load(object sender, EventArgs e)
        {
            loginPnl.Visible = false;
            if (!Page.IsPostBack)
            {
                string userId = User.Identity.GetUserId();
                string product = Request.QueryString["Id"];

                if (product != null || Request.QueryString["ImageId"] !=null) //if (Request.QueryString["Id"] != null || Request.QueryString["Id"] != 0 || Request.QueryString["Id"] != 1 )
                {

                    contentnotFound.Visible = false;
                }
                else

                {
                    contentnotFound.Visible = true;
                }
            }
        }

        protected void linkToCart_Click(object sender, EventArgs e)
        {

            //get all fields
            string cn = HttpContext.Current.User.Identity.Name; //success

            if (cn != "")
            {
                

                string productId = Request.QueryString["Id"]; //success
                int q = int.Parse(ddStockQty.Text); //success

                string imgExt = ".jpg";

                //insert all fields into db 
                SqlConnection sc = new SqlConnection(ConfigurationManager.ConnectionStrings["qiwebcon"].ConnectionString);
                sc.Open();

                string addtocart = "INSERT INTO tb_Cart(ClientId, Quantity, ProductId, Extension) VALUES ('" + cn + "','" + q + "','" + productId + "','" + imgExt + "') ";
                SqlCommand command = new SqlCommand(addtocart, sc);
                command.ExecuteNonQuery();
                sc.Close();

                Response.Redirect("Members/Cart.aspx");
            }
            else
            {
                loginPnl.Visible = true;
            }

            
        }
    }
}