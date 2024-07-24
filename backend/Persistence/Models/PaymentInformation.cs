using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class PaymentInformation
{
    public Guid Id { get; set; }

    public int Currency { get; set; }

    public int PaymentFrequency { get; set; }

    public double Cost { get; set; }

    public bool Negotiable { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }

    public virtual ICollection<Property> Properties { get; set; } = new List<Property>();
}
