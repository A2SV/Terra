namespace Application.Features.Listings.Dtos
{
    public class CommercialPropertyDto
    {
        public int TotalFloors {get; set;}
        public bool ParkingSpace {get; set;}
        public int FloorNumber {get; set;}
        public EventSpaceDto? EventSpaceDto { get; set; }
        public OfficeSpaceDto? OfficeSpaceDto { get; set; }
        public ShopDto? ShopDto { get; set; }
        public WarehouseDto? WarehouseDto { get; set; }
    }
}