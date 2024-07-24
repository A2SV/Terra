using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class OfficeSpace
{
    public Guid Id { get; set; }

    public int OfficeSpaceType { get; set; }

    public bool MeetingRoomsAvailable { get; set; }

    public bool ReceptionAreaAvailable { get; set; }

    public DateTime CreatedAt { get; set; }

    public DateTime UpdatedAt { get; set; }
}
