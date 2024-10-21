using Domain.Enums;

namespace Application.Features.Listings.Dtos
{
    public class OfficeSpaceDto
    {
        public OfficeSpaceType OfficeSpaceType { get; set; }
        public bool MeetingRoomsAvailable { get; set; }
        public bool ReceptionAreaAvailable { get; set; }
    }
}