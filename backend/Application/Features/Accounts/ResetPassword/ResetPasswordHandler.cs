using Application.Models.ApiResult;
using MediatR;
using Microsoft.AspNetCore.Identity;

namespace Application.Features.Accounts.ResetPassword;

public class ResetPasswordHandler : IRequestHandler<ResetPasswordCommand, Result>
{
    private readonly UserManager<Domain.Entities.User> _userManager;

    public ResetPasswordHandler(UserManager<Domain.Entities.User> userManager)
    {
        _userManager = userManager;
    }

    public async Task<Result> Handle(ResetPasswordCommand request, CancellationToken cancellationToken)
    {
        if (request.NewPassword != request.ConfirmPassword)
        {
            return new Result(false, ResultStatusCode.BadRequest, "Passwords do not match.");
        }

        var user = await _userManager.FindByEmailAsync(request.Email);
        if (user == null)
        {
            return new Result(false, ResultStatusCode.NotFound, "User not found.");
        }

        var result = await _userManager.ResetPasswordAsync(user, request.Token, request.NewPassword);

        if (!result.Succeeded)
        {
            return new Result(false, ResultStatusCode.EntityProcessError,
                string.Join(", ", result.Errors.Select(e => e.Description)));
        }

        return new Result(true, ResultStatusCode.Success, "Password has been reset successfully.");
    }
    
}