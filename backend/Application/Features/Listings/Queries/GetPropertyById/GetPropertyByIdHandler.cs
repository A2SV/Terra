
using Application.Contracts;
using Domain.Entities;
using MediatR;
using Application.Models.ApiResult;

namespace Application.Features.Listings.Queries.GetPropertyById
{
    public class GetPropertyByIdHandler : IRequestHandler<GetPropertyById, Result<Property>>
    {
        private readonly IPropertyRepository _propertyRepository;

        public GetPropertyByIdHandler(IPropertyRepository propertyRepository)
        {
            _propertyRepository = propertyRepository;
        }

        public async Task<Result<Property>> Handle(GetPropertyById request, CancellationToken cancellationToken)
        {
            var property = await _propertyRepository.GetPropertyByIdAsync(request.Id);

            if (property == null)
            {
                new Result<Property>(false, ResultStatusCode.NotFound, null, "Property not found.");
            }

            return new Result<Property>(true, ResultStatusCode.Success, property, "Property found.");
        }
    }
}