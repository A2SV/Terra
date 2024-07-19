using System.Transactions;
using Application.Contracts;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.CreateHotelListing
{
    public class CreateHotelListingCommandHandler : IRequestHandler<CreateHotelListingCommand, Result<Hotel>>
    {
        private readonly IListingRepository _listingRepository;
        private readonly IUserRepository _userRepository;
        private readonly IAmenityRepository _amenityRepository;
        public CreateHotelListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository)
        {
            _listingRepository = listingRepository;
            _userRepository = userRepository;
            _amenityRepository = amenityRepository;
        }

        public async Task<Result<Hotel>> Handle(CreateHotelListingCommand request, CancellationToken cancellationToken)
        {
            using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
            {
                try
                {
                    var listerId = request.ListerId.ToString();
                    var user = await _userRepository.GetUserByIdAsync(listerId);
                    if (user == null) {
                        return new Result<Hotel>(false, ResultStatusCode.NotFound, null, "Lister of property not found");
                    }

                    var property = new Property
                    {
                        ListerId = listerId,
                        Title = request.Title,
                        Description = request.Description,
                        PropertyType = request.PropertyType,
                        ListingType = request.ListingType,
                        PublishStatus = request.PropertyPublishStatus,
                        MarketStatus = request.PropertyMarketStatus,
                        PropertySize = request.PropertySize,
                        AvailableStartDate = request.AvailableStartDate,
                        AvailableEndDate = request.AvailableEndDate,
                        Lister = user
                    };

                    await _listingRepository.AddPropertyAsync(property);

                    var propertyLocation = new PropertyLocation
                    {
                        PropertyId = property.Id,
                        StreetName = request.StreetName,
                        HouseNumber = request.HouseNumber,
                        City = request.City,
                        Country = request.Country,
                        Longitude = request.Longitude,
                        Latitude = request.Latitude,
                        ZipCode = request.ZipCode,
                        Property = property
                    };

                    var paymentInformation = new PaymentInformation
                    {
                        PropertyId = property.Id,
                        Property = property,
                        Currency = request.PaymentCurrency,
                        PaymentFrequency = request.PaymentFrequency,
                        Cost = request.Price,
                        Negotiable = request.Negotiable
                    };

                    var residentialProperty = new ResidentialProperty
                    {
                        PropertyId = property.Id,
                        Property = property,
                        FurnishedStatus = request.FurnishedStatus,
                        NumberOfBedrooms = request.NumberOfBedrooms,
                        NumberOfBathrooms = request.NumberOfBathrooms,
                        NumberOfWashrooms = request.NumberOfWashrooms,
                        NumberOfKitchens = request.NumberOfKitchens
                    };

                    var amenities = new List<PropertyAmenity>();

                    if (request.Amenities != null)
                    {
                        foreach (var amenity in request.Amenities)
                        {
                            var response = await _amenityRepository.GetAllAmenitiesAsync("Name", amenity, "Name", true);
                            if (response != null && response.Count() > 0)
                            {
                                var propertyAmenity = new PropertyAmenity
                                {
                                    PropertyId = property.Id,
                                    Property = property,
                                    AmenityId = response[0].Id,
                                    Amenity = response[0]
                                };
                                await _amenityRepository.AddAmenityAsync(propertyAmenity);
                            }
                        }
                    }

                    await _listingRepository.AddPropertyLocationAsync(propertyLocation);
                    await _listingRepository.AddPaymentInformationAsync(paymentInformation);
                    await _listingRepository.AddPropertyAsync(residentialProperty);

                    var hotel = new Hotel
                    {
                        PropertyId = residentialProperty.Id,
                        Property = residentialProperty,
                        StarRating = request.StarRating,
                        RestaurantOnSite = request.RestaurantOnSite
                    };

                    await _listingRepository.AddPropertyAsync(hotel);

                    await _listingRepository.SaveChangesAsync();
                    
                    scope.Complete();

                    return new Result<Hotel>(true, ResultStatusCode.Success, hotel, "Hotel created successfully");
                }
                catch (Exception ex)
                {
                    return new Result<Hotel>(false, ResultStatusCode.ServerError, null, $"Error in creating hotel: {ex.Message}");
                }

            }
        }
    }
}