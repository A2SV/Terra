using Domain.Common;

namespace Domain.Entities
{
    public class House : BaseEntity
    {
        public Guid PropertyId { get; set; }
        public int NumberOfStories { get; set; }
        public double GarageSpace { get; set; }
        public bool StudentFriendly { get; set; }

        public required ResidentialProperty Property { get; set; }
    }
}