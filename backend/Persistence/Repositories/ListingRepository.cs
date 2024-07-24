using Application.Contracts;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Persistence.Configurations;

namespace Persistence.Repositories
{
    public class ListingRepository : IListingRepository
    {
        private readonly PropertyDbContext _context;
        public ListingRepository(PropertyDbContext context)
        {
            _context = context;
        }
        
        public async Task SaveChangesAsync()
        {
            await _context.SaveChangesAsync(CancellationToken.None);
        }

        public async Task<TEntity?> AddPropertyAsync<TEntity>(TEntity property) where TEntity : class
        {
            var result = await _context.Set<TEntity>().AddAsync(property);
            if (result == null) return null;
            return property;
        }

        public async Task<PropertyLocation?> AddPropertyLocationAsync(PropertyLocation propertyLocation)
        {
            var result = await _context.PropertyLocations.AddAsync(propertyLocation);
            if (result == null) return null;
            return propertyLocation;
        }

        public async Task<PaymentInformation?> AddPaymentInformationAsync(PaymentInformation paymentInformation)
        {
            var result = await _context.PaymentInformations.AddAsync(paymentInformation);
            if (result == null) return null;
            return paymentInformation;
        }
    }
}