using System;
using Microsoft.AspNetCore.Identity;
using Moq;
using Domain.Entities;
using Application.Contracts;
using Application.Features.Users.ForgotPassword.Command;
using Application.Models.ApiResult;


namespace Application.Tests.Features.Users.RegisterUser
{
    public class ForgotPasswordCommandHandlerTest
    {
        private readonly Mock<UserManager<User>> _userManagerMock;
        private readonly Mock<IEmailService> _emailServiceMock;
        private readonly ForgotPasswordHandler _handler;

        public ForgotPasswordCommandHandlerTest()
        {
            _userManagerMock = new Mock<UserManager<User>>(Mock.Of<IUserStore<User>>(), null, null, null, null, null, null, null, null);
            _emailServiceMock = new Mock<IEmailService>();
            _handler = new ForgotPasswordHandler(_userManagerMock.Object, _emailServiceMock.Object);
        }

        [Fact]
        public async Task Handle_UserNotFound_ReturnsNotFound()
        {
            // Arrange
             _userManagerMock.Setup(x => x.FindByEmailAsync(It.IsAny<string>())).ReturnsAsync((User)null);

             // Act
             var result = await _handler.Handle(new ForgotPasswordCommand("none@example.com"), CancellationToken.None);

             // Assert
             Assert.False(result.IsSuccess);
             Assert.Equal(ResultStatusCode.NotFound, result.StatusCode);
        }

        [Fact]
        public async Task Handle_UserFound_SendEmail()
        {

            // Arrange
            var user = new User { FirstName = "Eben", LastName = "Success", Email = "aebenezer237@gmail.com"};
            _userManagerMock.Setup(x => x.FindByEmailAsync(It.IsAny<string>())).ReturnsAsync(user);
            _userManagerMock.Setup(x => x.GeneratePasswordResetTokenAsync(user)).ReturnsAsync("token");
            _userManagerMock.Setup(x => x.GetEmailAsync(user)).ReturnsAsync(user.Email);

            // Act
            var result = await _handler.Handle(new ForgotPasswordCommand(user.Email), CancellationToken.None);

            // Assert 
            Assert.True(result.IsSuccess);
            _emailServiceMock.Verify(x => x.SendEmailAsync(It.IsAny<string>(), It.IsAny<string>(), It.IsAny<string>()), Times.Once);
        }

        

    }
}