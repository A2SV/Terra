using System.ComponentModel.DataAnnotations;
using Application.Features.Listings.Commands.Common;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateOfficeSpaceListing
{
    public class CreateOfficeSpaceListingCommand
    {
        [Required]
        public int TotalFloors { get; set; }
        public int FloorNumber { get; set; }
        public bool ParkingSpace { get; set; }

        public OfficeSpaceType OfficeSpaceType { get; set; }
        public bool MeetingRoomsAvailable { get; set; }
        public bool ReceptionAreaAvailable { get; set; }
    }
}