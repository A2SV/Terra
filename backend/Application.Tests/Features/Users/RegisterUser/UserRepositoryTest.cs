using Moq;
using Xunit;
using Microsoft.AspNetCore.Identity;
using Domain.Entities;
using Persistence.Repositories;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using Application.Models.ApiResult;
using Shouldly;
using FluentAssertions;
using FluentValidation;


public class UserRepositoryTests
{
    private readonly Mock<UserManager<User>> _mockUserManager;
    private readonly UserRepository _userRepository;

    public UserRepositoryTests()
    {
        var userStoreMock = new Mock<IUserStore<User>>();
        _mockUserManager = new Mock<UserManager<User>>(
            userStoreMock.Object, null, null, null, null, null, null, null, null);

        _userRepository = new UserRepository(_mockUserManager.Object);
    }

    [Fact]
    public async Task AddUserAsync_UserCreationSucceeds_ReturnsSuccessResult()
    {
       
        var user = new User { FirstName = "Michael", LastName="Adu", Email = "test@example.com", UserName = "test@example.com" };
        var password = "Password123!";
        _mockUserManager.Setup(x => x.CreateAsync(It.IsAny<User>(), It.IsAny<string>()))
            .ReturnsAsync(IdentityResult.Success);

        var result = await _userRepository.RegisterUserAsync(user, password);


        result.IsSuccess.Should().BeTrue();
        result.Message.Should().Be("User created successfully.");
    }

    [Fact]
    public async Task AddUserAsync_UserCreationFails_ReturnsFailureResult()
    {
        
        var user = new User { FirstName = "Michael", LastName = "Adu", Email = "test@example.com", UserName = "test@example.com" };
        var password = "Password123!";
        _mockUserManager.Setup(x => x.CreateAsync(It.IsAny<User>(), It.IsAny<string>()))
            .ReturnsAsync(IdentityResult.Failed(new IdentityError { Description = "Creation failed" }));

        
        var result = await _userRepository.RegisterUserAsync(user, password);

        
        result.IsSuccess.Should().BeFalse();
        result.Message.Should().Contain("User creation failed");
    }
}
