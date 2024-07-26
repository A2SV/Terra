using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Domain.Entities;



namespace Application.Models.Dto.ListingDto.GetListingDto
{
    public class GetListingDto
{
    public Property Property { get; set; }
    public ResidentialPropertyDto ResidentialProperty { get; set; }
    public CommercialPropertyDto CommercialProperty { get; set; }
    public List<AmenityDto> PropertyAmenity { get; set; }
    
    public List<PropertyPhotoDto> PropertyPhotos { get; set; }
    public List<PropertyVideoDto> PropertyVideos { get; set; }
}

    public class ResidentialPropertyDetailsDto : ResidentialPropertyDto
    {
        public List<ApartmentDto> Apartments { get; set; }
        public List<GuestHouseDto> GuestHouses { get; set; }
        public List<HotelDto> Hotels { get; set; }
        public List<HouseDto> Houses { get; set; }
        public List<StudentHostelDto> StudentHostels { get; set; }
    }

    public class CommercialPropertyDetailsDto : CommercialPropertyDto
    {
        public List<EventSpaceDto> EventSpaces { get; set; }
        public List<OfficeSpaceDto> OfficeSpaces { get; set; }
        public List<ShopDto> Shops { get; set; }
        public List<WarehouseDto> Warehouses { get; set; }
    }

}