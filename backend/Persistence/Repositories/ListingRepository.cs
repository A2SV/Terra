using Application.Contracts;
using Domain.Entities;
using Domain.Enums;
using Domain.Models;
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

        public async Task<PaginatedList<Property>> GetAllListings(int pageIndex, int pageSize)
        {

            IQueryable<Property> query = _context.Properties;


            var count = await query.CountAsync();


            var properties = await query
                .OrderBy(p => p.CreatedAt)
                .Skip((pageIndex - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            var totalPages = (int)Math.Ceiling(count / (double)pageSize);


            return new PaginatedList<Property>(properties, pageIndex, totalPages);
        }


        public async Task<PaginatedList<Property>> Filter(
            int pageIndex, int pageSize,
            string? listingType, string? propertyType,
            string? subType, int? minPrice,
            int? maxPrice, string? paymentFrequency,
            int? minPropertySize, int? maxPropertySize,
            string? amenities
                )
        {

            IQueryable<Property> query = _context.Properties;


            if (!string.IsNullOrEmpty(listingType) && Enum.TryParse<PropertyListingType>(listingType, out var parsedListingType))
            {
                query = query.Where(x => x.ListingType == parsedListingType);
            }

            if (!string.IsNullOrEmpty(propertyType))
                if (propertyType == "Residential")
                {
                    query = query.Where(p => (int)p.PropertyType % 2 == 0);
                }
                else
                {
                    query = query.Where(p => (int)p.PropertyType % 2 != 0);
                }


            if (!string.IsNullOrEmpty(subType) && Enum.TryParse<PropertyType>(subType, out var parsedSubType))
            {
                query = query.Where(x => x.PropertyType == parsedSubType);

            }

            if (minPrice.HasValue || maxPrice.HasValue)
            {
                query = query.
                    Include(p => p.PaymentInformation)
                    .Where(x => (!minPrice.HasValue || x.PaymentInformation.Cost >= minPrice.Value) &&
                                (!maxPrice.HasValue || x.PaymentInformation.Cost <= maxPrice.Value));
            }



            if (!string.IsNullOrEmpty(subType) && Enum.TryParse<PaymentFrequency>(paymentFrequency, out var parsedPaymentFrequency))
            {
                query = query.
                        Include(p => p.PaymentInformation)
                        .Where(x => x.PaymentInformation.PaymentFrequency == parsedPaymentFrequency);


            }


            if (minPropertySize.HasValue || maxPropertySize.HasValue)
            {
                query = query
                    .Where(x => (!minPropertySize.HasValue || x.PropertySize >= minPropertySize.Value) &&
                                (!maxPrice.HasValue || x.PropertySize <= maxPrice.Value));
            }


            if (!string.IsNullOrEmpty(amenities))
            {
                query = query.Join(_context.PropertyAmenities,
                    property => property.Id,
                    propertyAmenity => propertyAmenity.PropertyId,
                    (property, propertyAmenity) => new { Property = property, PropertyAmenity = propertyAmenity })
                    .Where(x => (x.PropertyAmenity.Amenity.Name == amenities))
                    .Select(x => x.Property);
            }

            var count = await query.CountAsync();


            var properties = await query
                .OrderBy(p => p.CreatedAt)
                .Skip((pageIndex - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            var totalPages = (int)Math.Ceiling(count / (double)pageSize);


            return  new PaginatedList<Property>(properties, pageIndex, totalPages);
            }

    }
}

