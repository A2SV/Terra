using Application.Contracts;
using Application.Features.Listings.Dtos;
using Domain.Entities;
using Domain.Models;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Listings.Queries.GetAllListings
{
    public class GetAllListingQueryHandler : IRequestHandler<GetAllListingQuery, PaginatedList<PropertyDto>>
    {
        private readonly IListingRepository _listingRepository;

        public GetAllListingQueryHandler(IListingRepository listingRepository)
        {
            _listingRepository = listingRepository;
        }

        public async Task<PaginatedList<PropertyDto>> Handle(GetAllListingQuery request, CancellationToken cancellationToken)
        {
            return await _listingRepository.GetAllListings(request.pageIndex, request.pageSize);
        }
        
        

    }
}
