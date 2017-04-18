
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

            db_qiwebentity db = new db_qiwebentity();
            //located the image (normally we would find a specific image)
            var imageData = db.tb_images.FirstOrDefault();
            //build the filename          
            string filename = imageData.ImageId.ToString() + imageData.Extension;
            //set the image control's attributes
            CurrentImg.AlternateText = imageData.AltText;
            CurrentImg.Width = (Unit)imageData.Width;
            CurrentImg.Height = (Unit)imageData.Height;
            CurrentImg.ImageUrl = "~/Images/uploadedimages/" + filename;
        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            db_qiwebentity db = new db_qiwebentity();

            //need a view table to combine both products and category table
            //fix the codes
            tbl_products product = new tbl_products();

            product.ProductName = txtProductName.Text;
            product.Price = Decimal.Parse(txtPrice.Text);
            product.StockQty = int.Parse(txtStock.Text);
            product.Condition = txtCondition.Text;
            product.ProductDesc = txtDescription.Text;


            tb_categories category = new tb_categories();
            //product.categoryName = ddProductCategory.SelectedValue;

            //get the extension of our image file
            string extension = (Path.GetExtension(imageFileUpload.FileName).ToLower());
            //check the extension is valid
            if (extension == ".jpg" || extension == ".jpeg" || extension == ".png" || extension == ".gif")
            {
                //load the image in memory so we can determine it's dimensions
                System.Drawing.Image img = System.Drawing.Image.FromStream(imageFileUpload.PostedFile.InputStream);
                int width = img.Width;
                int height = img.Height;
                //save the image data

                tb_images imageData = new tb_images();
                imageData.AltText = txtAltText.Text;
                imageData.Width = width;
                imageData.Height = height;
                imageData.Extension = extension;
                db.tb_images.Add(imageData);
                db.SaveChanges();
                //assemble the filename
                string filename = imageData.ImageId.ToString() + extension;

                //save the image file (we could have alternatively saved the posted file,
                //but this would save any modifications we may have made to the image)
                img.Save(Server.MapPath("~/Images/uploadedimages/" + filename));
                //inform the user
                litResult.Text = "<p>Your file was uploaded as " + filename + " in the uploadedimages folder</p>";

                // db.Products.Add(product);
                db.SaveChanges();

                txtProductName.Text = string.Empty;
                txtPrice.Text = string.Empty;
                txtDescription.Text = string.Empty;
                txtCondition.Text = string.Empty;
                txtStock.Text = string.Empty;


            }
        }
    }
}