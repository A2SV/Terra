using System.Linq.Expressions;
using Application.Features.Listings.Dtos;
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
        Task<PaginatedList<PropertyDto>> GetAllListings(int pageIndex,int pageSize);
        Task<DetailedPropertyDto?> GetListingByIdAsync(Guid id);
        Task <Property?> GetPropertyByIdAsync(Guid propertyId);

        Task<PaginatedList<Property>> Filter(
            int pageIndex, int pageSize,
            string? listingType, string? propertyType,
            string? subType, int? minPrice,
            int? maxPrice, string? paymentFrequency,
            int? minPropertySize, int? maxPropertySize,
            List<string>? amenities);
    }
}