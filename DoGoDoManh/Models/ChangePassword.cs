using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace DoGoDoManh.Models
{
    public class ChangePassword
    {
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu cũ!")]
        public string oldpassword { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mật khẩu mới!")]
        public string newpassword { get; set; }
        public int id { get; set; }
    }
}