using Application.Models.ApiResult;
using FluentValidation.Validators;
using MediatR;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Users.RegisterUser
{
    public class RegisterUserCommand : IRequest<Result>
    {
        [Required, StringLength(50)]
        public string FirstName { get; set; }

        [Required, StringLength(50)]
        public string LastName { get; set; }

        [Required, EmailAddress]
        public string Email { get; set; }

        [Required, StringLength(100, MinimumLength =6)]
        public string Password { get; set; }

        [Required, StringLength(10, MinimumLength = 10, ErrorMessage = "Mobile number should be 10")]
        public string? mobileNumber { get; set; }

       

 

    }
}
