using DoGoDoManh.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace DoGoDoManh.Controllers
{
    public class HomeController : Controller
    {
        WoodShop db = new WoodShop();
        public ActionResult Index(string seachString, int id = 0, int? page = null)
        {
            //if (Session["idUser"] != null)
            //{
            List<Product> hangs = new List<Product>();
            int pageSize = 10; //Kích thước trang
            int pageNumber = (page ?? 1); //Nếu page bằng null thì trả về 1
            Session.Add("currentCategoryId", id);
            var products = db.Products.Select(p => p);
            if (seachString != null)
            {
                products = products.Where(p => p.ProductName.Contains(seachString));
                return View(products.ToPagedList(pageNumber, pageSize));
            }

            if (id > 0)
            {
                hangs = db.Products.Where(h => h.CategoryId.Equals(id)).Select(h => h).ToList();
                //RedirectToAction("_Aside");
                //return PartialView("_Aside", id);
            }
            else
            {
                hangs = db.Products.Select(h => h).ToList();
            }

            return View(hangs.ToPagedList(pageNumber, pageSize));
            //}
            //else
            //{
            //    return RedirectToAction("Login");
            //}
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }
        public PartialViewResult _Aside()
        {
            List<Category> danhmuc = new List<Category>();
            var id = Convert.ToInt32(Session["currentCategoryId"]);
            danhmuc = db.Categories.Select(h => h).ToList();
            if (id == 0)
            {

            }
            else
            {
                var danhmucSelect = db.Categories.Where(c => c.CategoryId.Equals(id)).Select(c => c).ToList();
                Session.Add("currentCategoryName", danhmucSelect.First().CategoryName);
            }
            return PartialView(danhmuc);

        }

        public PartialViewResult _Menu()
        {
            List<Category> danhmuc = new List<Category>();
            danhmuc = db.Categories.Select(h => h).ToList();
            List<Category> danhmucMenu = new List<Category>();
            danhmucMenu = danhmuc.OrderByDescending(P => P.Products.Count).Take(3).ToList();
            return PartialView(danhmucMenu);

        }

        public ActionResult Login()
        {
            if (Session["idUser"] != null)
            {
                RedirectToAction("Index");
            }
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string email, string password)
        {
            if (ModelState.IsValid)
            {
                var user = db.Users.Where(u => u.Email.Equals(email) && u.Password.Equals(password)).ToList();

                if (user.Count() > 0)
                {
                    Session["Email"] = user.FirstOrDefault().Email;
                    Session["Ho"] = user.FirstOrDefault().FirstName;
                    Session["Ten"] = user.FirstOrDefault().LastName;
                    Session["DiaChi"] = user.FirstOrDefault().AddressDetail;
                    Session["DienThoai"] = user.FirstOrDefault().PhoneNumber;
                    Session["ThanhPho"] = user.FirstOrDefault().City;
                    Session["Password"] = user.FirstOrDefault().Password;
                    Session["Tinh"] = user.FirstOrDefault().District;
                    Session["idUser"] = user.FirstOrDefault().UserId;
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Đăng nhập không thành công!";
                }
            }
            return View();
        }

        public ActionResult DeleteCart(int? id)
        {
            ProductsCart hang = db.ProductsCarts.ToList().Find(x => x.ProductId == id);
            db.ProductsCarts.Remove(hang);
            db.SaveChanges();
            return View("Cart");
        }
        public ActionResult Cart(int? id, int? quan)
        {
            if (Session["idUser"] != null)
            {
                ProductsCart pc = new ProductsCart();
                Product hang = db.Products.ToList().Find(x => x.ProductId == id);
                pc.UserId = Convert.ToInt32(Session["idUser"]);
                pc.ProductId = Convert.ToInt32(id);
                pc.Product = hang;
                bool check = false;
                foreach (var item in db.ProductsCarts)
                {
                    if (item.ProductId == Convert.ToInt32(id))
                    {
                        check = true;
                    }
                    if (item.Product.InventQuantity < 1)
                    {
                        check = true;
                    }
                }
                if (check == false)
                {
                    if (quan == null)
                    {
                        pc.Quantity = 1;
                        db.ProductsCarts.Add(pc);
                        db.SaveChanges();
                    }
                    else
                    {
                        pc.Quantity = Convert.ToInt32(quan);
                        db.ProductsCarts.Add(pc);
                        db.SaveChanges();
                    }
                }



                var listProd = db.ProductsCarts.ToList();
                return View(listProd);
            }
            else
            {
                return RedirectToAction("Login");
            }
        }
        public ActionResult Product(int id = 0)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product hang = db.Products.ToList().Find(x => x.ProductId == id);
            if (hang == null)
            {
                return HttpNotFound();
            }
            return View(hang);
        }
        public ActionResult Catalogs()
        {
            return View();
        }
        public ActionResult Order()
        {
            return View();
        }
        public ActionResult InfoAccount()
        {
            return View();
        }
        public ActionResult EditAccount(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditAccount([Bind(Include = "UserId,FirstName,LastName,Email,PhoneNumber,AddressDetail,City,District,Password,IsAdmin")] User user, string email)
        {
            if (ModelState.IsValid)
            {
                db.Entry(user).State = EntityState.Modified;
                db.SaveChanges();
                var user1 = db.Users.Where(u => u.Email.Equals(email)).ToList();
                Session["Ho"] = user1.FirstOrDefault().FirstName;
                Session["Ten"] = user1.FirstOrDefault().LastName;
                Session["DiaChi"] = user1.FirstOrDefault().AddressDetail;
                Session["DienThoai"] = user1.FirstOrDefault().PhoneNumber;
                Session["ThanhPho"] = user1.FirstOrDefault().City;
                Session["Tinh"] = user1.FirstOrDefault().District;
                return RedirectToAction("InfoAccount");
            }
            return View(user);
        }

        public ActionResult EditPassword(int? id)
        {
            ChangePassword cp = new ChangePassword();
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            else
            {
                cp.id = Convert.ToInt32(id);
                cp.oldpassword = null;
                cp.newpassword = null;
            }

            return View(cp);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditPassword(ChangePassword cp)
        {
            if (ModelState.IsValid)
            {
                User currentUser = db.Users.Find(cp.id);
                if (currentUser.Password.Trim() == cp.oldpassword)
                {
                    currentUser.Password = cp.newpassword;
                    db.Entry(currentUser).State = EntityState.Modified;
                    db.SaveChanges();
                    ViewBag.Success = "true";
                }
                else
                {
                    ViewBag.Success = "false";

                }
            }
            return View(cp);
        }
        public ActionResult QuenMatKhau()
        {
            return View();
        }
        public ActionResult register()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult register([Bind(Include = "UserId,FirstName,LastName,Email,PhoneNumber,AddressDetail,City,District,Password,IsAdmin")] User user)
        {
            if (ModelState.IsValid)
            {
                db.Users.Add(user);
                db.SaveChanges();
                return RedirectToAction("Login");
            }
            DangKyTV newUser = new DangKyTV();
            newUser.email = user.Email;
            newUser.FirstName = user.FirstName;
            newUser.password = user.Password;
            newUser.LastName = user.LastName;
            return View(newUser);
        }
    }
}