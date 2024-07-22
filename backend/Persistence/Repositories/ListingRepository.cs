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

        public async Task<PaginatedList<Property>> GetAllListings(
            int pageIndex,
            int pageSize,
            string propertyType = null,
            int? minPrice = null,
            int? maxPrice = null,
            int? bedrooms = null,
            int? bathrooms = null,
            string? propertiesFacilities = null,
            string studentAccommodation = null
        )
        {

            IQueryable<Property> query = _context.Properties;

            if (!string.IsNullOrEmpty(propertyType))
                if (propertyType == "Residential")
                {
                    query = query.Where(p => (int)p.PropertyType % 2 == 0);
                }
                else
                {
                    query = query.Where(p => (int)p.PropertyType % 2 != 0);
                }


            if (minPrice.HasValue || maxPrice.HasValue)
            {
                query = query.Join(_context.PaymentInformations,
                    property => property.PaymentInformationId,
                    paymentInfo => paymentInfo.Id,
                    (property, paymentInfo) => new { Property = property, PaymentInfo = paymentInfo })
                    .Where(x => (!minPrice.HasValue || x.PaymentInfo.Cost >= minPrice.Value) &&
                                (!maxPrice.HasValue || x.PaymentInfo.Cost <= maxPrice.Value))
                    .Select(x => x.Property);


            }

            if (propertyType == "Residential" && (bedrooms.HasValue))
            {
                query = query.Join(_context.ResidentialProperties,
                    property => property.Id,
                    residentialProperty => residentialProperty.PropertyId,
                    (property, residentialProperty) => new { Property = property, ResidentialProperty = residentialProperty })
                    .Where(x => (x.ResidentialProperty.NumberOfBedrooms == bedrooms.Value))
                    .Select(x => x.Property);
            }

            if (propertyType == "Residential" && (bathrooms.HasValue))
            {
                query = query.Join(_context.ResidentialProperties,
                    property => property.Id,
                    residentialProperty => residentialProperty.PropertyId,
                    (property, residentialProperty) => new { Property = property, ResidentialProperty = residentialProperty })
                    .Where(x => (x.ResidentialProperty.NumberOfBathrooms == bathrooms.Value))
                    .Select(x => x.Property);
            }

            if (!string.IsNullOrEmpty(propertiesFacilities))
            {
                query = query.Join(_context.PropertyAmenities,
                    property => property.Id,
                    propertyAmenity => propertyAmenity.PropertyId,
                    (property, propertyAmenity) => new { Property = property, PropertyAmenity = propertyAmenity })
                    .Where(x => (x.PropertyAmenity.Amenity.Name == propertiesFacilities))
                    .Select(x => x.Property);
            }



            if (!string.IsNullOrEmpty(studentAccommodation))
            {
                if (Enum.TryParse<StudentHostelLocation>(studentAccommodation, out var parsedStudentAccommodation))
                {
                    query = query.Join(_context.StudentHostels,
                        property => property.Id,
                        hostel => hostel.PropertyId,
                        (property, hostel) => new { Property = property, Hostel = hostel })
                        .Where(x => x.Hostel.HostelLocation == parsedStudentAccommodation)
                        .Select(x => x.Property);
                }
            }



            var count = await query.CountAsync();


            var properties = await query
                .OrderBy(p => p.CreatedAt)
                .Skip((pageIndex - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            var totalPages = (int)Math.Ceiling(count / (double)pageSize);


            return new PaginatedList<Property>(properties, pageIndex, totalPages);
        }
    }
}