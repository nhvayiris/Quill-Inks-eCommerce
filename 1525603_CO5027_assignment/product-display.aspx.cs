using assignment_draft.Logic;
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
        private db_qiwebentity db = new db_qiwebentity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string product = Request.QueryString["Id"];

                if (Request.QueryString["Id"] != null) //if (Request.QueryString["Id"] != null || Request.QueryString["Id"] != 0 || Request.QueryString["Id"] != 1 )
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
            
        }


    }
}