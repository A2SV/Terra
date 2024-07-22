using Application.Models.ApiResult;
using MediatR;

namespace Application.Features.Accounts.ResetPassword;

public class ResetPasswordCommand : IRequest<Result>
{
    public string Email { get; set; }
    public string NewPassword { get; set; }
    public string ConfirmPassword { get; set; }

    public ResetPasswordCommand(string email, string newPassword, string confirmPassword)
    {
        Email = email;
        NewPassword = newPassword;
        ConfirmPassword = confirmPassword;
    }
}