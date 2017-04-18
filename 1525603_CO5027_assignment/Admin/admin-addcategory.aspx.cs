using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assignment_draft.Admin
{
    public partial class addproductcategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            db_qiwebentity db = new db_qiwebentity();
            tb_categories category = new tb_categories();
                category.CategoryId = txtCategoryCode.Text;
                category.CategoryName = txtProductCategory.Text;
                db.SaveChanges();
            litSubmit.Text = "Category successfully added!";
                txtCategoryCode.Text = string.Empty;
                txtProductCategory.Text = string.Empty;
            }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/admin.aspx");
        }
    }
}