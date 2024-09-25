using Application.Features.Listings.Dtos;
using Application.Models.ApiResult;

using MediatR;

namespace Application.Features.Listings.Queries.GetListingById
{
    
    public class GetListingByIdQuery : IRequest<DetailedPropertyDto>
    {
        public Guid Id { get; set; }
    }
}