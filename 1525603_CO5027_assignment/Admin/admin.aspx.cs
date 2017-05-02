using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace assignment_draft.Admin
{
    public partial class admin_defaultpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public static void deleteConfirmation(GridView gridv, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (DataControlField datacontrolfield in gridv.Columns)
                {
                    if (datacontrolfield.ToString() == "CommandField")
                    {
                        if (((CommandField)datacontrolfield).ShowDeleteButton == true)
                        {
                            e.Row.Cells[gridv.Columns.IndexOf(datacontrolfield)].Attributes
                            .Add("onclick", "return confirm(\"Are you sure?\")");
                        }
                    }
                }
            }
        }
        //coding snippet is referenced from https://www.codeproject.com/Articles/17986/Easily-add-a-confirm-message-before-a-delete-from by Leo Muller
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            deleteConfirmation((GridView)sender, e);
        }

        //coding snippet is referenced from https://www.codeproject.com/Articles/17986/Easily-add-a-confirm-message-before-a-delete-from by Leo Muller
        

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            deleteConfirmation((GridView)sender, e);
        }

        protected void newimagegv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            deleteConfirmation((GridView)sender, e);
        }
    }
}