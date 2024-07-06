using Application.Contracts;
using Infrastructure.EmailService;
using MediatR;
using OtpNet;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.OTPService
{
    public class OTPService : IOTPService
    {
        private readonly IEmailService _emailService;

        public OTPService(IEmailService emailService)
        {
            _emailService = emailService;
        }
        public  Totp GenerateOTP()
        {
            var secretKey = KeyGeneration.GenerateRandomKey(20);
            var base32Secret = Base32Encoding.ToString(secretKey);
            var totp = new Totp(secretKey, step:60);

            return  totp;
        }

        public bool ValidateOtp(string storedOtp, string providedOtp)
        {
            return storedOtp == providedOtp;
        }


        public async Task SendOtpEmailAsync(string email, string otp)
        {
            var appName = "Terra";
            var expiryTime = "60 seconds";

            var subject = $"Your OTP for {appName}";
            var body = $@"
                    <html>
                    <head>
                        <style>
                            body {{
                                font-family: 'Arial', sans-serif;
                                color: #333;
                                line-height: 1.6;
                            }}
                            .otp {{
                                font-weight: bold;
                                color: #d64;
                            }}
                            .footer {{
                                font-size: 0.9em;
                            }}
                        </style>
                    </head>
                    <body>
                        <p>Hello,</p>
                        <p>Your One-Time Password (OTP) for <strong>{appName}</strong> is: <span class='otp'>{otp}</span>
                        <p>Please use this code to complete your verification process. Note: This code will expire in {expiryTime}.</p>
                        <p>If you did not request this code, please ignore this email or contact support if you feel this is an unauthorized action.</p>
                        </p>
                        
                        
                        <p class='footer'>
                            Thank you,<br>
                            <strong>{appName} Support Team</strong>
                        </p>
                    </body>
                    </html>";



            await _emailService.SendEmailAsync(email, subject, body);
        }
    }
}
