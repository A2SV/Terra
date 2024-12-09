using Application.Features.Listings.Commands.Common;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Application.Models.ApiResult;
using Application.Features.Listings.Queries.GetAllListings;
using Domain.Models;
using Domain.Entities;
using Domain.Enums;
using Application.Features.Listings.Queries.Filtering;
using Microsoft.AspNetCore.Authorization;
using Application.Features.Listings.Dtos;
using Application.Features.Listings.Queries.GetListingById;
using Application.Features.Listings.Commands.UpdatePropertyMarketStatus;
using Application.Features.Listings.Commands.UpdateListing;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ListingController : ControllerBase
    {
        private readonly IMediator _mediator;

        public ListingController(IMediator mediator)
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
        public async Task<ActionResult<PaginatedList<PropertyDto>>> GetAllListing([FromQuery] int pageIndex = 1, [FromQuery] int pageSize = 5)
        {

            var command = new GetAllListingQuery(pageIndex, pageSize);
            var listings = await _mediator.Send(command);

            return Ok(listings);
        }

        [HttpGet("id")]
        public async Task<ActionResult<DetailedPropertyDto>> GetListingById([FromQuery] GetListingByIdQuery query)
        {
            var listing = await _mediator.Send(query);
            
            return Ok(listing);
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
        
        [HttpPatch("{id}/status")]
        public async Task<IActionResult> SetMarketStatus(Guid id, [FromQuery] PropertyMarketStatus newStatus)
        {
            var command = new UpdatePropertyMarketStatusCommand
            {
                PropertyId = id,
                NewStatus = newStatus
            };

            await _mediator.Send(command);

            return Ok(new { Message = $"Property status updated to {newStatus}." });
        }

        [HttpPut("{id}")]
public async Task<IActionResult> UpdateListing(Guid id, [FromBody] UpdateListingCommand command)
{
    if (!ModelState.IsValid)
        return BadRequest(ModelState);
        
    command.PropertyId = id;
    var result = await _mediator.Send(command);
    
    return result.IsSuccess ? Ok(result) : StatusCode((int)result.StatusCode, result);
}
    }
}




