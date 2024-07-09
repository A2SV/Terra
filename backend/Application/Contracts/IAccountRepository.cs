using Domain.Entities;
using Application.Models.ApiResult;
using Microsoft.AspNetCore.Identity;

namespace Application.Contracts
{
    public interface IAccountRepository
    {
        Task<User?> GetUserByEmailAsync(string username, string password);
        Task<IdentityResult> RegisterUserAsync(User user, string password);

        
    }
}
