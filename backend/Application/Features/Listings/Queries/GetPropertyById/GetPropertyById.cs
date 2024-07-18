using Application.Contracts;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Queries.GetPropertyById
{
    public class GetPropertyById: IRequest<Result<Property>>
    {
        public Guid Id {get; }

        public GetPropertyById(Guid id)
        {
            Id = id;
        }
    }
}