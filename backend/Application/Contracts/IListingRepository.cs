using Domain.Entities;
using Domain.Models;

namespace Application.Contracts
{
    public interface IListingRepository
    {
        Task SaveChangesAsync();
        Task <TEntity?> AddPropertyAsync<TEntity>(TEntity property) where TEntity : class;
        Task<PropertyLocation?> AddPropertyLocationAsync(PropertyLocation propertyLocation);
        Task<PaymentInformation?> AddPaymentInformationAsync(PaymentInformation paymentInformation);
        Task<PaginatedList<Property>> GetAllListings(int pageIndex,
            int pageSize,
            string propertyType = null,
            int? minPrice = null,
            int? maxPrice = null,
            int? bedrooms = null,
            int? bathrooms = null,
            string? propertiesFacilities = null,
            string studentAccommodation = null);
    }
}