using Application.Contracts;
using Domain.Entities;
using MediatR;
using Application.Models.ApiResult;


namespace Application.Features.Listings.Queries.GetListingById
{
    public class GetListingByIdHandler : IRequestHandler<GetListingByIdQuery, Result<Property>>
    {
        private readonly IListingRepository _propertyRepository;

        public GetListingByIdHandler(IListingRepository propertyRepository)
        {
            _propertyRepository = propertyRepository;
        }

        public async Task<Result<Property>> Handle(GetListingByIdQuery request, CancellationToken cancellationToken)
        {
            var property = await _propertyRepository.GetListingByIdAsync(request.Id);

            if (property == null)
            {
                return new Result<Property>(false, ResultStatusCode.NotFound, null, "Property not found.");
            }

            return new Result<Property>(true, ResultStatusCode.Success, property, "Property found.");
        }
    }
}