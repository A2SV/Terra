using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class House
{
    public Guid Id { get; set; }

    public int NumberOfStories { get; set; }

    public double GarageSpace { get; set; }

    public bool StudentFriendly { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }
}
