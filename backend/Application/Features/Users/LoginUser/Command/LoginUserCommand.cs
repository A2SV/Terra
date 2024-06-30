using Application.Models;
using Domain.Entities;
using MediatR;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Users.LoginUser.Command
{
    public class LoginUserCommand : IRequest<Result<string>>
    {
        [Required]
        [DataType(DataType.EmailAddress)]
        [EmailAddress(ErrorMessage = "A valid email address is required")]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        public LoginUserCommand(string username, string password)
        {
            UserName = username;
            Password = password;
        }
    }
}
