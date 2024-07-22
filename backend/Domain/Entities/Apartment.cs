using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class Apartment : BaseEntity
    {
        [ForeignKey(nameof(ResidentialProperty))]
        public Guid ResidentialPropertyId { get; set; }
        public int NumberOfFloorsInBuilding { get; set; }
        public int FloorNumberOfUnit { get; set; }
        public bool LaundryFacilityAvailable { get; set; }
        public bool CleaningServiceAvailable { get; set; }
        public bool StudentFriendly { get; set; }

        public ResidentialProperty ResidentialProperty { get; set; } = null!;
    }
}