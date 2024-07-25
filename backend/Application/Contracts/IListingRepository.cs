using Domain.Entities;
using Domain.Models;
using Application.Models.Dto.ListingDto.GetListingByIdDto;

namespace Application.Contracts
{
    public interface IListingRepository
    {
        Task SaveChangesAsync();
        Task <TEntity?> AddPropertyAsync<TEntity>(TEntity property) where TEntity : class;
        Task<PropertyLocation?> AddPropertyLocationAsync(PropertyLocation propertyLocation);
        Task<PaymentInformation?> AddPaymentInformationAsync(PaymentInformation paymentInformation);
        Task<PaginatedList<Property>> GetAllListings(int pageIndex,int pageSize);

        Task<PaginatedList<Property>> Filter(
            int pageIndex, int pageSize,
            string? listingType, string? propertyType,
            string? subType, int? minPrice,
            int? maxPrice, string? paymentFrequency,
            int? minPropertySize, int? maxPropertySize,
            List<string>? amenities);

        Task<GetListingByIdDto> GetListingByIdAsync(Guid id);
    }
}