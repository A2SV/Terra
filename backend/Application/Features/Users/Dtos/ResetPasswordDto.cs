using System.ComponentModel.DataAnnotations;

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