using Application.Features.Listings.Commands.Common;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Application.Models.ApiResult;
using Application.Features.Listings.Queries.GetAllListings;
using Domain.Models;
using Domain.Entities;
using Application.Features.Listings.Queries.Filtering;
using Microsoft.AspNetCore.Authorization;

using Application.Features.Listings.Queries.GetPropertyById;

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


        //[Authorize]
        [HttpPost]
        public async Task<IActionResult> PostListing([FromBody] InitiateCreateListingCommand command)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var result = await _mediator.Send(command);

            // Will change to createdAt action once 'get' feature is done
            return Ok(result);
        }


        //[Authorize]
        [HttpGet]
        public async Task<ActionResult<PaginatedList<Property>>> GetAllListing([FromQuery] int pageIndex = 1, [FromQuery] int pageSize = 5)
        {

            var command = new GetAllListingQuery(pageIndex, pageSize);
            var listings = await _mediator.Send(command);

            return Ok(listings);
        }

        //[Authorize]
        [HttpGet("Filter")]

        public async Task<ActionResult<PaginatedList<Property>>> Filter(
            int pageIndex = 1,
            int pageSize = 5,
            string? listingType = null,
            string? propertyType = null,
            string? subType = null,
            int? minPrice = null,
            int? maxPrice = null,
            string? priceFrequency = null,
            int? minPropertySize = null,
            int? maxPropertySize = null,
            [FromQuery] List<string>? amenities = null                                     
            )
        {
            var command = new FilterQuery(pageIndex, pageSize,listingType,propertyType,
                subType,minPrice,maxPrice,priceFrequency,minPropertySize,maxPropertySize, amenities);

            var listings = await _mediator.Send(command);

            return Ok(listings);
        }
        [HttpGet("{id:Guid}")]
        public async Task<IActionResult> GetPropertyById([FromRoute] Guid id)
        {
            try
            {
                var result = await _mediator.Send(new GetPropertyById(id));

                return result.IsSuccess ? Ok(result) : StatusCode((int)result.StatusCode, result);
                
            }
            catch(Exception ex)
            {
                return BadRequest(new Result<Property>(false, ResultStatusCode.BadRequest, null, ex.Message));
            }
            }
    }
}