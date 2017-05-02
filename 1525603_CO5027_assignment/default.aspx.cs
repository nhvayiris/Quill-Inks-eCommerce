using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assignment_draft
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            statPnl.Visible = false;
            string product = Request.QueryString["Product"];

            if (Request.QueryString["Product"] != null)
            {
                productLiteral.Text = "<h2 class='welcome-head'>" + product + "</h2>";

                rptrDisplay.Visible = false;
            } else

            {
                rptrDisplay.Visible = true;
                Repeater1.Visible = false;
            }
           

            if (!IsPostBack)
            {
                string[] filePaths = Directory.GetFiles(Server.MapPath("Images/uploadedimages"));


            }

       
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            if (tbSearch.Text != null || tbSearch.Text != "")
                {
                rptrDisplay.Visible = false;
                statPnl.Visible = false;
                //System.Threading.Thread.Sleep(2000);
                db_qiwebentity db = new db_qiwebentity();
                var q =
                    from p in db.tbl_products
                    join i in db.tb_images on p.ImageId equals i.ImageId
                    where p.ProductName.Contains(tbSearch.Text.Trim())
                    select new
                    {
                        p.ProductId,
                        i.Extension,
                        i.ImageId
                    };

                lv.DataSource = q.ToList();
                lv.DataBind();
            }
            else
            {
                rptrDisplay.Visible = true;
                statPnl.Visible = true;
            }
        }

    }
}