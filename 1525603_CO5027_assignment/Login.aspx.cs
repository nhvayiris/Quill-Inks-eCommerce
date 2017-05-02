using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assignment_draft
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void LogUserIn(UserManager<IdentityUser> usermanager, IdentityUser user)
        {
            var authenManager = HttpContext.Current.GetOwinContext().Authentication;
            var userIdentity = usermanager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
            authenManager.SignIn(new AuthenticationProperties() { }, userIdentity);
            //Note: user is automatically redirected if trying to access another page
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var identityDbContext = new IdentityDbContext("qiwebcon");
                var userStore = new UserStore<IdentityUser>(identityDbContext);
                var userManager = new UserManager<IdentityUser>(userStore);
                var user = userManager.Find(txtLoginUser.Text, txtLoginPassword.Text);
                if (user != null)
                {
                    //todo: loguser in/instruct user to log in
                    LogUserIn(userManager, user);
                    Response.Redirect("~/Default.aspx");
                    //serverside ------> method Server.Transfer("page.aspx", true);
                }
                else
                {
                    litLoginError.Text = "Please enter the correct username or password! ";
                }
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //create a dbcontext that specified the connection string
                var identityDbContext = new IdentityDbContext("qiwebcon");
                //create user store and user manager
                var userStore = new UserStore<IdentityUser>(identityDbContext);
                var manager = new UserManager<IdentityUser>(userStore);

                //authorization with role manager
                var roleStore = new RoleStore<IdentityRole>(identityDbContext);
                var roleManager = new RoleManager<IdentityRole>(roleStore);


                //create users
                var user = new IdentityUser() { UserName = tbRegusername.Text, Email = tbRegusername.Text };
                manager.Create(user, tbRegPassword.Text);

                IdentityRole endUserRole = new IdentityRole("customerUser");
                roleManager.Create(endUserRole);
                manager.AddToRole(user.Id, "customerUser");
                IdentityResult result = manager.Update(user);

                if (result.Succeeded)
                {
                    litRegister.Text = "You have successfully registered! <\n> Please login your details at the login section!" + result.Errors.FirstOrDefault();
                //todo: Either authenticate the user (log them in) or redirect them to the login page to log in for themselves
                Response.Redirect("~/Login.aspx");
                }
                else
                {
                    litRegister.Text = "An error has occurred: " + result.Errors.FirstOrDefault();
                }
            }
        }
    }
}