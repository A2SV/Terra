using Domain.Entities;
using Application.Models.ApiResult;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Contracts
{
    public interface IUserRepository
    {
        Task<User?> GetUserByEmailAsync(string username, string password);
        Task<Result> RegisterUserAsync(User user, string password);
    }
}
