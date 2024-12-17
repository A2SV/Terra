using Application.Models.ApiResult;
using MediatR;

namespace Application.Features.Accounts.ResetPassword;

public class ResetPasswordCommand : IRequest<Result>
{
    public string Token { get; set; }
    public string NewPassword { get; set; }
    public string ConfirmPassword { get; set; }

    public ResetPasswordCommand(string token, string newPassword, string confirmPassword)
    {
        Token = token;
        NewPassword = newPassword;
        ConfirmPassword = confirmPassword;
    }
}