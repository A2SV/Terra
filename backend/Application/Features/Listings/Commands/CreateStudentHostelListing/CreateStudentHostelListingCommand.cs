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
        public Guid ListerId { get; set; }
        [Required]
        public string Title { get; set; } = null!;
        public string? Description { get; set; }
        [Required]
        public PropertyType PropertyType { get; set; }
        [Required]
        public PropertyListingType ListingType { get; set; }
        public PropertyPublishStatus PropertyPublishStatus { get; set; } = PropertyPublishStatus.Unpublished;
        public PropertyMarketStatus PropertyMarketStatus { get; set; } = PropertyMarketStatus.Unavailable;
        public double? PropertySize { get; set; }
        public DateTime? AvailableStartDate { get; set; }
        public DateTime? AvailableEndDate { get; set; }
        public PaymentCurrency PaymentCurrency { get; set; } = PaymentCurrency.Ghs;
        public PaymentFrequency PaymentFrequency { get; set; } = PaymentFrequency.Once;
        [Required]
        public double Price { get; set; }
        [Required]
        public bool Negotiable { get; set; }
        [Required]
        public string StreetName { get; set; } = null!;
        [Required]
        public string HouseNumber { get; set; } = null!;
        [Required]
        public string City { get; set; } = null!;
        [Required]
        public string Country { get; set; } = null!;
        public string? ZipCode { get; set; }
        [Required, Range(-180, 180, ErrorMessage = "Longitude must be between -180 and 180.")]
        public double Longitude { get; set; }
        [Required, Range(-180, 180, ErrorMessage = "Latitude must be between -180 and 180.")]
        public double Latitude { get; set; }
        // public List<PropertyAmenity>? Amenities { get; set; }
        // public List<string>? Images { get; set; }
        // public List<string>? Videos { get; set; }

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