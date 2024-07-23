using System;
using System.Collections.Generic;

namespace Persistence.Models;

public partial class Otp
{
    public Guid OtpId { get; set; }

    public string UserId { get; set; } = null!;

    public string Otp1 { get; set; } = null!;

    public DateTime Expiry { get; set; }

    public virtual AspNetUser User { get; set; } = null!;
}
