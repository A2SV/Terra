using Application.Contracts;
using Domain.Entities;
using MediatR;
using Application.Models.ApiResult;
using Application.Models.Dto.ListingDto.GetListingByIdDto;

namespace Application.Features.Listings.Queries.GetListingById
{
    public class GetListingByIdHandler : IRequestHandler<GetListingByIdQuery, Result<GetListingByIdDto>>
    {
        private readonly IListingRepository _propertyRepository;

        public GetListingByIdHandler(IListingRepository propertyRepository)
        {
            _propertyRepository = propertyRepository;
        }

        public async Task<Result<GetListingByIdDto>> Handle(GetListingByIdQuery request, CancellationToken cancellationToken)
        {
            var propertyDto = await _propertyRepository.GetListingByIdAsync(request.Id);

            if (propertyDto == null)
            {
                return new Result<GetListingByIdDto>(false, ResultStatusCode.NotFound, null, "Property not found.");
            }

            return new Result<GetListingByIdDto>(true, ResultStatusCode.Success, propertyDto, "Property found.");
        }
    }
}