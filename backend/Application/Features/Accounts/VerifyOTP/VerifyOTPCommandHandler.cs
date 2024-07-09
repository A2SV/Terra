using Application.Contracts;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Identity;


namespace Application.Features.Accounts.VerifyOTP
{
    public class VerifyOTPCommandHandler:IRequestHandler<VerifyOTPCommand, Result>
    {
        private readonly UserManager<User> _userManager;
        private readonly IOTPRepository _OTPRepository;
        private readonly IOTPService _otpService;

        public VerifyOTPCommandHandler(UserManager<User> userManager, IOTPRepository OTPRepository, IOTPService otpService)
        {
            _userManager = userManager;
            _OTPRepository = OTPRepository;
            _otpService = otpService;
        }

        public async Task<Result> Handle(VerifyOTPCommand request, CancellationToken cancellationToken)
        {
            var user = await _userManager.FindByEmailAsync(request.Email);
            if (user == null)
            {
                return new Result(false, ResultStatusCode.NotFound, "User not found.");
            }

            var otpEntry = await _OTPRepository.GetOtpEntryAsync(user.Id);
            if (otpEntry == null || otpEntry.Expiry < DateTime.UtcNow)
            {
                return new Result(false, ResultStatusCode.BadRequest, "OTP has expired or is invalid.");
            }

            if (!_otpService.ValidateOtp(otpEntry.Otp, request.Otp))
            {
                return new Result(false, ResultStatusCode.BadRequest, "Invalid OTP.");
            }

           
            user.EmailConfirmed = true;
            var identityResult = await _userManager.UpdateAsync(user);
            if (!identityResult.Succeeded)
            {
                return new Result(false, ResultStatusCode.ServerError, "Failed to update user verification status.");
            }

            await _OTPRepository.DeleteOtpEntryAsync(otpEntry.OtpId);

            return new Result(true, ResultStatusCode.Success, "OTP verification successful.");
        }

    }
}
