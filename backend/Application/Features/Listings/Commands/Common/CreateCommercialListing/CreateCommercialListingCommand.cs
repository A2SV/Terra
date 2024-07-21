using System.ComponentModel.DataAnnotations;
using Application.Features.Listings.Commands.Common;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.CreateCommercialListing
{
    public class CreateCommercialListingCommand : InitiateCreateListingCommand
    {
        [Required]
        public int TotalFloors { get; set; }
        public int FloorNumber { get; set; }
        public bool ParkingSpace { get; set; }
    }
}