using Application.Models.ApiResult;
using MediatR;

namespace Application.Features.Users.ResetPassword;

public class ResetPasswordCommand : IRequest<Result>
{
    public string Email { get; set; }
    public string Token { get; set; }
    public string NewPassword { get; set; }
    public string ConfirmPassword { get; set; }

    public ResetPasswordCommand(string email, string token, string newPassword, string confirmPassword)
    {
        Email = email;
        Token = token;
        NewPassword = newPassword;
        ConfirmPassword = confirmPassword;
    }
}