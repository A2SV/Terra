using System.Security.Claims;
using Domain.Entities;

namespace Application.Contracts
{
    public interface ITokenRepository
    {
        string GenerateJwtToken(User user, string[] roles);
        public ClaimsPrincipal? VerifyJwt(string token);
    }
}
