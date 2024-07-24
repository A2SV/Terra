using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class Shop
{
    public Guid Id { get; set; }

    public bool DisplayWindowAvailable { get; set; }

    public double StorageRoomSize { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }
}
