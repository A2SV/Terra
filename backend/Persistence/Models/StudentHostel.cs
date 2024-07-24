using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class StudentHostel
{
    public Guid Id { get; set; }

    public List<int> RoomTypes { get; set; } = null!;

    public int HostelType { get; set; }

    public int HostelLocation { get; set; }

    public bool SharedFacilities { get; set; }

    public bool MealPlanAvailable { get; set; }

    public bool StudyAreaAvailable { get; set; }

    public bool LaundryFacilityAvailable { get; set; }

    public bool CleaningServiceAvailable { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }
}
