using Application.Features.Users.ForgotPassword.Command;
using Domain.Entities;
using Domain.Interfaces;
using MediatR;
using Microsoft.AspNetCore.Identity;
using Moq;



namespace Application.Tests.Features;

public class ForgotPasswordHandlerTest
{
    private readonly Mock<UserManager<User>> _userManagerMock;
    private readonly Mock<IEmailService> _emailServiceMock;
    private readonly ForgotPasswordHandler _handler;

    public ForgotPasswordHandlerTest()
    {
        var store = new Mock<IUserStore<User>>();
        _userManagerMock = new Mock<UserManager<User>>(store.Object, null, null, null, null, null, null, null, null);
        _emailServiceMock = new Mock<IEmailService>();
        _handler = new ForgotPasswordHandler(_userManagerMock.Object, _emailServiceMock.Object);
    }

    [Fact]
    public async Task Handle_ReturnsSuccess_WhenUserExistsAndEmailConfirmed()
    {
        var user = new User
        {
            Email = "test@gmail.com",
            EmailConfirmed = true,
            FirstName = "",
            LastName = ""


        };
    }
}