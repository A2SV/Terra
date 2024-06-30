using Moq;
using Xunit;
using Domain.Interfaces;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;
using System.Threading;
using System.Threading.Tasks;
using Application.Contracts;
using Application.Features.Users.RegisterUser;
using Microsoft.AspNetCore.Identity;
using FluentAssertions;

public class RegisterUserCommandHandlerTests
{
    private readonly Mock<IUserRepository> _mockUserRepository;
    private readonly Mock<UserManager<User>> _mockUserManager;
    private readonly RegisterUserCommandHandler _handler;

    public RegisterUserCommandHandlerTests()
    {
        var userStoreMock = new Mock<IUserStore<User>>();
        _mockUserManager = new Mock<UserManager<User>>(
            userStoreMock.Object, null, null, null, null, null, null, null, null);

        _mockUserRepository = new Mock<IUserRepository>();
        _handler = new RegisterUserCommandHandler(_mockUserRepository.Object, _mockUserManager.Object);
    }

    [Fact]
    public async Task Handle_ExistingUser_ReturnsBadRequestResult()
    {
        var command = new RegisterUserCommand { Email = "test@example.com", Password = "Password123!" };
        _mockUserManager.Setup(x => x.FindByEmailAsync(It.IsAny<string>()))
            .ReturnsAsync(new User()
            {
                FirstName = "Michael",
                LastName = "Adu",
            });


        var result = await _handler.Handle(command, new CancellationToken());

     
        result.IsSuccess.Should().BeFalse();
        result.StatusCode.Should().Be(ResultStatusCode.BadRequest);
        result.Message.Should().Be("A user with this email already exists.");
    }

    [Fact]
    public async Task Handle_NewUser_ReturnsSuccessResult()
    {
        
        var command = new RegisterUserCommand { Email = "test@example.com", Password = "Password123!" };
        _mockUserManager.Setup(x => x.FindByEmailAsync(It.IsAny<string>()))
            .ReturnsAsync((User)null);
        _mockUserRepository.Setup(x => x.RegisterUserAsync(It.IsAny<User>(), It.IsAny<string>()))
            .ReturnsAsync(new Result(true, ResultStatusCode.Success, "User created successfully."));

        
        var result = await _handler.Handle(command, new CancellationToken());

        result.IsSuccess.Should().BeTrue();
        result.StatusCode.Should().Be(ResultStatusCode.Success);
        result.Message.Should().Be("User created successfully.");
    }
}
