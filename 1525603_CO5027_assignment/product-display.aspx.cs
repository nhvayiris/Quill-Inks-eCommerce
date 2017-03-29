using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assignment_draft
{
    public partial class product_display : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string viewEntryIdString = Request.QueryString["Id"];
            //int entryIden = int.Parse(viewEntryIdString);

            db_qiwebentity db = new db_qiwebentity();
            //var requestEntry = db.tbl_products.Single(p => p.ProductId == entryIden);
        }
    }
}