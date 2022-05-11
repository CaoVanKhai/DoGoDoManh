using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DoGoDoManh.Models
{
    public class DangKyTV
    {
        [Required(ErrorMessage = "Vui lòng nhập tên của bạn!")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập họ của bạn!")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập địa chỉ Email!")]
        [EmailAddress(ErrorMessage = "Địa chỉ Email sai!")]
        public string email { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mật khẩu!")]
        public string password { get; set; }
    }
}