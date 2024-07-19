using Application.Contracts;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Queries.GetAmenity;

public class GetAmenityQueryHandler(IAmenityRepository amenityRepository)
    : IRequestHandler<GetAmenityQuery, Result<List<Amenity>>>
{
    public async Task<Result<List<Amenity>>> Handle(GetAmenityQuery request, CancellationToken cancellationToken)
    {
        var queryResults = await amenityRepository.GetAllAmenitiesAsync(request.FilterOn, request.FilterQuery, 
            request.SortBy, request.IsAscending);

        return new Result<List<Amenity>>(true, ResultStatusCode.Success, queryResults, message: "Return all amenities successful");
    }
}