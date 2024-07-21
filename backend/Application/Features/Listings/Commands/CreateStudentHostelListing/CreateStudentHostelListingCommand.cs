using System.ComponentModel.DataAnnotations;
using Application.Features.Listings.Commands.Common;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateStudentHostelListing
{
    public class CreateStudentHostelListingCommand : InitiateCreateListingCommand, IRequest<Result<Property>>
    {
        public bool FurnishedStatus { get; set; }
        public int NumberOfBedrooms { get; set; }
        public int NumberOfBathrooms { get; set; }
        public int NumberOfWashrooms { get; set; }
        public int NumberOfKitchens { get; set; }
        
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