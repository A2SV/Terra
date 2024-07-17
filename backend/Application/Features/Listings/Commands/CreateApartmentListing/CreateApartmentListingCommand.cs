using System.ComponentModel.DataAnnotations;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.CreateApartmentListing
{
    public class CreateApartmentListingCommand : IRequest<Result<Apartment>>
    {
        [Required]
        public Guid ResidentialPropertyId { get; set; }
        public int NumberOfFloorsInBuilding { get; set; }
        public int FloorNumberOfUnit { get; set; }
        public bool LaundryFacilityAvailable { get; set; }
        public bool CleaningServiceAvailable { get; set; }
        public bool StudentFriendly { get; set; }
    }
}