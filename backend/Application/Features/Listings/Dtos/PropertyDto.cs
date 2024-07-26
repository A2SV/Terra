using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Entities;
using Domain.Enums;

namespace Application.Features.Listings.Dtos
{
    public class PropertyDto
    {
        [ForeignKey(nameof(Lister))]
        public string ListerId { get; set; } = null!;
        [ForeignKey(nameof(PaymentInformation))]
        public Guid PaymentInformationId { get; set; }
        [ForeignKey(nameof(PropertyLocation))]
        public Guid PropertyLocationId { get; set; }

        [MaxLength(100)]
        public required string Title { get; set; }
        public string? Description { get; set; }
        public required ResidentialOrCommercial PropertyType { get; set;}
        public required PropertyType PropertySubType { get; set; }
        public PropertyPublishStatus PublishStatus { get; set; } = PropertyPublishStatus.Unpublished;
        public PropertyMarketStatus MarketStatus { get; set; } = PropertyMarketStatus.Unavailable;
        public required PropertyListingType ListingType { get; set; }
        public double? PropertySize { get; set; }
        public DateTime? AvailableStartDate { get; set; }
        public DateTime? AvailableEndDate { get; set; }

        public User Lister { get; set; } = null!;
        public PaymentInformation PaymentInformation { get; set; } = null!;
        public PropertyLocation PropertyLocation { get; set; } = null!;
        public List<PropertyPhotoDto>? PropertyPhotos { get; set; }
        public List<PropertyVideoDto>? PropertyVideos { get; set; }
    }
}