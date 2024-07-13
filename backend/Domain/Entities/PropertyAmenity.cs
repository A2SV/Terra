using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class PropertyAmenity : BaseEntity
    {
        [ForeignKey("Property")]
        public Guid PropertyId { get; set; }
        public required Property Property { get; set; }

        [ForeignKey("Amenity")]
        public Guid AmenityId { get; set; }
        public required Amenity Amenity { get; set; }
    }
}