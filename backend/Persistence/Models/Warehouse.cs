using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class Warehouse
{
    public Guid Id { get; set; }

    public double CeilingHeight { get; set; }

    public bool LoadingDockAvailable { get; set; }

    public bool OfficeSpaceAvailable { get; set; }

    public List<int> SuitableGoods { get; set; } = null!;

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }
}
