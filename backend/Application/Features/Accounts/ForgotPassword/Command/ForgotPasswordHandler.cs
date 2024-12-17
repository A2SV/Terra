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
        private readonly ITokenRepository _tokenRepository;
        
        public ForgotPasswordHandler(UserManager<User> userManager, IEmailService emailService, ITokenRepository tokenRepository)
        {
            _userManager = userManager;
            _emailService = emailService;
            _tokenRepository = tokenRepository;
        }

        public async Task<Result<string>> Handle(ForgotPasswordCommand request, CancellationToken cancellationToken)
        {
            var user = await _userManager.FindByEmailAsync(request.Email);
            if (user == null || !await _userManager.IsEmailConfirmedAsync(user))
            {
                return new Result<string>(false, ResultStatusCode.NotFound, string.Empty, "User not found or email not confirmed.");
            }
            
            var userRoles = await _userManager.GetRolesAsync(user);
            var token = _tokenRepository.GenerateJwtToken(user, userRoles.ToArray());
            
            var mainResetUrl = System.Environment.GetEnvironmentVariable("RESET_PASSWORD_URL");
            var encodedToken = Uri.EscapeDataString(token);
            var resetUrl = $"{mainResetUrl}?token={encodedToken}";

            var message = $"<p>Please reset your password by clicking <a href='{resetUrl}'>here</a>.</p>";
            await _emailService.SendEmailAsync(user.Email, "Reset Password", message);
            
            return new Result<string>(true, ResultStatusCode.Success, "Password reset email sent");
        }
    }
}