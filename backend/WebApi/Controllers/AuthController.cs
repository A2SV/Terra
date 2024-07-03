using Application.Features.Users.Dtos;
using Application.Features.Users.ForgotPassword.Command;
using Application.Features.Users.LoginUser.Command;
using Application.Features.Users.RegisterUser;
using Application.Features.Users.ResetPassword;
using Application.Features.Users.VerifyOTP;
using Application.Models.ApiResult;
using MediatR;
using Microsoft.AspNetCore.Mvc;


namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IMediator mediator;

        public AuthController(IMediator mediator)
        {
            this.mediator = mediator;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginUserCommand command)
        {
            var result = await mediator.Send(command);

            if (result.IsSuccess)
            {
                return Ok(result);
            }

            return BadRequest(result);
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] RegisterUserCommand command)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var result = await mediator.Send(command);
            if (!result.IsSuccess)
            {
                return StatusCode((int)result.StatusCode, result);
            }


            return CreatedAtAction(nameof(VerifyOTP), new { result.Data.Id }, new
            {
                Message = "Registration successful. Please verify your OTP sent to your email.",
            });
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

                var result = await mediator.Send(command);

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

                var result = await mediator.Send(command);

                return result.IsSuccess ? Ok(result) : StatusCode((int)result.StatusCode, result);
            }
            catch (Exception ex)
            {
                var result = new Result(false, ResultStatusCode.BadRequest, "An error occured while sending forgot password email.");
                return StatusCode((int)result.StatusCode, result);
            }
        }

        [HttpPost("verifyOTP")]
        public async Task<IActionResult> VerifyOTP([FromBody] VerifyOTPCommand command)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var result = await mediator.Send(command);
            if (result.IsSuccess)
            {
                return Ok(result);
            }
            else
            {
                return StatusCode((int)result.StatusCode, result);
            }
        }



    }
}
