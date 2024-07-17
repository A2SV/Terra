using System.ComponentModel.DataAnnotations;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateOfficeSpaceListing
{
    public class CreateOfficeSpaceListingCommand : IRequest<Result<OfficeSpace>>
    {
        [Required]
        public Guid CommercialPropertyId { get; set; }
        public OfficeSpaceType OfficeSpaceType { get; set; }
        public bool MeetingRoomsAvailable { get; set; }
        public bool ReceptionAreaAvailable { get; set; }
    }
}