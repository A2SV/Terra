using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class PropertyAmenity
{
    public Guid Id { get; set; }

    public Guid PropertyId { get; set; }

    public Guid AmenityId { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }

    public virtual Amenity Amenity { get; set; } = null!;

    public virtual Property Property { get; set; } = null!;
}
