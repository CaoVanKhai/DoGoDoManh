namespace DoGoDoManh.Areas.Admin.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
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

        [DisplayName("Mã sản phẩm")]
        public int ProductId { get; set; }

        [DisplayName("Tên danh mục")]
        [Required(ErrorMessage = "Phải chọn một danh mục")]
        public int CategoryId { get; set; }

        [Required(ErrorMessage = "Tên sản phẩm không được bỏ trống")]
        [StringLength(255)]
        [DisplayName("Tên sản phẩm")]
        public string ProductName { get; set; }


        [DisplayName("Giá cũ")]
        [Range(0, 1000000000, ErrorMessage = "Giá cũ phải là số dương và không quá 1 tỷ đồng")]
        [DisplayFormat(DataFormatString = "{0:#,###}")]
        [Required(ErrorMessage = "Giá cũ không được bỏ trống")]
        [RegularExpression("^[0-9]*\\.?[0-9]*$", ErrorMessage = "Giá cũ phải là một số.")]
        public double OldPrice { get; set; }

        [DisplayName("Hình ảnh sản phẩm")]
        [StringLength(200)]
        [UIHint("Image")]
        public string Image { get; set; }

        [DisplayName("Giá hiện tại")]
        [Required(ErrorMessage = "Giá hiện tại không được bỏ trống")]
        [Range(0, 1000000000, ErrorMessage = "Giá hiện tại phải là số dương và không quá 1 tỷ đồng")]
        [DisplayFormat(DataFormatString = "{0:#,###}")]
        [RegularExpression("^[0-9]*\\.?[0-9]*$", ErrorMessage = "Giá hiện tại phải là một số.")]
        public double CurrentPrice { get; set; }

        [DisplayName("Số lượng tồn")]
        [Required(ErrorMessage = "Số lượng tồn kho không được bỏ trống")]
        [Range(0, int.MaxValue, ErrorMessage = "Số lượng tồn kho phải là số dương")]
        [RegularExpression("^[0-9]*\\.?[0-9]*$", ErrorMessage = "Số lượng tồn kho phải là một số.")]
        public int InventQuantity { get; set; }

        [DisplayName("Mô tả sản phẩm")]
        [Column(TypeName = "ntext")]
        public string Description { get; set; }

        public virtual Category Category { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductsCart> ProductsCarts { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductsOrder> ProductsOrders { get; set; }
    }
}
