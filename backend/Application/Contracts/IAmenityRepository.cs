using Domain.Entities;

namespace Application.Contracts;

public interface IAmenityRepository
{
    Task<PropertyAmenity?> AddAmenityAsync(PropertyAmenity amenity);
    Task<List<Amenity>> GetAllAmenitiesAsync(string? filterOn = null, string? filterQuery = null, string? sortBy = null, bool isAscending = true);
    Task<Amenity?> GetAmenityByIdAsync(string amenityId);
    
}