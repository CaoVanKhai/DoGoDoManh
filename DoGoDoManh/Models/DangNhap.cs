using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace DoGoDoManh.Models
{
    public class DangNhap
    {
        [Required(ErrorMessage = "Vui lòng nhập địa chỉ Email!")]
        [EmailAddress(ErrorMessage = "Địa chỉ Email sai!")]
        public string email { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mật khẩu!")]
        public string password { get; set; }
    }
}