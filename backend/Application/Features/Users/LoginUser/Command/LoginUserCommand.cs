using Application.Models.ApiResult;
using MediatR;
using System.ComponentModel.DataAnnotations;

namespace Application.Features.Users.LoginUser.Command
{
    public class LoginUserCommand : IRequest<TokenUserResult>
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
