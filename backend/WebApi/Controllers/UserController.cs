using Application.Features.Users.Dtos;
using Application.Features.Users.ForgotPassword.Command;
using Application.Features.Users.ResetPassword;
using Application.Models;
using Application.Models.ApiResult;
using MediatR;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers;

[ApiController]
[Route("api/v1/[controller]")]

public class UserController : ControllerBase
{
    private readonly IMediator _mediator;

    public UserController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpPost("reset-password")]
    public async Task<IActionResult> ResetPassword([FromBody] ResetPasswordDto resetPasswordDto)
    {
        try
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var command = new ResetPasswordCommand(
                resetPasswordDto.Email,
                resetPasswordDto.Token,
                resetPasswordDto.NewPassword,
                resetPasswordDto.ConfirmPassword
            );

            var result = await _mediator.Send(command);
            
            return result.IsSuccess ? Ok(result) : StatusCode((int)result.StatusCode, result);
            
        }
        catch (Exception ex)
        {
            var result = new Result(false, ResultStatusCode.ServerError, "An error occured while reseting password");
            return StatusCode((int)result.StatusCode, result);
        }
        
    }

    [HttpPost("forgot-password")]
    public async Task<IActionResult> ForgotPassword([FromBody] ForgotPasswordDto forgotPasswordDto)
    {
        try
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var command = new ForgotPasswordCommand(forgotPasswordDto.Email);

            var result = await _mediator.Send(command);

            return result.IsSuccess ? Ok(result) : StatusCode((int)result.StatusCode, result);
        }
        catch (Exception ex)
        {
            var result = new Result(false, ResultStatusCode.BadRequest, "An error occured while sending forgot password email.");
            return StatusCode((int)result.StatusCode, result);
        }
    }
}