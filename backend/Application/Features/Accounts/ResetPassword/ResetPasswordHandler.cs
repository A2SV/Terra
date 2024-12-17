using System.Security.Claims;
using Application.Contracts;
using Application.Models.ApiResult;
using MediatR;
using Microsoft.AspNetCore.Identity;

namespace Application.Features.Accounts.ResetPassword;

public class ResetPasswordHandler : IRequestHandler<ResetPasswordCommand, Result>
{
    private readonly UserManager<Domain.Entities.User> _userManager;
    private readonly ITokenRepository _tokenRepository;

    public ResetPasswordHandler(UserManager<Domain.Entities.User> userManager, ITokenRepository tokenRepository)
    {
        _userManager = userManager;
        _tokenRepository = tokenRepository;
    }

    public async Task<Result> Handle(ResetPasswordCommand request, CancellationToken cancellationToken)
    {
        if (request.NewPassword != request.ConfirmPassword)
        {
            return new Result(false, ResultStatusCode.BadRequest, "Passwords do not match.");
        }
        var decodedToken = _tokenRepository.VerifyJwt(request.Token);
        var email = decodedToken.FindFirst(ClaimTypes.Email).Value;
       
        var user = await _userManager.FindByEmailAsync(email);
        if (user == null)
        {
            return new Result(false, ResultStatusCode.NotFound, "User not found.");
        }

        var resetToken = await _userManager.GeneratePasswordResetTokenAsync(user);
        user.PasswordResetToken = resetToken;
        await _userManager.UpdateAsync(user);
        
        var userRoles = await _userManager.GetRolesAsync(user);
        
        var result = await _userManager.ResetPasswordAsync(user, resetToken, request.NewPassword);

        if (!result.Succeeded)
        {
            return new Result(false, ResultStatusCode.EntityProcessError,
                string.Join(", ", result.Errors.Select(e => e.Description)));
        }

        return new Result(true, ResultStatusCode.Success, "Password has been reset successfully.");
    }
    
}