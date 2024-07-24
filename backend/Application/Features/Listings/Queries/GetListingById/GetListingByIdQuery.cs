using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Queries.GetListingById
{
    public class GetListingByIdQuery : IRequest<Result<Property>>
    {
        public Guid Id { get; }

        public GetListingByIdQuery(Guid id)
        {
            Id = id;
        }
    }
}