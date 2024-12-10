using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using Domain.Enums;

namespace Application.Features.Listings.Commands.UpdateListing
{
    public class UpdateListingCommand : MediatR.IRequest<Application.Models.ApiResult.Result<Domain.Entities.Property>>
    {
        [JsonIgnore]
        public Guid PropertyId { get; set; }

        public string? Title { get; set; }
        public string? Description { get; set; }
        public PropertyListingType? ListingType { get; set; }
        public double? PropertySize { get; set; }
        public DateTime? AvailableStartDate { get; set; }
        public DateTime? AvailableEndDate { get; set; }
        public PaymentCurrency? PaymentCurrency { get; set; }
        public PaymentFrequency? PaymentFrequency { get; set; }
        public double? Price { get; set; }
        public bool? Negotiable { get; set; }

        public string? StreetName { get; set; }
        public string? HouseNumber { get; set; }
        public string? City { get; set; }
        public string? Country { get; set; }
        public string? ZipCode { get; set; }

        public double? Latitude { get; set; }
        public double? Longitude { get; set; }

        public List<string>? AddAmenities { get; set; }
        public List<string>? RemoveAmenities { get; set; }
    }
}
