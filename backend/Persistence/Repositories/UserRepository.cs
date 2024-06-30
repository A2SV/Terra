using Application.Models.ApiResult;
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
    public class UserRepository:IUserRepository
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


        using Application.Models.ApiResult;
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


            public async Task<Result> RegisterUserAsync(User user, string password)
            {
                var existingUser = await userManager.FindByEmailAsync(user.Email);
                if (existingUser != null)
                {
                    return new Result(false, ResultStatusCode.BadRequest, "A user with this email already exists.");
                }


                user.UserName = user.Email;

                var result = await userManager.CreateAsync(user, password);
                if (result.Succeeded)
                {
                    return new Result(true, ResultStatusCode.Success, "User created successfully.");
                }


                string errors = string.Join("; ", result.Errors.Select(e => e.Description));
                return new Result(false, ResultStatusCode.BadRequest, $"User creation failed: {errors}");
            }
        }
    }

}
}
