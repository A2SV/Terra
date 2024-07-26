using System.ComponentModel.DataAnnotations;
using Application.Features.Listings.Commands.Common;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateShopListing
{
    public class CreateShopListingCommand
    {
        [Required]
        public int TotalFloors { get; set; }
        public int FloorNumber { get; set; }
        public bool ParkingSpace { get; set; }

        public bool DisplayWindowAvailable { get; set; }
        public double StorageRoomSize { get; set; }
    }
}