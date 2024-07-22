using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class ResidentialProperty : BaseEntity
    {
        [ForeignKey(nameof(Property))]
        public Guid PropertyId { get; set; }
        public bool FurnishedStatus { get; set; }
        public int NumberOfBedrooms { get; set; }
        public int NumberOfBathrooms { get; set; }
        public int NumberOfWashrooms { get; set; }
        public int NumberOfKitchens { get; set; }

        public Property Property { get; set; } = null!;
    }
}