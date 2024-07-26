using Domain.Entities;

namespace Application.Features.Listings.Dtos
{
    public class GetAllListingDto
    {
        public required Property Property { get; set; }
        public List<PropertyPhotoDto>? PropertyPhotos { get; set; }
        public List<PropertyVideoDto>? PropertyVideos { get; set; }
    }
}