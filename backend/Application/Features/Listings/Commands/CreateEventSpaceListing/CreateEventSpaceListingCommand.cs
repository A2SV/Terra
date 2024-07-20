using System.ComponentModel.DataAnnotations;
using Application.Features.Listings.Commands.Common;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateEventSpaceListing
{
    public class CreateEventSpaceListingCommand : InitiateCreateListingCommand, IRequest<Result<Property>>
    {
        [Required]
        public int TotalFloors { get; set; }
        public int FloorNumber { get; set; }
        public bool ParkingSpace { get; set; }

        [Range(5, int.MaxValue)]
        public int MaximumCapacity { get; set; }
        public bool CateringServiceAvailable { get; set; }
        public bool AudioVisualEquipmentsAvailable { get; set; }
        [MinLength(1)]
        public List<EventSpaceSuitableEvents> SuitableEvents { get; set; } = null!;
    }
}