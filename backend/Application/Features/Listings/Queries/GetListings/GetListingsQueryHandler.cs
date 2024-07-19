using Application.Contracts;
using Application.Features.Listings.Queries.GetAmenity;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Queries.GetListings;

public class GetListingsQueryHandler (IListingRepository listingRepository)
    : IRequestHandler<GetListingsQuery, Result<List<Property>>>
{
    public async Task<Result<List<Property>>> Handle(GetListingsQuery request, CancellationToken cancellationToken)
    {
        var queryResults = await listingRepository.GetAllListingsAsync(request.FilterOn, request.FilterQuery, 
            request.SortBy, request.IsAscending);

        return new Result<List<Property>>(true, ResultStatusCode.Success, queryResults, message: "Return all property listings successful");
    }
}