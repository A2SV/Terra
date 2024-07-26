namespace Application.Features.Listings.Dtos
{
    public class ApartmentDto
    {
        public int NumberOfFloorsInBuilding { get; set; }
        public int FloorNumberOfUnit { get; set; }
        public bool LaundryFacilityAvailable { get; set; }
        public bool CleaningServiceAvailable { get; set; }
        public bool StudentFriendly { get; set; }
    }
}