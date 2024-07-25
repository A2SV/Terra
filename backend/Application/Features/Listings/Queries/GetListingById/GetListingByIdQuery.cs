using Application.Models.ApiResult;
using Application.Models.Dto.ListingDto.GetListingByIdDto;
using MediatR;

namespace Application.Features.Listings.Queries.GetListingById
{
    public class GetListingByIdQuery : IRequest<Result<GetListingByIdDto>>
    {
        public Guid Id { get; }

        public GetListingByIdQuery(Guid id)
        {
            Id = id;
        }
    }
}