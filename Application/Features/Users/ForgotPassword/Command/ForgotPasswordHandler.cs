using Application.Contracts;
using Application.Models.ApiResult;
using MediatR;
using Microsoft.AspNetCore.Identity;

namespace Application.Features.Users.ForgotPassword.Command
{
    public class ForgotPasswordHandler : IRequestHandler<ForgotPasswordCommand, Result>
    {
        private readonly UserManager<Domain.Entities.User> _userManager;
        private readonly IEmailService _emailService;

        public ForgotPasswordHandler(UserManager<Domain.Entities.User> userManager, IEmailService emailService)
        {
            _userManager = userManager;
            _emailService = emailService;
        }

        public async Task<Result> Handle(ForgotPasswordCommand request, CancellationToken cancellationToken)
        {
            var user = await _userManager.FindByEmailAsync(request.Email);
            if (user == null || !(await _userManager.IsEmailConfirmedAsync(user)))
            {
                return new Result(false, ResultStatusCode.NotFound, "User not found or email not confirmed.");
            }

            var token = await _userManager.GeneratePasswordResetTokenAsync(user);
            var resetUrl = $"https://yourwebsite.com/reset-password?token={token}&email={request.Email}";

            var message = $"<p>Please reset your password by clicking <a href='{resetUrl}'>here</a>.</p>";
            await _emailService.SendEmailAsync(user.Email, "Reset Password", message);
            
            return new Result(true, ResultStatusCode.Success, "Password reset email sent");
        }
    }
}