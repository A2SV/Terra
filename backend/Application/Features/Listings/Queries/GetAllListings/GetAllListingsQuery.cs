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
    public class GetAllListingQuery : IRequest<PaginatedList<PropertyDto>>
    {
        public int pageIndex { get; set; }
        public int pageSize { get; set; }


        public GetAllListingQuery(int PageIndex, int PageSize )
        {
            pageIndex = PageIndex;
            pageSize = PageSize;

        }
    }
}
