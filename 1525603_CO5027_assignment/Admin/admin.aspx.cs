using System;
using System.Web.UI.WebControls;

namespace assignment_draft.Admin
{
    public partial class admin_defaultpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string manage = Request.QueryString["Manage"];
             
            if (manage == "admin")
            {
                rptrShowAllRecord.Visible = false;
                AdminProductPanel.Visible = false;
                AdminCategoryPanel.Visible = false;
                AdminImagePanel.Visible = false;
            }

            if (manage == "Product")
            {
                rptrShowAllRecord.Visible = false;
                AdminProductPanel.Visible = true;
                AdminCategoryPanel.Visible = false;
                AdminImagePanel.Visible = false;
            }


            if (manage == "Category")
            {
                rptrShowAllRecord.Visible = false;
                AdminProductPanel.Visible = false;
                AdminCategoryPanel.Visible = true;
                AdminImagePanel.Visible = false;
            }

            if (manage == "Image")
            {
                rptrShowAllRecord.Visible = false;
                AdminProductPanel.Visible = false;
                AdminCategoryPanel.Visible = false;
                AdminImagePanel.Visible = true;
            }

            if (manage == "AllRecords")
            {
                rptrShowAllRecord.Visible = true;
                AdminProductPanel.Visible = false;
                AdminCategoryPanel.Visible = false;
                AdminImagePanel.Visible = false;
            }

          

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

        protected void addformview_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            if (addformview.CurrentMode == FormViewMode.Insert)
            {
                addformview.ChangeMode(FormViewMode.Edit);
            } else
            {
                if (addformview.CurrentMode == FormViewMode.Edit)
                {
                    addformview.ChangeMode(FormViewMode.Insert);
                }
            }
                
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            

        }

       
       

        protected void addformview_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            addformview.DataBind();
        }
        
     
        protected void lbEdit_Click(object sender, EventArgs e)
        {
            Button lblEdit = (Button)addformview.FindControl("btnEdit");



            if (sender == lblEdit)
            {
                addformview.DataBind();
                addformview.ChangeMode(FormViewMode.Edit);
            }
        }
    
       

        protected void addformview_Init(object sender, EventArgs e)
         {
             addformview.InsertItemTemplate = addformview.EditItemTemplate;
         }

         protected void addformview_DataBound(object sender, EventArgs e)
         {
             if (addformview.CurrentMode == FormViewMode.Edit)
             {
                 LinkButton InsertButton = addformview.FindControl("InsertButton") as LinkButton;
                 LinkButton UpdateButton = addformview.FindControl("UpdateButton") as LinkButton;

                 InsertButton.Visible = false;
                 UpdateButton.Visible = true;
             }

         } 
    }
}