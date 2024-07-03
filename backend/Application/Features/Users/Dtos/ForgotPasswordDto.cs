using System.ComponentModel.DataAnnotations;

namespace Application.Features.Users.Dtos
{
    public class ForgotPasswordDto
    {
        [Required]
        [EmailAddress]
        public string Email {get; set;}
        
    }
}