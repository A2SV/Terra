using Application.Models.ApiResult;
using MediatR;
using Application.Contracts;
using Microsoft.AspNetCore.Identity;
using Domain.Entities;

namespace Application.Features.Users.RegisterUser
{
    public class RegisterUserCommandHandler : IRequestHandler<RegisterUserCommand, Result<User>>
    {
        private readonly IUserRepository _userRepository;
        private readonly UserManager<User> _userManager;

        public RegisterUserCommandHandler(IUserRepository userRepository, UserManager<User> userManager)
        {
            _userRepository = userRepository;
            _userManager = userManager;
        }

        public async Task<Result<User>> Handle(RegisterUserCommand request, CancellationToken cancellationToken)
        {
            var existingUser = await _userManager.FindByEmailAsync(request.Email);
            if (existingUser != null)
            {
                return new Result<User>(false, ResultStatusCode.BadRequest, null, "A user with this email already exists.");
            }


            var newUser = new User
            {
                FirstName = request.FirstName,
                LastName = request.LastName,
                Email = request.Email,
                UserName = request.Email,
                PhoneNumber = request.PhoneNumber
            };

            var result = await _userRepository.RegisterUserAsync(newUser, request.Password);

            if (!result.Succeeded)
            {
                string errors = string.Join("; ", result.Errors.Select(e => e.Description));
                return new Result<User>(false, ResultStatusCode.BadRequest, null, $"User creation failed: {errors}");
            }
            return new Result<User>(true, ResultStatusCode.Created, newUser, "Registration successful");
        }
    }
}
