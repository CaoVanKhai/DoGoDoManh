namespace DoGoDoManh.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProductsOrder")]
    public partial class ProductsOrder
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ProductId { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int InvoiceId { get; set; }

        public int? Quantity { get; set; }

        public virtual Invoice Invoice { get; set; }

        public virtual Product Product { get; set; }
    }
}
