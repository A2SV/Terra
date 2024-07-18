
using Application.Contracts;
using Domain.Entities;
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
            return await _propertyDbContext.Properties.FindAsync(id);
        }
    }
}