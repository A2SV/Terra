using System.ComponentModel.DataAnnotations;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateEventSpaceListing
{
    public class CreateEventSpaceListingCommand : IRequest<Result<EventSpace>>
    {
        [Required]
        public Guid CommercialPropertyId { get; set; }
        [Range(5, int.MaxValue)]
        public int MaximumCapacity { get; set; }
        public bool CateringServiceAvailable { get; set; }
        public bool AudioVisualEquipmentsAvailable { get; set; }
        [MinLength(1)]
        public List<EventSpaceSuitableEvents> SuitableEvents { get; set; } = null!;
    }
}