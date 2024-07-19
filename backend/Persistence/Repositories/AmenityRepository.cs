using Application.Contracts;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Persistence.Configurations;

namespace Persistence.Repositories;

public class AmenityRepository : IAmenityRepository
{
    private readonly PropertyDbContext _context;

    public AmenityRepository(PropertyDbContext context)
    {
        _context = context;
    }
    
    public async Task<PropertyAmenity?> AddAmenityAsync(PropertyAmenity amenity)
    {
        var result = await _context.PropertyAmenities.AddAsync(amenity);
        if (result == null) return null;
        return amenity;
    }

    public async Task<List<Amenity>> GetAllAmenitiesAsync(string? filterOn = null, string? filterQuery = null, string? sortBy = null,
        bool isAscending = true)
    {
        var amenities = _context.Amenities.AsQueryable();

        if (!string.IsNullOrWhiteSpace(filterOn) && !string.IsNullOrWhiteSpace(filterQuery))
        {
            if (filterOn.Equals("Name", StringComparison.OrdinalIgnoreCase))
                amenities = amenities.Where(x => x.Name.Contains(filterQuery));
        }

        if (!string.IsNullOrWhiteSpace(sortBy) && sortBy.Equals("Name", StringComparison.OrdinalIgnoreCase)) 
            amenities = isAscending ? amenities.OrderBy(x => x.Name) : amenities.OrderByDescending(x => x.Name);
        
        return await amenities.ToListAsync();
    }
}