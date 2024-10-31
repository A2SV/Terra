using Application.Contracts;
using Application.Features.Listings.Dtos;
using Application.Models.ApiResult;
using MediatR;

namespace Application.Features.Listings.Queries.GetListingById
{
    public class GetListingByIdQueryHandler : IRequestHandler<GetListingByIdQuery, DetailedPropertyDto>
    {
        private readonly IListingRepository _listingRepository;

        public GetListingByIdQueryHandler(IListingRepository listingRepository)
        {
            _listingRepository = listingRepository;
        }

        public async Task<DetailedPropertyDto> Handle(GetListingByIdQuery request, CancellationToken cancellationToken)
        {
            var property = await _listingRepository.GetListingByIdAsync(request.Id);
            if (property == null) return null;

            return property;
        }
    }
}