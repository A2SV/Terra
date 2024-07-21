using Application.Contracts;
using Domain.Entities;

namespace Application.Features.Listings.Commands.Common
{
    public class InitiateCreateListingCommandHandler
    {
        public static Property CreateProperty<TCommand>(TCommand request, string listerId, PropertyLocation propertyLocation, PaymentInformation paymentInformation)
            where TCommand : InitiateCreateListingCommand
        {
            return new Property
            {
                PaymentInformationId = paymentInformation.Id,
                PropertyLocationId = propertyLocation.Id,
                ListerId = listerId,
                Title = request.Title,
                Description = request.Description,
                PropertyType = request.PropertyType,
                ListingType = request.ListingType,
                PublishStatus = request.PropertyPublishStatus,
                MarketStatus = request.PropertyMarketStatus,
                PropertySize = request.PropertySize,
                AvailableStartDate = request.AvailableStartDate,
                AvailableEndDate = request.AvailableEndDate
            };
        }

        public static PropertyLocation CreatePropertyLocation<TCommand>(TCommand request)
            where TCommand : InitiateCreateListingCommand
        {
            return new PropertyLocation
            {
                StreetName = request.StreetName,
                HouseNumber = request.HouseNumber,
                City = request.City,
                Country = request.Country,
                ZipCode = request.ZipCode,
                Longitude = request.Longitude,
                Latitude = request.Latitude
            };
        }

        public static PaymentInformation CreatePaymentInformation<TCommand>(TCommand request)
            where TCommand : InitiateCreateListingCommand
        {
            return new PaymentInformation
            {
                Currency = request.PaymentCurrency,
                PaymentFrequency = request.PaymentFrequency,
                Cost = request.Price,
                Negotiable = request.Negotiable
            };
        }

        public static async Task AddAmenitiesAsync(IAmenityRepository amenityRepository, InitiateCreateListingCommand request, Property property)
        {
            if (request.Amenities != null)
            {
                foreach (var amenity in request.Amenities)
                {
                    var response = await amenityRepository.GetAllAmenitiesAsync("Name", amenity);
                    if (response != null && response.Count() > 0)
                    {
                        var propertyAmenity = new PropertyAmenity
                        {
                            PropertyId = property.Id,
                            Property = property,
                            AmenityId = response[0].Id,
                            Amenity = response[0]
                        };
                        await amenityRepository.AddAmenityAsync(propertyAmenity);
                    }
                }
            }
        }

    }
}