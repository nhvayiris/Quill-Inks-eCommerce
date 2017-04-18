using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.AspNet.Identity;

namespace assignment_draft
{
    public partial class site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //view name of user when logged in

            var user = Context.User.Identity;

            if (user.IsAuthenticated)
            {
                litStatus.Text = Context.User.Identity.Name;

                linkLogin.Visible = false;
                linkLogout.Visible = true;
                litStatus.Visible = true;
            }

            else
            {
                linkLogin.Visible = true;
                linkLogout.Visible = false;
                litStatus.Visible = false;
            }



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

        protected void linkLogout_Click(object sender, EventArgs e)
        {
            HttpContext.Current.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            Response.Redirect("~/default.aspx");
        }
    }
}