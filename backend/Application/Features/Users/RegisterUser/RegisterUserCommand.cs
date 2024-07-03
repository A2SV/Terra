using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;
using System.ComponentModel.DataAnnotations;

namespace Application.Features.Users.RegisterUser
{
    public class RegisterUserCommand : IRequest<Result<User>>
    {
        [Required, StringLength(50)]
        public string FirstName { get; set; }

        [Required, StringLength(50)]
        public string LastName { get; set; }

        [Required, EmailAddress]
        public string Email { get; set; }

        [Required, MaxLength(100), MinLength(6)]
        public string Password { get; set; }

        [Required, StringLength(10, MinimumLength = 10, ErrorMessage = "Mobile number should be 10")]
        public string? PhoneNumber { get; set; }
    }
}
