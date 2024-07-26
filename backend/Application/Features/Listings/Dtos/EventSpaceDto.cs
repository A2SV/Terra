using Domain.Enums;

namespace Application.Features.Listings.Dtos
{
    public class EventSpaceDto
    {
        public int MaximumCapacity { get; set; }
        public bool CateringServiceAvailable { get; set; }
        public bool AudioVisualEquipmentsAvailable { get; set; }
        public List<EventSpaceSuitableEvents>? SuitableEvents { get; set; }
    }
}