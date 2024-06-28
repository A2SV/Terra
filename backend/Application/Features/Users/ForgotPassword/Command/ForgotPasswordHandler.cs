using Domain.Interfaces;
using MediatR;
using Microsoft.AspNetCore.Identity;
using Domain.Entities;

namespace Application.Features.Users.ForgotPassword.Command
{
    public class ForgotPasswordHandler : IRequestHandler<ForgotPasswordCommand>
    {
        private readonly UserManager<User> _userManager;
        private readonly IEmailService _emailService;

        public ForgotPasswordHandler(UserManager<User> userManager, IEmailService emailService)
        {
            _userManager = userManager;
            _emailService = emailService;
        }

        public async Task Handle(ForgotPasswordCommand request, CancellationToken cancellationToken)
        {
            var user = await _userManager.FindByEmailAsync(request.Email);
            if (user == null || !(await _userManager.IsEmailConfirmedAsync(user)))
            {
                // Don't reveal that the user does not exist or is not confirmed
                throw new Exception("User does not exist.");
            }

            var token = await _userManager.GeneratePasswordResetTokenAsync(user);
            var resetUrl = $"https://yourwebsite.com/reset-password?token={token}&email={user.Email}";

            var message = $"<p>Please reset your password by clicking <a href='{resetUrl}'>here</a>.</p>";
            await _emailService.SendEmailAsync(user.Email, "Reset Password", message);
        }
    }
}