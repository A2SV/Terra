using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;
using Domain.Enums;

namespace Domain.Entities
{
    public class OfficeSpace : BaseEntity
    {
        [ForeignKey("Property")]
        public Guid PropertyId { get; set; }
        public OfficeSpaceType OfficeSpaceType { get; set; }
        public bool MeetingRoomsAvailable { get; set; }
        public bool ReceptionAreaAvailable { get; set; }

        public required CommercialProperty Property { get; set; }
    }
}