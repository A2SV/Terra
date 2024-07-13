using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;
using Domain.Enums;

namespace Domain.Entities
{
    public class StudentHostel : BaseEntity
    {
        [ForeignKey("Property")]
        public Guid PropertyId { get; set; }
        [MinLength(1)]
        public List<StudentHostelRoomTypes> RoomTypes { get; set; } = [];
        public required StudentHostelType HostelType { get; set; }
        public required StudentHostelLocation HostelLocation { get; set; }
        public bool SharedFacilities { get; set; }
        public bool MealPlanAvailable { get; set; }
        public bool StudyAreaAvailable { get; set; }
        public bool LaundryFacilityAvailable { get; set; }
        public bool CleaningServiceAvailable { get; set; }

        public required Property Property { get; set; }
    }
}