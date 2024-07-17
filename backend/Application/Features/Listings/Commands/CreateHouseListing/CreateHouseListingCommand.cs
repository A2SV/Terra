using System.ComponentModel.DataAnnotations;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.CreateHouseListing
{
    public class CreateHouseListingCommand : IRequest<Result<House>>
    {
        [Required]
        public Guid ResidentialPropertyId { get; set; }
        public int NumberOfStories { get; set; }
        public double GarageSpace { get; set; }
        public bool StudentFriendly { get; set; }
    }
}