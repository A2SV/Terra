using Application.Contracts;
using Application.Features.Listings.Queries.GetAllListings;
using Domain.Entities;
using Domain.Models;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.Features.Listings.Queries.Filtering
{
    public class FilterQueryHandler : IRequestHandler< FilterQuery, PaginatedList<Property>>
    {
        private readonly IListingRepository _listingRepository;

        public FilterQueryHandler(IListingRepository listingRepository)
        {
            _listingRepository = listingRepository;
        }

        public async Task<PaginatedList<Property>> Handle(FilterQuery request, CancellationToken cancellationToken)
        {
            return await _listingRepository.Filter(request.pageIndex, request.pageSize,
                                                   request.listingType, request.propertyType,
                                                   request.subType,request.minPrice,
                                                   request.maxPrice, request.priceFrequency, 
                                                   request.minPropertySize, request.maxPropertySize,
                                                   request.amenities);
        }
    }
}
