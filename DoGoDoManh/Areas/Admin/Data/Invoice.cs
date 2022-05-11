namespace DoGoDoManh.Areas.Admin.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Invoice")]
    public partial class Invoice
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Invoice()
        {
            ProductsOrders = new HashSet<ProductsOrder>();
        }

        public int InvoiceId { get; set; }

        public int UserId { get; set; }

        public DateTime? InvoiceDate { get; set; }

        public double? DeliveryFee { get; set; }

        [StringLength(50)]
        public string DiscountCode { get; set; }

        public virtual User User { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductsOrder> ProductsOrders { get; set; }
    }
}
