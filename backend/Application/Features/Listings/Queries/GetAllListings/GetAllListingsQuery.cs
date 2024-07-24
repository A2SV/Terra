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
    public class GetAllListingQuery : IRequest<PaginatedList<Property>>
    {
        public int pageIndex { get; set; }
        public int pageSize { get; set; }

        public string? propertyType { get; set; }

        public int? minPrice { get; set; } = 0;

        public int? maxPrice { get; set; }
        public int? bedrooms { get; set; }
        public int? bathrooms { get; set; }
        public string? propertiesFacilities { get; set; }
        public string studentAccommodation { get; set; }

        public GetAllListingQuery(
            int PageIndex, int PageSize,
            string? PropertyType, int? MinPrice,
            int? MaxPrice, int? Bedrooms,
            int? Bathrooms, string? PropertiesFacilities,
            string? StudentAccommodation
            )
        {
            pageIndex = PageIndex;
            pageSize = PageSize;
            propertyType = PropertyType;
            minPrice = MinPrice;
            maxPrice = MaxPrice;
            bedrooms = Bedrooms;
            bathrooms = Bathrooms;
            propertiesFacilities = PropertiesFacilities;
            studentAccommodation = StudentAccommodation;

        }
    }
}
