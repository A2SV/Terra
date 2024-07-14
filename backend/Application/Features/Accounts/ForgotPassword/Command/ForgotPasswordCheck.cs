// using MediatR;
// using Domain.Interfaces;
// using System.Threading.Tasks;
// using System.Threading;
// using Application.Response;
// using Application.Features.UsersCommands.Commands;


// namespace Application.Features.UsersCommands.Handlers
// {
//     public class ForgotPasswordCommandHandler : IRequestHandler<ForgotPasswordCommand, Result>
//     {
//         private readonly IUserRepository _userRepository;
//         private readonly IEmailService _emailService;
//         private readonly ITokenService _tokenService;

//         public ForgotPasswordCommandHandler(IUserRepository userRepository, IEmailService emailService, ITokenService tokenService)
//         {
//             _userRepository = userRepository;
//             _emailService = emailService;
//             _tokenService = tokenService;
//         }

//         public async Task<Result> Handle(ForgotPasswordCommand request, CancellationToken cancellationToken)
//         {
//             var user = await _userRepository.GetUserByEmailAsync(request.Email);
//             if (user == null)
//             {
//                 return Result.Failure("No user found with that email address.");
//             }

//             var token = _tokenService.GeneratePasswordResetToken(user.Email);
//             Console.WriteLine(token);
//             var resetLink = $"https://yourdomain.com/reset-password?token={token}&email={user.Email}";

//             await _emailService.SendEmailAsync(user.Email, "Reset Your Password", $"Please reset your password by clicking here: {resetLink}");

//             return Result.Success("Password reset email sent.");
//         }
//     }
// }