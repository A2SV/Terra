namespace Application.Features.Listings.Dtos
{
    public class ResidentialPropertyDto
    {
        public bool FurnishedStatus {get; set;}
        public int NumberOfBedrooms {get; set;}
        public int NumberOfBathrooms {get; set;}
        public int NumberOfWashrooms {get; set;}
        public int NumberOfKitchens {get; set;}

        public ApartmentDto? ApartmentDto {get; set;}
        public GuestHouseDto? GuestHouseDto { get; set; }
        public HouseDto? HouseDto {get; set;}
        public HotelDto? HotelDto {get; set;}
        public StudentHostelDto? StudentHostelDto { get; set; }
    }
}