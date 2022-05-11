using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace DoGoDoManh.Areas.Admin.Data
{
    public partial class WoodShopDB : DbContext
    {
        public WoodShopDB()
            : base("name=WoodShopDB1")
        {
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Invoice> Invoices { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductsCart> ProductsCarts { get; set; }
        public virtual DbSet<ProductsOrder> ProductsOrders { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>()
                .HasMany(e => e.Products)
                .WithRequired(e => e.Category)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Invoice>()
                .Property(e => e.DiscountCode)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Invoice>()
                .HasMany(e => e.ProductsOrders)
                .WithRequired(e => e.Invoice)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.ProductsCarts)
                .WithRequired(e => e.Product)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.ProductsOrders)
                .WithRequired(e => e.Product)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.PhoneNumber)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Invoices)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.ProductsCarts)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);
        }
    }
}
