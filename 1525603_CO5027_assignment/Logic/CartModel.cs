using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace assignment_draft.Logic
{

    public class CartModel
    {
        db_qiwebentity db = new db_qiwebentity();

        public string InsertCart(tb_Cart cart)
        {
            try
            {
                db.tb_Cart.Add(cart);
                db.SaveChanges();

                return "order was successfully inserted";
            } catch (Exception err)
            {
                return "Error: " + err;
            }

        }

        public string UpdateCart(int id, tb_Cart cart)
        {
            try
            {
                tb_Cart c = db.tb_Cart.Find(id);

                c.DatePurchased = cart.DatePurchased;
                c.ClientId = cart.ClientId;
                c.Amount = cart.Amount;
                c.IsInBasket = cart.IsInBasket;
                c.ProductId = cart.ProductId;

                db.SaveChanges();

                return cart.DatePurchased + "order was successfully updated";
            }
            catch (Exception err)
            {
                return "Error: " + err;
            }

        }

        public string DeleteCart(int id)
        {
            try
            {
                tb_Cart c = db.tb_Cart.Find(id);

                db.tb_Cart.Attach(c);
                db.tb_Cart.Remove(c);

                db.SaveChanges();

                return c.DatePurchased + "order was successfully deleted";
            }
            catch (Exception err)
            {
                return "Error: " + err;
            }
        }

        public List<tb_Cart> GetOrdersInCart(string clientId)
        {
            List<tb_Cart> orders = (from x in db.tb_Cart
                                 where x.ClientId == clientId
                                 && x.IsInBasket
                                 orderby x.DatePurchased descending
                                 select x).ToList();
            return orders;
        }

        public int GetAmountOfOrders(string clientId)
        {
            try
            {
                decimal amount = (from x in db.tb_Cart
                              where x.ClientId == clientId
                              && x.IsInBasket
                              select x.Amount).Sum();
                return 0;
            }
            catch
            {
                return 0;
            }
        }

        public void UpdateQuantity(int id, int quantity)
        {
            
            tb_Cart c = db.tb_Cart.Find(id);
            c.Amount = quantity;

            db.SaveChanges();
        }

        public void MarkOrdersAsPaid(List<tb_Cart> carts)
        {
            if (carts != null)
            {
                foreach (tb_Cart cart in carts)
                {
                    tb_Cart old = db.tb_Cart.Find(cart.CartId);
                    old.DatePurchased = DateTime.Now;
                    old.IsInBasket = false;
                }
                db.SaveChanges();
            }
        }
    }
}