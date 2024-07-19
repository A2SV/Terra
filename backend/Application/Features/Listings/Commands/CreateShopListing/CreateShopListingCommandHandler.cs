using System.Transactions;
using Application.Contracts;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateShopListing
{
    public class CreateShopListingCommandHandler : IRequestHandler<CreateShopListingCommand, Result<Shop>>
    {
        private readonly IListingRepository _listingRepository;
        private readonly IUserRepository _userRepository;
        private readonly IAmenityRepository _amenityRepository;
        public CreateShopListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository)
        {
            _listingRepository = listingRepository;
            _userRepository = userRepository;
            _amenityRepository = amenityRepository;
        }

        public async Task<Result<Shop>> Handle(CreateShopListingCommand request, CancellationToken cancellationToken)
        {
            using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
            {
                try
                {
                    var listerId = request.ListerId.ToString();
                    var user = await _userRepository.GetUserByIdAsync(listerId);
                    if (user == null) {
                        return new Result<Shop>(false, ResultStatusCode.NotFound, null, "Lister of property not found");
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

                    var commercialProperty = new CommercialProperty
                    {
                        PropertyId = property.Id,
                        Property = property,
                        TotalFloors = request.TotalFloors,
                        ParkingSpace = request.ParkingSpace,
                        FloorNumber = request.FloorNumber
                    };


                    if (request.Amenities != null)
                    {
                        foreach (var amenity in request.Amenities)
                        {
                            var response = await _amenityRepository.GetAllAmenitiesAsync("Name", amenity);
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
                    await _listingRepository.AddPropertyAsync(commercialProperty);

                    var shop = new Shop
                    {
                        PropertyId = commercialProperty.Id,
                        Property = commercialProperty,
                        DisplayWindowAvailable = request.DisplayWindowAvailable,
                        StorageRoomSize = request.StorageRoomSize
                    };

                    await _listingRepository.AddPropertyAsync(shop);

                    await _listingRepository.SaveChangesAsync();
                    
                    scope.Complete();

                    return new Result<Shop>(true, ResultStatusCode.Success, shop, "Shop created successfully");
                }
                catch (Exception ex)
                {
                    return new Result<Shop>(false, ResultStatusCode.ServerError, null, $"Error in creating shop: {ex.Message}");
                }

            }
        }
    }
}