using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace assignment_draft.Logic
{
    public class ProductModel
    {
        db_qiwebentity db = new db_qiwebentity();

        public string InsertProduct(tbl_products product)
        {
            try
            {
                
                db.tbl_products.Add(product);
                db.SaveChanges();

                return product.ProductName + " was succesfully inserted";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string UpdateProduct(int id, tbl_products product)
        {
            try
            {


                //Fetch object from db
                tbl_products p = db.tbl_products.Find(id);

                p.ProductName = product.ProductName;
                p.Price = product.Price;
                p.CategoryId = product.CategoryId;
                p.ProductDesc = product.ProductDesc;
                p.ImageId = product.ImageId;

                db.SaveChanges();
                return product.ProductName + " was succesfully updated";

            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public string DeleteProduct(int id)
        {
            try
            {
                
                tbl_products product = db.tbl_products.Find(id);

                db.tbl_products.Attach(product);
                db.tbl_products.Remove(product);
                db.SaveChanges();

                return product.ProductName + " was succesfully deleted";
            }
            catch (Exception e)
            {
                return "Error:" + e;
            }
        }

        public tbl_products GetProduct(int id)
        {
            try
            {
                using (db_qiwebentity db = new db_qiwebentity())
                {
                    tbl_products product = db.tbl_products.Find(id);
                    return product;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<tbl_products> GetAllProducts()
        {
            try
            {
                using (db_qiwebentity db = new db_qiwebentity())
                {
                    List<tbl_products> products = (from x in db.tbl_products
                                              select x).ToList();
                    return products;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<tbl_products> GetProductsByType(string typeId)
        {
            try
            {
                using (db_qiwebentity db = new db_qiwebentity())
                {
                    List<tbl_products> products = (from x in db.tbl_products
                                              where x.CategoryId == typeId
                                              select x).ToList();
                    return products;
                }
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}