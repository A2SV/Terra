using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class PropertyLocation
{
    public Guid Id { get; set; }

    public string StreetName { get; set; } = null!;

    public string HouseNumber { get; set; } = null!;

    public string City { get; set; } = null!;

    public string Country { get; set; } = null!;

    public string? ZipCode { get; set; }

    public double Longitude { get; set; }

    public double Latitude { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }

    public virtual ICollection<Property> Properties { get; set; } = new List<Property>();
}
