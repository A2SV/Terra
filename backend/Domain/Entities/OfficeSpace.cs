using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class OfficeSpace : BaseEntity
    {
        [ForeignKey("Property")]
        public Guid PropertyId { get; set; }
        public bool MeetingRoomsAvailable { get; set; }
        public bool ReceptionAreaAvailable { get; set; }

        public required Property Property { get; set; }
    }
}