using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assignment_draft.Members
{
    public partial class Cart : System.Web.UI.Page
    {
        decimal grandTotal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            string ss = HttpContext.Current.User.Identity.Name;
            Response.Cookies["userlogin"].Value = ss;
            grandTotal = 0;
        }

        protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Price")) * Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Quantity"));
                grandTotal = grandTotal + rowTotal;
            }
            Response.Cookies["Price"].Value = grandTotal.ToString();
            TextBox2.Text = grandTotal.ToString();

        }

        protected void gvCart_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            Response.Redirect("~/Members/Cart.aspx");
        }

        
        protected void backbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");
        }

        protected void rptrCart_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater rptr = sender as Repeater;
        }
    }
}