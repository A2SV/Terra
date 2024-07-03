using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Contracts
{
    public interface IOTPRepository
    {
        Task<OtpEntry> GetOtpEntryAsync(string userId);
        Task<OtpEntry> AddOtpEntryAsync(OtpEntry otpEntry);
        Task DeleteOtpEntryAsync(Guid otpId);
    }
}
