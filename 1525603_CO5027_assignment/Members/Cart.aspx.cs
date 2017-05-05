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

       /* protected void gvCart_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Price")) * Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Quantity"));
                grandTotal = grandTotal + rowTotal;
            }
            Response.Cookies["Price"].Value = grandTotal.ToString();
            TextBox2.Text = grandTotal.ToString();

        } */

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


            if (e.Item.ItemType == ListItemType.Item)
            {
                decimal rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Item.DataItem, "Price")) * Convert.ToDecimal(DataBinder.Eval(e.Item.DataItem, "Quantity"));
                grandTotal = grandTotal + rowTotal;
            }

            Response.Cookies["Price"].Value = grandTotal.ToString();
            TextBox2.Text = grandTotal.ToString();

        }  


    }
}