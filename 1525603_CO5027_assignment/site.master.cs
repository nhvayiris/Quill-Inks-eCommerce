using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace assignment_draft
{
    public partial class site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["search"]))
    {
                //perform search and display results
            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var search = Server.UrlEncode(tbSearch.Text); // URL encode in case of special characters
            Response.Redirect("~/Default.aspx?search=" + search);
        }
    }
}