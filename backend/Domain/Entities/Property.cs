using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;
using Domain.Enums;

namespace Domain.Entities
{
    public class Property : BaseEntity
    {
        [ForeignKey(nameof(Lister))]
        public string ListerId { get; set; } = null!;
        [ForeignKey(nameof(PaymentInformation))]
        public Guid PaymentInformationId { get; set; }
        [ForeignKey(nameof(PropertyLocation))]
        public Guid PropertyLocationId { get; set; }
        [ForeignKey("TypeId")]
        public Guid TypeId { get; set; }
        [MaxLength(100)]
        public required string Title { get; set; }
        public string? Description { get; set; }
        public required PropertyType PropertyType { get; set; }
        public PropertyPublishStatus PublishStatus { get; set; } = PropertyPublishStatus.Unpublished;
        public PropertyMarketStatus MarketStatus { get; set; } = PropertyMarketStatus.Unavailable;
        public required PropertyListingType ListingType { get; set; }
        public double? PropertySize { get; set; }
        public DateTime? AvailableStartDate { get; set; }
        public DateTime? AvailableEndDate { get; set; }

        public User Lister { get; set; } = null!;
        public PaymentInformation PaymentInformation { get; set; } = null!;
        public PropertyLocation PropertyLocation { get; set; } = null!;
    }
}