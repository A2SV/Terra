using System.ComponentModel.DataAnnotations;

namespace Application.Features.Accounts.Dtos
{
    public class ForgotPasswordDto
    {
        [Required]
        [EmailAddress]
        public string Email {get; set;}
        
    }
}