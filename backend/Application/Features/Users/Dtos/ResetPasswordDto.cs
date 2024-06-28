using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Features.Users.Dtos
{
    public class ResetPasswordDto
    {
        [Required]
        [EmailAddress]
        public string Email {get; set;}
        
        [Required]
        public string Token {get; set;}
        
        [Required]
        [MinLength(6)]
        public string NewPassword {get; set;}
        
        [Required]
        [Compare("NewPassword", ErrorMessage = "Passwords do not match")]
        public string ConfirmPassword {get; set;}
    }
}