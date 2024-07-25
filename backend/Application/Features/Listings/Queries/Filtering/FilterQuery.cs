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
    public class FilterQuery : IRequest<PaginatedList<Property>>
    {
        public int pageIndex { get; set; }
        public int pageSize { get; set; }

        public string? listingType { get; set; }

        public string? propertyType { get; set; }

        public string? subType { get; set; }

        public int? minPrice { get; set; } = 0;

        public int? maxPrice { get; set; } = int.MaxValue;

        public string? priceFrequency { get; set; }

        public int? minPropertySize {get; set; }

        public int? maxPropertySize { get; set;}

        public List<string>? amenities { get; set; }


        public FilterQuery(
            int PageIndex, int PageSize, string? ListingType,
            string? PropertyType, string? SubType , int? MinPrice, 
            int? MaxPrice, string? PriceFrequency, int? MinPropertySize, 
            int? MaxPropertySize, List<string>? Amenities

            )
        {
            pageIndex = PageIndex;
            pageSize = PageSize;
            listingType = ListingType;
            propertyType = PropertyType;
            subType = SubType;
            minPrice = MinPrice;
            maxPrice = MaxPrice;
            priceFrequency = PriceFrequency;
            minPropertySize = MinPropertySize;
            maxPropertySize = MaxPropertySize;
            amenities = Amenities;

            
        }
    }
}
