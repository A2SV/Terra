using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Queries.GetListingById
{
    public class GetListingByIdRequest: IRequest<Result<Property>>
    {
        public Guid Id {get; }

        public GetListingByIdRequest(Guid id)
        {
            Id = id;
        }
    }
}