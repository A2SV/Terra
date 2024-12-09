using System.ComponentModel.DataAnnotations;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.UpdateListing
{
    public class UpdateListingCommand : IRequest<Result<Property>>
    {
        [Required]
        public Guid PropertyId {get; set;}
        public string? Title {get; set;}
        public string? Description {get; set;}
        public PropertyListingType? ListingType {get; set;}
        public double? PropertySize {get; set;}
        public DateTime? AvailableStartDate {get; set;}
        public DateTime? AvailableEndDate {get; set;}
        public PaymentCurrency? PaymentCurrency {get; set;}
        public PaymentFrequency? PaymentFrequency {get; set;}
        public double? Price {get; set;}
        public bool? Negotiable {get; set;}

        public string? StreetName {get; set;}
        public string? HouseNumber {get; set;}
        public string? City {get; set;}
        public string? Country {get; set;}
        public string? ZipCode {get; set;}

        [Range(-180, 180)]
        public double? Latitude {get; set;}

        [Range(-180, 180)]
        public double? Longitude {get; set;}

        public List<string>? AddAmenities {get; set;}
        public List<string>? RemoveAmenities {get; set;}
    }
}