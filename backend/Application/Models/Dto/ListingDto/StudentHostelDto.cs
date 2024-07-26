using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Domain.Enums;

namespace Application.Models.Dto.ListingDto
{
    public class StudentHostelDto
    {
        public List<StudentHostelRoomTypes> RoomTypes {get; set;}
        public int HostelType {get; set;}
        public int HostelLocation {get; set;}
        public bool SharedFacilities {get; set;}
        public bool MealPlanAvailable {get; set;}
        public bool StudyAreaAvailable {get; set;}
        public bool LaundryFacilityAvailable {get; set;}
        public bool CleaningServiceAvailable {get; set;}
        public DateTime CreatedAt {get; set;}
        public DateTime UpdatedAt {get; set;}

        public Guid ResidentialPropertyId {get; set;}
    }
}