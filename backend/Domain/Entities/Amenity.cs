using Domain.Common;

namespace Domain.Entities
{
    public class Amenity : BaseEntity
    {
        public required string Name { get; set; }
        public string? Description { get; set; }
    }
}