using Domain.Common;

namespace Domain.Entities
{
    public class House : BaseEntity
    {
        public int NumberOfStories { get; set; }
        public double GarageSpace { get; set; }
        public bool StudentFriendly { get; set; }
    }
}