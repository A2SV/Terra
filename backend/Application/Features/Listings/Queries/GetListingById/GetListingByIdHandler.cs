using Application.Contracts;
using Domain.Entities;
using MediatR;
using Application.Models.ApiResult;
using Application.Models.Dto.ListingDto.GetListingDto;

namespace Application.Features.Listings.Queries.GetListingById
{
    public class GetListingByIdHandler : IRequestHandler<GetListingByIdQuery, Result<GetListingDto>>
    {
        private readonly IListingRepository _propertyRepository;

        public GetListingByIdHandler(IListingRepository propertyRepository)
        {
            _propertyRepository = propertyRepository;
        }

        public async Task<Result<GetListingDto>> Handle(GetListingByIdQuery request, CancellationToken cancellationToken)
        {
            var propertyDto = await _propertyRepository.GetListingByIdAsync(request.Id);

            if (propertyDto == null)
            {
                return new Result<GetListingDto>(false, ResultStatusCode.NotFound, null, "Property not found.");
            }

            return new Result<GetListingDto>(true, ResultStatusCode.Success, propertyDto, "Property found.");
        }
    }
}