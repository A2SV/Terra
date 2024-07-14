using Domain.Common;

namespace Domain.Entities
{
    public class House : BaseEntity
    {
        public Guid PropertyId { get; set; }
        public double GarageSpace { get; set; }

        public required Property Property { get; set; }
    }
}