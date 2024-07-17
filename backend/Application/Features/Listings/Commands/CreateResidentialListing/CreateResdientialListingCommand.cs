using System.ComponentModel.DataAnnotations;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.CreateResidentialListing
{
    public class CreateResidentialListingCommand : IRequest<Result<ResidentialProperty>>
    {
        [Required]
        public Guid PropertyId { get; set; }
        public bool FurnishedStatus { get; set; }
        public int NumberOfBedrooms { get; set; }
        public int NumberOfBathrooms { get; set; }
        public int NumberOfWashrooms { get; set; }
        public int NumberOfKitchens { get; set; }
    }
}