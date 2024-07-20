using System.ComponentModel.DataAnnotations;
using Application.Features.Listings.Commands.Common;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateHotelListing
{
    public class CreateHotelListingCommand : InitiateCreateListingCommand, IRequest<Result<Property>>
    {
        public bool FurnishedStatus { get; set; }
        public int NumberOfBedrooms { get; set; }
        public int NumberOfBathrooms { get; set; }
        public int NumberOfWashrooms { get; set; }
        public int NumberOfKitchens { get; set; }
        
        [Range(1, 5)]
        public int StarRating { get; set; }
        public bool RestaurantOnSite { get; set; }
    }
}