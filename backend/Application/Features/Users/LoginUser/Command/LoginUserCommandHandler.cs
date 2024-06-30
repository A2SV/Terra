using Application.Models;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Interfaces;
using MediatR;
using Microsoft.AspNetCore.Identity;

namespace Application.Features.Users.LoginUser.Command
{
    public class LoginUserCommandHandler : IRequestHandler<LoginUserCommand, Result<string>>
    {
        private readonly UserManager<User> userManager;
        private readonly IUserRepository userRepository;
        private readonly ITokenRepository tokenRepository;

        public LoginUserCommandHandler(UserManager<User> userManager,IUserRepository userRepository, ITokenRepository tokenRepository)
        {
            this.userManager = userManager;
            this.userRepository = userRepository;
            this.tokenRepository = tokenRepository;
        }

        public async Task<Result<string>> Handle(LoginUserCommand request, CancellationToken cancellationToken)
        {
            var existingUser = await userRepository.GetUserByEmailAsync(request.UserName, request.Password);

            if (existingUser == null)
            {
                return new Result<string>(
                    false,
                    ResultStatusCode.BadRequest,
                    string.Empty,
                    "Invalid login credentials"
                );
            }

            var userRoles = await userManager.GetRolesAsync(existingUser);

            var JwtToken = tokenRepository.GenerateJwtToken(existingUser, userRoles.ToArray());

            return new Result<string>(
                true,
                ResultStatusCode.Success,
                JwtToken,
                "Login credentials valid"
            );
        }
    }
}
