namespace DoGoDoManh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            ProductsCarts = new HashSet<ProductsCart>();
            ProductsOrders = new HashSet<ProductsOrder>();
        }

        public int ProductId { get; set; }

        public int CategoryId { get; set; }

        [Required]
        [StringLength(255)]
        public string ProductName { get; set; }

        public double OldPrice { get; set; }

        [StringLength(200)]
        public string Image { get; set; }

        public double CurrentPrice { get; set; }

        public int InventQuantity { get; set; }

        [Column(TypeName = "ntext")]
        public string Description { get; set; }

        public virtual Category Category { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductsCart> ProductsCarts { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductsOrder> ProductsOrders { get; set; }
    }
}
