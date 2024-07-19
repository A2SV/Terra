using System.ComponentModel.DataAnnotations;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.CreateCommercialListing
{
    public class CreateCommercialListingCommand : IRequest<Result<CommercialProperty>>
    {
        [Required]
        public Guid PropertyId { get; set; }
        [Required]
        public int TotalFloors { get; set; }
        public int FloorNumber { get; set; }
        public bool ParkingSpace { get; set; }
    }
}