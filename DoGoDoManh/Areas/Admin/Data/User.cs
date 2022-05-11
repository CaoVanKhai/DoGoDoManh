namespace DoGoDoManh.Areas.Admin.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            Invoices = new HashSet<Invoice>();
            ProductsCarts = new HashSet<ProductsCart>();
        }

        public int UserId { get; set; }

        [Required]
        [StringLength(50)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(50)]
        public string LastName { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(20)]
        public string PhoneNumber { get; set; }

        [Column(TypeName = "ntext")]
        public string AddressDetail { get; set; }

        [StringLength(50)]
        public string City { get; set; }

        [StringLength(50)]
        public string District { get; set; }

        [Required]
        [StringLength(50)]
        public string Password { get; set; }

        public bool Status { get; set; }

        public bool? IsAdmin { get; set; }

        [StringLength(50)]
        public string quyen { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Invoice> Invoices { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductsCart> ProductsCarts { get; set; }
    }
}
