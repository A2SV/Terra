using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class Apartment
{
    public Guid Id { get; set; }

    public int NumberOfFloorsInBuilding { get; set; }

    public int FloorNumberOfUnit { get; set; }

    public bool LaundryFacilityAvailable { get; set; }

    public bool CleaningServiceAvailable { get; set; }

    public bool StudentFriendly { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }
}
