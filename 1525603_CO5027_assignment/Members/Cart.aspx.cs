using System;
using Microsoft.AspNet.Identity;
using assignment_draft.Logic;
using System.Collections.Generic;
using assignment_draft;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
    {

    protected global::System.Web.UI.WebControls.Literal litTotal, litTotalAmount, litVat;

        protected void Page_Load(object sender, EventArgs e)
        {
        string userId = User.Identity.GetUserId();

        GetPurchasesInCart(userId);

        }

    private void GetPurchasesInCart(string userId)
    {
        CartModel cm = new CartModel();
        double subTotal = 0;

        List<tb_Cart> purchaseList = cm.GetOrdersInCart(userId);
        CreateShopTable(purchaseList, out subTotal);

        //Add totals to webpage
        double vat = subTotal * 0.21;
        double totalAmount = subTotal + 15 + vat;

        litTotal.Text = "£ " + subTotal;
        litVat.Text = "£ " + vat;
        litTotalAmount.Text = "£ " + totalAmount;

        //Add paypal button to checkout
        //string paypal = GeneratePaypalButton(subTotal);
        //litPaypal.Text = paypal;
    }

    private void CreateShopTable(List<tb_Cart> purchaseList, out double subTotal)
    {
        subTotal = new double();
        ProductModel model = new ProductModel();

        foreach(tb_Cart cart in purchaseList)
        {
            // Create HTML elements and fill values with database data
            tbl_products product = model.GetProduct(cart.ProductId);

            ImageButton btnImage = new ImageButton
            {
                ImageUrl = string.Format("~/Images/uploadedimages/{0}", product.ImageId),
                PostBackUrl = string.Format("~/product-display.aspx?id={0}", product.ProductId)
            };

            LinkButton lnkDelete = new LinkButton
            {
                PostBackUrl = string.Format("~/Pages/ShoppingCart.aspx?productId={0}", cart.ID),
                Text = "Delete Item",
                ID = "del" + cart.ProductId,
            };

            lnkDelete.Click += Delete_Item;

            //Fill amount list with numbers 1-20
            int[] amount = Enumerable.Range(1, 20).ToArray();
            DropDownList ddlAmount = new DropDownList
            {
                DataSource = amount,
                AppendDataBoundItems = true,
                AutoPostBack = true,
                ID = cart.ID.ToString()
            };
            ddlAmount.DataBind();
            ddlAmount.SelectedValue = cart.Amount.ToString();
            ddlAmount.SelectedIndexChanged += ddlAmount_SelectedIndexChanged;

            //Create table to hold shopping cart details
            Table table = new Table { CssClass = "CartTable" };
            TableRow row1 = new TableRow();
            TableRow row2 = new TableRow();

            TableCell cell1_1 = new TableCell { RowSpan = 2, Width = 50 };
            TableCell cell1_2 = new TableCell
            {
                Text = string.Format("<h4>{0}</h4><br />{1}<br/>In Stock",
                product.Name, "Item No:" + product.ID),
                HorizontalAlign = HorizontalAlign.Left,
                Width = 350,
            };
            TableCell cell1_3 = new TableCell { Text = "Unit Price<hr/>" };
            TableCell cell1_4 = new TableCell { Text = "Quantity<hr/>" };
            TableCell cell1_5 = new TableCell { Text = "Item Total<hr/>" };
            TableCell cell1_6 = new TableCell();

            TableCell cell2_1 = new TableCell();
            TableCell cell2_2 = new TableCell { Text = "£ " + product.Price };
            TableCell cell2_3 = new TableCell();
            TableCell cell2_4 = new TableCell { Text = "£ " + Math.Round((cart.Amount * product.Price), 2) };
            TableCell cell2_5 = new TableCell();



            //Set custom controls
            cell1_1.Controls.Add(btnImage);
            cell1_6.Controls.Add(lnkDelete);
            cell2_3.Controls.Add(ddlAmount);

            //Add rows & cells to table
            row1.Cells.Add(cell1_1);
            row1.Cells.Add(cell1_2);
            row1.Cells.Add(cell1_3);
            row1.Cells.Add(cell1_4);
            row1.Cells.Add(cell1_5);
            row1.Cells.Add(cell1_6);

            row2.Cells.Add(cell2_1);
            row2.Cells.Add(cell2_2);
            row2.Cells.Add(cell2_3);
            row2.Cells.Add(cell2_4);
            row2.Cells.Add(cell2_5);
            table.Rows.Add(row1);
            table.Rows.Add(row2);
            pnlShoppingCart.Controls.Add(table);

            //Add total of current purchased item to subtotal
            subTotal += (cart.Amount * product.Price);
        }

        //Add selected objects to Session
        Session[User.Identity.GetUserId()] = carts;
    }

}
