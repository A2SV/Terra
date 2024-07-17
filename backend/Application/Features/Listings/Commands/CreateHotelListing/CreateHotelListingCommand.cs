using System.ComponentModel.DataAnnotations;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.CreateHotelListing
{
    public class CreateHotelListingCommand : IRequest<Result<Hotel>>
    {
        [Required]
        public Guid ResidentialPropertyId { get; set; }
        [Range(1, 5)]
        public int StarRating { get; set; }
        public bool RestaurantOnSite { get; set; }
    }
}