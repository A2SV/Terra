using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Identity;

namespace Application.Features.Users.ResetPassword;

public class ResetPasswordHandler : IRequestHandler<ResetPasswordCommand>
{
    private readonly UserManager<User> _userManager;

    public ResetPasswordHandler(UserManager<User> userManager)
    {
        _userManager = userManager;
    }
    
    
}