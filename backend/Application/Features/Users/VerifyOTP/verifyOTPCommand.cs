using Application.Models.ApiResult;
using MediatR;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Users.VerifyOTP
{
    public class VerifyOTPCommand:IRequest<Result>
    {
        [Required, EmailAddress]
        public string Email { get; set; }

        [Required]
        public string Otp { get; set; }

        public VerifyOTPCommand(string email, string otp)
        {
            Email = email;
            Otp = otp;
        }
    }
}
