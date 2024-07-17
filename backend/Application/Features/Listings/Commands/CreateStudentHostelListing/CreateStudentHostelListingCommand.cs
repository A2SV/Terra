using System.ComponentModel.DataAnnotations;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateStudentHostelListing
{
    public class CreateStudentHostelListingCommand : IRequest<Result<StudentHostel>>
    {
        [Required]
        public Guid ResidentialPropertyId { get; set; }
        [MinLength(1)]
        public List<StudentHostelRoomTypes> RoomTypes { get; set; } = null!;
        public StudentHostelType StudentHostelType { get; set; }
        public StudentHostelLocation StudentHostelLocation { get; set; }
        public bool SharedFacilities { get; set; }
        public bool MealPlanAvailable { get; set; }
        public bool StudyAreaAvailable { get; set; }
        public bool LaundryFacilityAvailable { get; set; }
        public bool CleaningServiceAvailable { get; set; }
    }
}