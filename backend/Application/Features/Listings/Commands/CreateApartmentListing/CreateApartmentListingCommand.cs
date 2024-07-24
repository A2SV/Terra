using System.ComponentModel.DataAnnotations;
using Application.Features.Listings.Commands.Common;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateApartmentListing
{
    public class CreateApartmentListingCommand
    {

        public bool FurnishedStatus { get; set; }
        public int NumberOfBedrooms { get; set; }
        public int NumberOfBathrooms { get; set; }
        public int NumberOfWashrooms { get; set; }
        public int NumberOfKitchens { get; set; }

        public int NumberOfFloorsInBuilding { get; set; }
        public int FloorNumberOfUnit { get; set; }
        public bool LaundryFacilityAvailable { get; set; }
        public bool CleaningServiceAvailable { get; set; }
        public bool StudentFriendly { get; set; }
    }
}