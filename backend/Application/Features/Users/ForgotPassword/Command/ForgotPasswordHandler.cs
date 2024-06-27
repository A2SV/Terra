using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MediatR;
using MediatR.Pipeline;
using Application.Features.Users.ForgotPassword.Command;
using Domain.Entities;
using Microsoft.AspNetCore.Identity;

namespace Application.Features.Users.ForgotPassword.Command
{
    public class ForgotPasswordHandler : IRequestHandler<ForgotPasswordCommand>
    {
        
        private readonly UserManager<IdentityUser> _userManager;

        public ForgotPasswordHandler(UserManager<IdentityUser> userManager)
        {
            userManager = _userManager;
        }

        

    }
}