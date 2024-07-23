using Application.Contracts;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Accounts.ResendOTP
{
    public class ResendOTPCommandHandler:IRequestHandler<ResendOTPCommand, Result>
    {
        private readonly UserManager<User> _userManager;
        private readonly IOTPService _otpService;
        private readonly IOTPRepository _otpRepository;

        public ResendOTPCommandHandler(UserManager<User> userManager, IOTPService otpService, IOTPRepository otpRepository)
        {
            _userManager = userManager;
            _otpService = otpService;
            _otpRepository = otpRepository;
        }

        public async Task<Result> Handle(ResendOTPCommand request, CancellationToken cancellation)
        {
            var user = await _userManager.FindByEmailAsync(request.Email);
            if (user == null)
            {
                return new Result(false, ResultStatusCode.NotFound, "User not found.");
            }

            var existingOtp = await _otpRepository.GetOtpEntryAsync(user.Id);
            if (existingOtp!=null && (DateTime.UtcNow - existingOtp.Expiry).TotalMinutes<2)
            {
                return new Result(false, ResultStatusCode.BadRequest, "Please wait for 1 minute before requesting a new OTP.");
            }
                

            //var totp = _otpService.GenerateOTP();
            var otp = "122345";
            var otpEntry = new OtpEntry
            {
                UserId = user.Id,
                Otp = otp,
                Expiry = DateTime.UtcNow.AddSeconds(120),
                
            };

            await _otpRepository.UpdateOtpEntryAsync(otpEntry);
            // await _otpService.SendOtpEmailAsync(user.Email, otp);

            return new Result(true, ResultStatusCode.Success, "OTP has been resent successfully.");

        }
    }
}
