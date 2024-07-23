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
    public class FilteringCommand : IRequest<PaginatedList<Property>>
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

        public string? amenities { get; set; }
    }
}
