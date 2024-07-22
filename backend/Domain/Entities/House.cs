using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class House : BaseEntity
    {
        [ForeignKey(nameof(ResidentialProperty))]
        public Guid ResidentialPropertyId { get; set; }
        public int NumberOfStories { get; set; }
        public double GarageSpace { get; set; }
        public bool StudentFriendly { get; set; }

        public ResidentialProperty ResidentialProperty { get; set; } = null!;
    }
}