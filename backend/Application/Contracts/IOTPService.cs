using OtpNet;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Contracts
{
    public interface  IOTPService
    {
        public Totp GenerateOTP();

        public bool ValidateOtp(string storedOtp, string providedOtp);

        public Task SendOtpEmailAsync(string email, string otp);
        

    }
}
