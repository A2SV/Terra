using Application.Contracts;
using Domain.Entities;
using Persistence.Configurations;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Persistence.Repositories
{
    public class OTPRepository:IOTPRepository
    {
        private readonly AppAuthDbContext _context;

        public OTPRepository(AppAuthDbContext context)
        {
            _context = context;
        }

        public async Task<OtpEntry> AddOtpEntryAsync(OtpEntry otpEntry)
        {
            
            var result = await _context.Otps.AddAsync(otpEntry);
            await _context.SaveChangesAsync(CancellationToken.None);
            return result.Entity;
        }

        public async Task<OtpEntry> GetOtpEntryAsync(string userId)
        {
            return await _context.Otps
                                 .FirstOrDefaultAsync(o => o.UserId == userId && o.Expiry > DateTime.UtcNow);
        }

        public async Task DeleteOtpEntryAsync(Guid otpId)
        {
            var otpEntry = await _context.Otps.FindAsync(otpId);
            if (otpEntry != null)
            {
                _context.Otps.Remove(otpEntry);
                await _context.SaveChangesAsync(CancellationToken.None);
            }
        }

    }
}
