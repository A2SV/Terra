using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class PropertyLocation : BaseEntity
    {
        [ForeignKey("Property")]
        public Guid PropertyId { get; set; }
        public required string StreetName { get; set; }
        public required string HouseNumber { get; set; }
        public required string City { get; set; }
        public required string Country { get; set; }
        public string? ZipCode { get; set; }
        public double Longitude { get; set; }
        public double Latitude { get; set; }

        public required Property Property { get; set; }
    }
}