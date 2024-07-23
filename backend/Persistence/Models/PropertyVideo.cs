using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class PropertyVideo
{
    public Guid Id { get; set; }

    public Guid PropertyId { get; set; }

    public string Url { get; set; } = null!;

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }

    public virtual Property Property { get; set; } = null!;
}
