using System;
using System.Collections.Generic;
using System.Linq;
using Application.Models.ApiResult;
using MediatR;

namespace Application.Features.Accounts.ForgotPassword.Command
{
    public class ForgotPasswordCommand : IRequest<Result>
    {
        public string Email {get; set;}

        public ForgotPasswordCommand(string email)
        {
            Email = email;
        }
    }
}