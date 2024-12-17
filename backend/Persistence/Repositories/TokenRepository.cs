using Application.Contracts;
using Domain.Entities;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Persistence.Repositories
{
    public class TokenRepository : ITokenRepository
    {
        private readonly IConfiguration configuration;

        public TokenRepository(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public string GenerateJwtToken(User user, string[] roles)
        {
            var claims = new List<Claim>();

            claims.Add(new Claim(ClaimTypes.Email, user.Email));

            foreach (var role in roles)
            {
                claims.Add(new Claim(ClaimTypes.Role, role));
            }
            
            var Jwt_key = System.Environment.GetEnvironmentVariable("JWT_KEY");
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Jwt_key));
            var jwt_issuer = System.Environment.GetEnvironmentVariable("JWT_ISSUER");
            var jwt_audience = System.Environment.GetEnvironmentVariable("JWT_AUDIENCE");
            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                jwt_issuer,
                jwt_audience,
                claims,
                expires: DateTime.Now.AddDays(3),
                signingCredentials: credentials
                );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
        
        public ClaimsPrincipal? VerifyJwt(string token)
        {
            var Jwt_key = System.Environment.GetEnvironmentVariable("JWT_KEY");
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Jwt_key));
            var jwt_issuer = System.Environment.GetEnvironmentVariable("JWT_ISSUER");
            var jwt_audience = System.Environment.GetEnvironmentVariable("JWT_AUDIENCE");

            var tokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuer = true,
                ValidIssuer = jwt_issuer,
                ValidateAudience = true,
                ValidAudience = jwt_audience,
                ValidateLifetime = true,
                IssuerSigningKey = key,
                ValidateIssuerSigningKey = true
            };

            var tokenHandler = new JwtSecurityTokenHandler();

            try
            {
                var principal = tokenHandler.ValidateToken(token, tokenValidationParameters, out var validatedToken);

                // Ensure the token is a valid JWT
                if (validatedToken is JwtSecurityToken jwtToken &&
                    jwtToken.Header.Alg.Equals(SecurityAlgorithms.HmacSha256, StringComparison.InvariantCultureIgnoreCase))
                {
                    return principal;
                }
                else
                {
                    throw new SecurityTokenException("Invalid token");
                }
            }
            catch (Exception)
            {
                // Log or handle token validation failure
                return null;
            }
        }
    }
}
