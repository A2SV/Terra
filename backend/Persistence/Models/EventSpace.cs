using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class EventSpace
{
    public Guid Id { get; set; }

    public int MaximumCapacity { get; set; }

    public bool CateringServiceAvailable { get; set; }

    public bool AudioVisualEquipmentsAvailable { get; set; }

    public List<int> SuitableEvents { get; set; } = null!;

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }
}
