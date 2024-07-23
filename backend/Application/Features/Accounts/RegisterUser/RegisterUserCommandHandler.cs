using Application.Models.ApiResult;
using MediatR;
using Application.Contracts;
using Microsoft.AspNetCore.Identity;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;




namespace Application.Features.Accounts.RegisterUser
{
    public class RegisterUserCommandHandler : IRequestHandler<RegisterUserCommand, Result<User>>
    {
        private readonly IAccountRepository _userRepository;
        private readonly UserManager<User> _userManager;
        private readonly IOTPService _otpService;
        private readonly IOTPRepository _otpRepository;
        public RegisterUserCommandHandler(IAccountRepository userRepository, UserManager<User> userManager,
            /*IOTPService otpService*/ IOTPRepository otpRepository)
        {
            _userRepository = userRepository;
            _userManager = userManager;
            //_otpService = otpService;
            _otpRepository = otpRepository;
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
                PhoneNumber = request.PhoneNumber,

                
            };

            var result = await _userRepository.RegisterUserAsync(newUser, request.Password);
            if (!result.Succeeded)
            {
                string errors = string.Join("; ", result.Errors.Select(e => e.Description));

                return new Result<User>(false, ResultStatusCode.BadRequest, null, $"User creation failed: {errors}");
            }

            //var totp = _otpService.GenerateOTP();
            var otp = "123456";
            var otpEntry = new OtpEntry
            {
                UserId = newUser.Id,
                Otp = otp,  
                Expiry = DateTime.UtcNow.AddSeconds(120)
            };
            await _otpRepository.AddOtpEntryAsync(otpEntry);
            // await _otpService.SendOtpEmailAsync(newUser.Email, otp);

            return new Result<User>(true, ResultStatusCode.Created, newUser, "Registration successful");

        }
    }
}
