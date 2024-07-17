using System.ComponentModel.DataAnnotations;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.CreateShopListing
{
    public class CreateShopListingCommand : IRequest<Result<Shop>>
    {
        [Required]
        public Guid CommercialPropertyId { get; set; }
        public bool DisplayWindowAvailable { get; set; }
        public double StorageRoomSize { get; set; }
    }
}