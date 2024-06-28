using Microsoft.AspNetCore.Identity;

namespace Domain.Common
{
    public class BaseEntity : IdentityUser
    {
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }
}