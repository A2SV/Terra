using Application.Contracts;
using Application.Features.Listings.Queries.GetAmenity;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AmenityController : ControllerBase
    {
        private readonly IMediator _mediator;

        public AmenityController(IMediator mediator)
        {
            _mediator = mediator;
        }


        //[Authorize]

        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] string? filterOn, [FromQuery] string? filterQuery,
                [FromQuery] string? sortBy, [FromQuery] bool? isAscending)
        {
            var command = new GetAmenityQuery(filterOn, filterQuery, isAscending ?? true, sortBy);
            var amenities = await _mediator.Send(command);

            return Ok(amenities);
        }
    }
}
