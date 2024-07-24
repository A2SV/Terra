using System.ComponentModel.DataAnnotations;
using Application.Features.Listings.Commands.CreateApartmentListing;
using Application.Features.Listings.Commands.CreateEventSpaceListing;
using Application.Features.Listings.Commands.CreateGuestHouseListing;
using Application.Features.Listings.Commands.CreateHotelListing;
using Application.Features.Listings.Commands.CreateHouseListing;
using Application.Features.Listings.Commands.CreateOfficeSpaceListing;
using Application.Features.Listings.Commands.CreateShopListing;
using Application.Features.Listings.Commands.CreateStudentHostelListing;
using Application.Features.Listings.Commands.CreateWarehouseListing;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;
using Microsoft.AspNetCore.Http;

namespace Application.Features.Listings.Commands.Common
{
    public class InitiateCreateListingCommand : IRequest<Result<Property>>
    {
        [Required]
        public string ListerId { get; set; } = null!;
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
        public List<string>? Amenities { get; set; }
        public List<string>? Pictures { get; set; } 
        public List<string>? Videos { get; set; } 
        public CreateApartmentListingCommand? Apartment { get; set; }
        public CreateEventSpaceListingCommand? EventSpace { get; set; }
        public CreateGuestHouseListingCommand? GuestHouse { get; set; }
        public CreateHotelListingCommand? Hotel { get; set; }
        public CreateHouseListingCommand? House { get; set; }
        public CreateOfficeSpaceListingCommand? OfficeSpace { get; set; }
        public CreateShopListingCommand? Shop { get; set; }
        public CreateStudentHostelListingCommand? StudentHostel { get; set; }
        public CreateWarehouseListingCommand? Warehouse { get; set; }
        
    }
}

