using Application.Contracts;
using Application.Models.ApiResult;
using MediatR;
using Microsoft.AspNetCore.Identity;
using Domain.Entities;
using Application.Contracts;

namespace Application.Features.Accounts.ForgotPassword.Command
{
    public class ForgotPasswordHandler : IRequestHandler<ForgotPasswordCommand, Result<string>>
    {
        private readonly UserManager<User> _userManager;
        private readonly IEmailService _emailService;
        
        public ForgotPasswordHandler(UserManager<User> userManager, IEmailService emailService)
        {
            _userManager = userManager;
            _emailService = emailService;
        }

        public async Task<Result<string>> Handle(ForgotPasswordCommand request, CancellationToken cancellationToken)
        {
            var user = await _userManager.FindByEmailAsync(request.Email);
            if (user == null || !await _userManager.IsEmailConfirmedAsync(user))
            {
                return new Result<string>(false, ResultStatusCode.NotFound, string.Empty, "User not found or email not confirmed.");
            }
            var token = await _userManager.GeneratePasswordResetTokenAsync(user);
            var mainResetUrl = System.Environment.GetEnvironmentVariable("RESET_PASSWORD_URL");
            var resetUrl = $"{mainResetUrl}{token}/{user.Email}";

            var message = $"<p>Please reset your password by clicking <a href='{resetUrl}'>here</a>.</p>";
            await _emailService.SendEmailAsync(user.Email, "Reset Password", message);
            
            return new Result<string>(true, ResultStatusCode.Success, token, "Password reset email sent");
        }
    }
}