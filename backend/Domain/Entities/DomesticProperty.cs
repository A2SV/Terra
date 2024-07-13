using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class DomesticProperty : BaseEntity
    {
        [ForeignKey("Property")]
        public Guid PropertyId { get; set; }
        public int NumberOfBedrooms { get; set; }
        public int NumberOfBathrooms { get; set; }
        public int NumberOfWashrooms { get; set; }
        public int NumberOfKitchens { get; set; }

        public required Property Property { get; set; }
    }
}