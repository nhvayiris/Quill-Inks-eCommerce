using assignment_draft.App_Data;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assignment_draft.Admin
{
    public partial class addproducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetImages();
            }
        }

        private void GetImages()
        {
            try
            {
                //Get all filepaths
                string[] images = Directory.GetFiles(Server.MapPath("~/Images/products/"));

                //Get all filenames and add them to an arraylist
                ArrayList imageList = new ArrayList();
                foreach (string image in images)
                {
                    string imageName = image.Substring(image.LastIndexOf(@"\", StringComparison.Ordinal) + 1);
                    imageList.Add(imageName);
                }

                //Set the arrayList as the dropdownview's datasource and refresh
                ddImagefile.DataSource = imageList;
                ddImagefile.AppendDataBoundItems = true;
                ddImagefile.DataBind();


            }
            catch (Exception e)
            {
                litResult.Text = e.ToString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            db_1525603_qiwebEntities db = new db_1525603_qiwebEntities();

            //need a view table to combine both products and category table
            //fix the codes
            tb_products product = new tb_products();
            
            product.ProductName = txtProductName.Text;
            product.Price = Decimal.Parse(txtPrice.Text);
            
            product.ProductDesc = txtDescription.Text;
            product.ImageId = ddImagefile.SelectedValue;

            tb_categories category = new tb_categories();
            //product.categoryName = ddProductCategory.SelectedValue;

           // db.Products.Add(product);
            db.SaveChanges();

            txtProductName.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtDescription.Text = string.Empty;
        }
    }
}