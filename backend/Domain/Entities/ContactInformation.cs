using Domain.Common;

namespace Domain.Entities
{
    public class ContactInformation : BaseEntity
    {
        public required string FirstName { get; set; }
        public required string LastName { get; set; }
        public required string Email { get; set; }
        public required string Phone { get; set; }
    }
}