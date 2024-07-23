using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class Hotel
{
    public Guid Id { get; set; }

    public int StarRating { get; set; }

    public bool RestaurantOnSite { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }
}
