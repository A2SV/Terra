using Application.Models.ApiResult;

using Application.Models.Dto.ListingDto.GetListingDto;
using MediatR;

namespace Application.Features.Listings.Queries.GetListingById
{
    
    public class GetListingByIdQuery : IRequest<Result<GetListingDto>>
    {
        public Guid Id { get; }

        public GetListingByIdQuery(Guid id)
        {
            Id = id;
        }
    }
}