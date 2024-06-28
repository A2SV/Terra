using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MediatR;

namespace Application.Features.Users.ForgotPassword.Command
{
    public class ForgotPasswordCommand : IRequest
    {
        public string Email {get; set;}

        public ForgotPasswordCommand(string email)
        {
            Email = email;
        }
    }
}