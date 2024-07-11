using Application.Contracts;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Identity;

namespace Application.Features.Accounts.LoginUser.Command
{
    public class LoginUserCommandHandler : IRequestHandler<LoginUserCommand, TokenUserResult>
    {
        private readonly UserManager<User> userManager;
        private readonly IAccountRepository userRepository;
        private readonly ITokenRepository tokenRepository;

        public LoginUserCommandHandler(UserManager<User> userManager,IAccountRepository userRepository, ITokenRepository tokenRepository)
        {
            this.userManager = userManager;
            this.userRepository = userRepository;
            this.tokenRepository = tokenRepository;
        }

        public async Task<TokenUserResult> Handle(LoginUserCommand request, CancellationToken cancellationToken)
        {
            var existingUser = await userRepository.GetUserByEmailAsync(request.Email, request.Password);

            if (existingUser == null)
            {
                return new TokenUserResult(
                    false,
                    ResultStatusCode.BadRequest,
                    "User login failed",
                    string.Empty,
                    new {}
                );
            }

            var userRoles = await userManager.GetRolesAsync(existingUser);

            var JwtToken = tokenRepository.GenerateJwtToken(existingUser, userRoles.ToArray());

            return new TokenUserResult(
                    true,
                    ResultStatusCode.Created,
                    "User login successful",
                    JwtToken,
                    new
                    {
                        Id = existingUser.Id,
                        FirstName = existingUser.FirstName,
                        LastName = existingUser.LastName,
                        Email = existingUser.Email,
                        ProfilePicture = existingUser.ProfilePictureUrl
                    }
                );
        }
    }
}
