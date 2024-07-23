using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class Property
{
    public Guid Id { get; set; }

    public string ListerId { get; set; } = null!;

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public int PropertyType { get; set; }

    public int PublishStatus { get; set; }

    public int MarketStatus { get; set; }

    public int ListingType { get; set; }

    public double? PropertySize { get; set; }

    public DateTime? AvailableStartDate { get; set; }

    public DateTime? AvailableEndDate { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }

    public Guid PaymentInformationId { get; set; }

    public Guid PropertyLocationId { get; set; }

    public Guid TypeId { get; set; }

    public virtual User Lister { get; set; } = null!;

    public virtual PaymentInformation PaymentInformation { get; set; } = null!;

    public virtual ICollection<PropertyAmenity> PropertyAmenities { get; set; } = new List<PropertyAmenity>();

    public virtual PropertyLocation PropertyLocation { get; set; } = null!;

    public virtual ICollection<PropertyPhoto> PropertyPhotos { get; set; } = new List<PropertyPhoto>();

    public virtual ICollection<PropertyVideo> PropertyVideos { get; set; } = new List<PropertyVideo>();
}
