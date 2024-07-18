
using Domain.Entities;

namespace Application.Contracts
{
    public interface IPropertyRepository
    {
        Task<Property> GetPropertyByIdAsync(Guid id);
    }
}