using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class Shop : BaseEntity
    {
        [ForeignKey(nameof(CommercialProperty))]
        public Guid CommercialPropertyId { get; set; }
        public bool DisplayWindowAvailable { get; set; }
        public double StorageRoomSize { get; set; }

        public CommercialProperty CommercialProperty { get; set; } = null!;
    }
}