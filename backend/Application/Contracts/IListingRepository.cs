using Domain.Entities;

namespace Application.Contracts
{
    public interface IListingRepository
    {
        Task SaveChangesAsync();
        Task <TEntity?> AddPropertyAsync<TEntity>(TEntity property) where TEntity : class;
        Task<PropertyLocation?> AddPropertyLocationAsync(PropertyLocation propertyLocation);
        Task<PaymentInformation?> AddPaymentInformationAsync(PaymentInformation paymentInformation);

        Task<List<Property>> GetAllListingsAsync(string? filterOn, string? filterQuery, string? sortBy,
            bool isAscending, int pageNumber = 1, int pageSize = 50);
    }
}