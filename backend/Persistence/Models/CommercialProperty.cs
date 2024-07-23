using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class CommercialProperty
{
    public Guid Id { get; set; }

    public Guid SubTypeId { get; set; }

    public int TotalFloors { get; set; }

    public bool ParkingSpace { get; set; }

    public int FloorNumber { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }
}
