using Domain.Common;

namespace Domain.Entities
{
    public class Role : BaseEntity
    {
        public required string RoleName { get; set; }
        public ICollection<User> Users { get; set; } = new List<User>();
    }
}
