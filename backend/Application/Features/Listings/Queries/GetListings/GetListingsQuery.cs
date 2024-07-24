using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Queries.GetListings;

public class GetListingsQuery (string? filterOn, string? filterQuery, bool isAscending, string? sortBy)
    : IRequest<Result<List<Property>>>
{
    public string? FilterOn { get; set; } = filterOn;
    public string? FilterQuery { get; set; } = filterQuery;
    public bool IsAscending { get; set; } = isAscending;
    public string? SortBy { get; set; } = sortBy;
}