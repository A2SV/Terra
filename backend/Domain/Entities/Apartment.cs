using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class Apartment : BaseEntity
    {
        [ForeignKey("Property")]
        public Guid PropertyId { get; set; }
        public int FloorNumberOfUnit { get; set; }
        public bool LaundryFacilityAvailable { get; set; }
        public bool CleaningServiceAvailable { get; set; }

        public required Property Property { get; set; }
    }
}