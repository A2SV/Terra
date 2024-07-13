using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;
using Domain.Enums;

namespace Domain.Entities
{
    public class Property : BaseEntity
    {
        [ForeignKey("Lister")]
        public Guid ListerId { get; set; }
        [MaxLength(100)]
        public required string Title { get; set; }
        public string? Description { get; set; }
        public required PropertyType PropertyType { get; set; }
        public PropertyPublishStatus PublishStatus { get; set; } = PropertyPublishStatus.Unpublished;
        public PropertyMarketStatus MarketStatus { get; set; } = PropertyMarketStatus.Available;
        public required PropertyListingType ListingType { get; set; }
        public double? PropertySize { get; set; }
        public bool ParkingSpace { get; set; }
        public bool FurnishedStatus { get; set; }
        public DateTime? AvailableStartDate { get; set; }
        public DateTime? AvailableEndDate { get; set; }

        public required User Lister { get; set; }
        
        public List<PropertyAmenity> PropertyAmenities { get; set; } = new();
    }
}