using Domain.Entities;
using Domain.Interfaces;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
    }
}
