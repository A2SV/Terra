<<<<<<< HEAD
using Microsoft.AspNetCore.Identity;

namespace Domain.Common
{
    public class BaseEntity : IdentityUser
    {
=======
namespace Domain.Common
{
    public class BaseEntity
    {
        public Guid Id { get; set; }
>>>>>>> fb4fcd14bf4f118b75605828c1f86a74faa56379
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }
}