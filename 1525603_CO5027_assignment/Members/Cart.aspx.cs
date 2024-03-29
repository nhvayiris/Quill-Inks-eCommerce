﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assignment_draft.Members
{
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection sc = new SqlConnection(ConfigurationManager.ConnectionStrings["qiwebcon"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string ss = HttpContext.Current.User.Identity.Name;
                Response.Cookies["userlogin"].Value = ss;

                SqlCommand cmd1 = new SqlCommand("SELECT ClientId ,tb_Cart.[ProductId] ,[Quantity] ,[Extension], tbl_products.ProductName, tbl_products.Price, tbl_products.ImageId, tbl_products.CategoryId FROM [tb_Cart] INNER JOIN tbl_products  ON tbl_products.ProductId = tb_Cart.ProductId  WHERE ClientId ='" + HttpContext.Current.User.Identity.Name + "'", sc);
                SqlDataAdapter sda = new SqlDataAdapter(cmd1);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                rptrCart.DataSource = dt;
                rptrCart.DataBind();
                cmd1.Dispose();
            }
        }

   
        protected void backbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");
        }

        protected void rptrCart_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
                Repeater rptr = sender as Repeater; //get repeater control object 
                //if no data in repeater (count < 1)
                if (rptrCart != null && rptrCart.Items.Count < 1)
                {
                    if (e.Item.ItemType == ListItemType.Footer)
                    {
                        //display no data message
                        Label lblEmptyItem = e.Item.FindControl("lblEmptyItem") as Label;
                        if (lblEmptyItem != null)
                        {
                            lblEmptyItem.Visible = true;

                        }
                    }

                } // referenced from (Mohit, 2012) http://stackoverflow.com/questions/9578285/how-to-show-a-message-inside-a-repeater-control-if-it-has-no-data-inside-it
        }

       

        protected void rptrCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            foreach (RepeaterItem i in rptrCart.Items)
            {
                if (e.CommandName == "Remove" ) 
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["qiwebcon"].ConnectionString);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM [tb_Cart] where ProductId = @ProductId ", con);
                    cmd.Parameters.Add("@ProductId", SqlDbType.VarChar).Value = e.CommandArgument;
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("../Members/Cart.aspx");
                }
            }
        } 

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Members/Checkout.aspx");
        }

        protected void btnShop_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");
        }
    }
}
