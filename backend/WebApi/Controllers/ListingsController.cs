using Application.Features.Listings.Queries.GetAllListings;
using Domain.Entities;
using Domain.Models;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ListingsController : ControllerBase
    {
        private readonly IMediator _mediator;
        public ListingsController(IMediator mediator)
        {
            _mediator = mediator;
        }

        [HttpGet("GetAllListing")]
        public async Task<ActionResult<PaginatedList<Property>>> GetAllListing([FromQuery] int pageIndex=1,
            [FromQuery] int pageSize=5,
            [FromQuery] string? propertyType = null,
            [FromQuery] int? minPrice = null,
            [FromQuery] int? maxPrice = null,
            [FromQuery] int? bedrooms = null,
            [FromQuery] int? bathrooms = null,
            [FromQuery] string? propertiesFacilities = null,
            [FromQuery] string? studentAccommodation = null)
        {

            var command = new GetAllListingQuery(pageIndex, pageSize, propertyType, minPrice, maxPrice,
                                                bedrooms, bathrooms, propertiesFacilities, studentAccommodation);
            var listings = await _mediator.Send(command);

            return Ok(listings);
        }
    }
}
