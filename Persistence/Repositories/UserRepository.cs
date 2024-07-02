using Application.Contracts;
using Application.Models.ApiResult;
using Domain.Entities;
using Microsoft.AspNetCore.Identity;

namespace Persistence.Repositories
{
    public class UserRepository : IUserRepository
        {
            private readonly UserManager<User> userManager;

            public UserRepository(UserManager<User> userManager)
            {
                this.userManager = userManager;

            }

            public async Task<User?> GetUserByEmailAsync(string username, string password)
            {
                var existingUser = await userManager.FindByEmailAsync(username);

                if (existingUser != null)
                {
                    var result = await userManager.CheckPasswordAsync(existingUser, password);

                    return result ? existingUser : null;
                }
                return null;
            }


            public async Task<IdentityResult> RegisterUserAsync(User user, string password)
            {
                user.UserName = user.Email;

                return await userManager.CreateAsync(user, password);
            }
        }
}


