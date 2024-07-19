
using Application.Contracts;
using Application.Models.ApiResult;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Persistence.Configurations;

namespace Persistence.Repositories
{
    public class PropertyRepository : IPropertyRepository
    {
        private readonly PropertyDbContext _propertyDbContext;

        public PropertyRepository(PropertyDbContext propertyDbContext)
        {
            _propertyDbContext = propertyDbContext;
        }

        public async Task<Property> GetPropertyByIdAsync(Guid id)
        {
            var property = await _propertyDbContext.Properties
            .Include(p => p.PropertyAmenities)
            .Include(p => p.Lister)
            .FirstOrDefaultAsync(p => p.Id == id);

            if (property == null)
            {
                throw new KeyNotFoundException("Property not found.");
            }

            return property;
        }
    }
}