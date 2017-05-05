using System;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.AspNet.Identity;
using System.Web.UI.WebControls;

namespace assignment_draft
{
    public partial class product_display : System.Web.UI.Page
    { 
        db_qiwebentity db = new db_qiwebentity();
        protected void Page_Load(object sender, EventArgs e)
        {
            
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
            string productId = Request.QueryString["Id"]; //success
            int q = int.Parse(ddStockQty.Text); //success


            /*foreach (RepeaterItem i in rptProductDisplay.Items)
            {
                double p = Convert.ToDouble((Label)i.FindControl("productLblPrice"));

                
                    SqlConnection sc2 = new SqlConnection(ConfigurationManager.ConnectionStrings["qiwebcon"].ConnectionString);
                    sc2.Open();

                    string addtocart2 = "INSERT INTO tb_Cart(Price) VALUES ('" + p + "') ";
                    SqlCommand command2 = new SqlCommand(addtocart2, sc2);
                    command2.ExecuteNonQuery();
                    sc2.Close();
            }*/

            

            //string name = ((Label)rptProductDisplay.FindControl("lblProdName")).ToString();

            
            //string p = "select tbl_products.Price from tbl_products inner join tb_Cart on tbl_products.ProductId = tb_Cart.ProductId ";
            string imgExt = ".jpg";
            //double p = Convert.ToDouble((Label)FindControl("productLblPrice"));
            
            //insert all fields into db 
            SqlConnection sc = new SqlConnection(ConfigurationManager.ConnectionStrings["qiwebcon"].ConnectionString);
            sc.Open();
            
            string addtocart = "INSERT INTO tb_Cart(ClientId, Quantity, ProductId, Extension) VALUES ('" + cn + "','" + q + "','" + productId + "','" + imgExt + "') ";
            SqlCommand command = new SqlCommand(addtocart, sc);
            command.ExecuteNonQuery();
            sc.Close();

            Response.Redirect("~/Members/Cart.aspx");
           


        }
    }
}