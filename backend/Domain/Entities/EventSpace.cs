using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;
using Domain.Enums;

namespace Domain.Entities
{
    public class EventSpace : BaseEntity
    {
        [ForeignKey(nameof(CommercialProperty))]
        public Guid CommercialPropertyId { get; set; }
        [Range(5, int.MaxValue)]
        public int MaximumCapacity { get; set; }
        public bool CateringServiceAvailable { get; set; }
        public bool AudioVisualEquipmentsAvailable { get; set; }
        [MinLength(1)]
        public List<EventSpaceSuitableEvents> SuitableEvents { get; set; } = new();

        public CommercialProperty CommercialProperty { get; set; } = null!;
    }
}