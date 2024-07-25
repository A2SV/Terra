using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Domain.Entities;

namespace Application.Models.Dto.ListingDto.GetListingByIdDto
{
    public class GetListingByIdDto
    {
        public Property Property { get; set; }
        public ResidentialProperty ResidentialProperty { get; set; }
        public CommercialProperty CommercialProperty { get; set; }
        public List<PropertyAmenity> PropertyAmenity { get; set; }
        public List<PropertyPhotoDto> PropertyPhotos { get; set; }
        public List<PropertyVideoDto> PropertyVideos { get; set; }
    }
}