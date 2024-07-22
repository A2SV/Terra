using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;
using Domain.Enums;

namespace Domain.Entities
{
    public class OfficeSpace : BaseEntity
    {
        [ForeignKey(nameof(CommercialProperty))]
        public Guid CommercialPropertyId { get; set; }
        public OfficeSpaceType OfficeSpaceType { get; set; }
        public bool MeetingRoomsAvailable { get; set; }
        public bool ReceptionAreaAvailable { get; set; }

        public CommercialProperty CommercialProperty { get; set; } = null!;
    }
}