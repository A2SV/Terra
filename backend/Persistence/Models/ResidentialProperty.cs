using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class ResidentialProperty
{
    public Guid Id { get; set; }

    public Guid SubTypeId { get; set; }

    public bool FurnishedStatus { get; set; }

    public int NumberOfBedrooms { get; set; }

    public int NumberOfBathrooms { get; set; }

    public int NumberOfWashrooms { get; set; }

    public int NumberOfKitchens { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }
}
