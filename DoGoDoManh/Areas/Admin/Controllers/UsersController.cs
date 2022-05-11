using DoGoDoManh.Areas.Admin.Data;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace DoGoDoManh.Areas.Admin.Controllers
{
    public class UserAccountController : Controller
    {
        private WoodShopDB db = new WoodShopDB();
        // GET: Admin/Account
        public ActionResult Index(int? page)
        {
            var users = db.Users.Select(p => p).Where(p => p.IsAdmin == false || p.IsAdmin == null);
            //Cần sắp xếp trước khi phân trang
            users = users.OrderBy(s => s.UserId);
            int pageSize = 4; //Kích thước trang
            int pageNumber = (page ?? 1); //Nếu page bằng null thì trả về 1
            return View(users.ToPagedList(pageNumber, pageSize));
        }

        // GET: Admin/Account/Details/5
        public ActionResult Details(int? id)
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

        // GET: Admin/Account/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.UserId = new SelectList(db.Users, "UserId", "UserName", user.UserId);
            return View(user);
        }

        // POST: Admin/Account/Edit/5
        [HttpPost]
        public ActionResult Edit([Bind(Include = "UserId,FirstName,LastName,Email,PhoneNumber,AddressDetail,City,District,Password,Status,isAdmin")] User user)
        {
            db.Entry(user).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");

        }

        // GET: Admin/Account/Delete/5
        public ActionResult Delete()
        {
            return View();
        }

        // POST: Admin/Account/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
