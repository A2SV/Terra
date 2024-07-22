using Moq;
using Domain.Entities;
using Domain.Enums;
using Application.Contracts;
using Application.Features.Listings.Queries.GetListingById;
using Application.Features.Listings.Queries.GetListingId;
using Application.Models.ApiResult;



namespace Application.Tests.Features.Listing
{
    public class GetListingByIdTest
    {
        private readonly Mock<IListingRepository> _mockReposity;
        private readonly GetListingByIdHandler _handler;

        public GetListingByIdTest()
        {
            _mockReposity = new Mock<IListingRepository>();
            _handler = new GetListingByIdHandler(_mockReposity.Object);
        }

        [Fact]
        public async Task Handle_ReturnsProperty_WhenPropertyExist()
        {
            // Arrange
            var propertyId = Guid.NewGuid();
            var property = new Property
            {
                Id = propertyId,
                Title = "Property Title",
                PropertyType = PropertyType.StudentHostel,
                ListingType = PropertyListingType.ForRent
            };

            _mockReposity.Setup(repo => repo.GetListingByIdAsync(propertyId)).ReturnsAsync(property);

            var request = new GetListingByIdRequest(propertyId);

            // Act
            var result = await _handler.Handle(request, CancellationToken.None);

            // Assert
            Assert.True(result.IsSuccess);
            Assert.Equal(property, result.Data);
            Assert.Equal("Property found.", result.Message);

        }


        [Fact]
        public async Task Handle_ReturnsNotFound_WhenPropertyDoesNotExist()
        {
            // Arrange
            var propertyId = Guid.NewGuid();
            _mockReposity.Setup(repo => repo.GetListingByIdAsync(propertyId)).ReturnsAsync((Property)null);

            var request = new GetListingByIdRequest(propertyId);

            // Act
            var result = await _handler.Handle(request, CancellationToken.None);

            // Assert
            Assert.False(result.IsSuccess);
            Assert.Null(result.Data);
            Assert.Equal("Property not found.", result.Message);
            Assert.Equal(ResultStatusCode.NotFound, result.StatusCode);
        }

    }
}