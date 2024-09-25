using Domain.Enums;

namespace Application.Features.Listings.Dtos
{
    public class StudentHostelDto
    {
        public List<StudentHostelRoomTypes>? RoomTypes {get; set;}
        public StudentHostelType HostelType {get; set;}
        public StudentHostelLocation HostelLocation {get; set;}
        public bool SharedFacilities {get; set;}
        public bool MealPlanAvailable {get; set;}
        public bool StudyAreaAvailable {get; set;}
        public bool LaundryFacilityAvailable {get; set;}
        public bool CleaningServiceAvailable {get; set;}
    }
}