using Application.Features.Accounts.Dtos;
using Application.Features.Accounts.ForgotPassword.Command;
using Application.Features.Accounts.LoginUser.Command;
using Application.Features.Accounts.RegisterUser;
using Application.Features.Accounts.ResendOTP;
using Application.Features.Accounts.ResetPassword;
using Application.Features.Accounts.VerifyOTP;
using Application.Models.ApiResult;
using MediatR;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Google;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using Domain.Entities;
using Application.Contracts;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;


namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IMediator mediator;
        private readonly UserManager<User> userManager;
        private readonly ITokenRepository tokenRepository;

        public AuthController(IMediator mediator, UserManager<User> userManager, ITokenRepository tokenRepository)
        {
            this.mediator = mediator;
            this.userManager = userManager;
            this.tokenRepository = tokenRepository;
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
            catch (Exception)
            {
                var result = new Result(false, ResultStatusCode.BadRequest, "An error occured while sending forgot password email.");
                return StatusCode((int)result.StatusCode, result);
            }
        }
        
        [HttpPost("VerifyOTP")]
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

        [HttpPost("ResendOTP")]
        public async Task<IActionResult> ResendOTP([FromBody] ResendOTPCommand command)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

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

        [HttpGet("google-login")]
        [AllowAnonymous]
        public IActionResult GoogleLogin()
        {
            // var properties = new AuthenticationProperties { RedirectUri = "http://localhost:5183/api/Auth/google-response" };
            var properties = new AuthenticationProperties
            {
                RedirectUri = Url.Action("GoogleResponse", "Auth", null, Request.Scheme),
                Items =
                {
                    {"scheme", GoogleDefaults.AuthenticationScheme}
                }
            };
            Console.WriteLine($"RedirectUri: {properties.RedirectUri}");
            return Challenge(properties, GoogleDefaults.AuthenticationScheme);
        }

        [HttpGet("google-response")]
        public async Task<IActionResult> GoogleResponse()
        {
            var authenticateResult = await HttpContext.AuthenticateAsync(GoogleDefaults.AuthenticationScheme);
            if (!authenticateResult.Succeeded)
            {
                return BadRequest("Google authentication failed");
            }

            var claims = authenticateResult.Principal?.Identities.FirstOrDefault()?.Claims;
            var emailClaim = claims?.FirstOrDefault(c => c.Type == ClaimTypes.Email)?.Value;
            // var email = emailClaim?.Value;

            if (String.IsNullOrEmpty(emailClaim))
            {
                return BadRequest("There is no user with this email");
            }

            var user = await userManager.FindByEmailAsync(emailClaim);

            if (user == null)
            {
                user = new User
                {
                    Id = user.Id,
                    Email = emailClaim,
                    UserName = emailClaim,
                    FirstName = claims.FirstOrDefault(c => c.Type == ClaimTypes.GivenName)?.Value,
                    LastName = claims.FirstOrDefault(c => c.Type == ClaimTypes.Surname)?.Value,
                    EmailConfirmed = true
                };

                var result = await userManager.CreateAsync(user);
                if (!result.Succeeded)
                {
                    return BadRequest("User creation failed");
                }
            }

            var userRoles = await userManager.GetRolesAsync(user);
            var jwtToken = tokenRepository.GenerateJwtToken(user, userRoles.ToArray());

            return Ok(new { Token = jwtToken });
        }
    }
}
