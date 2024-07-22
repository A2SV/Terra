using Application.Features.Listings.Commands.Common;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using Application.Models.ApiResult;

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


        [HttpPost]
        public async Task<IActionResult> PostListing([FromBody] InitiateCreateListingCommand command)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var result = await _mediator.Send(command);

            // Will change to createdAt action once 'get' feature is done
            return Ok(result);
        }

    }
}