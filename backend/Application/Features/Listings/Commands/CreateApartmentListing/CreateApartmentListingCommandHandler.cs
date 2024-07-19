using System.Transactions;
using Application.Contracts;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.CreateApartmentListing
{
    public class CreateApartmentListingCommandHandler : IRequestHandler<CreateApartmentListingCommand, Result<Apartment>>
    {
        private readonly IListingRepository _listingRepository;
        private readonly IUserRepository _userRepository;
        public CreateApartmentListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository)
        {
            _listingRepository = listingRepository;
            _userRepository = userRepository;
        }

        public async Task<Result<Apartment>> Handle(CreateApartmentListingCommand request, CancellationToken cancellationToken)
        {
            using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
            {
                try
                {
                    var user = await _userRepository.GetUserByIdAsync(request.ListerId);
                    if (user == null) {
                        return new Result<Apartment>(false, ResultStatusCode.NotFound, null, "Lister of property not found");
                    }

                    var property = new Property
                    {
                        ListerId = request.ListerId,
                        Title = request.Title,
                        Description = request.Description,
                        PropertyType = request.PropertyType,
                        ListingType = request.ListingType,
                        PublishStatus = request.PropertyPublishStatus,
                        MarketStatus = request.PropertyMarketStatus,
                        PropertySize = request.PropertySize,
                        AvailableStartDate = request.AvailableStartDate,
                        AvailableEndDate = request.AvailableEndDate,
                        // PropertyAmenities = request.Amenities,
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

                    await _listingRepository.AddPropertyLocationAsync(propertyLocation);
                    await _listingRepository.AddPaymentInformationAsync(paymentInformation);
                    await _listingRepository.AddPropertyAsync(residentialProperty);

                    var apartment = new Apartment
                    {
                        PropertyId = residentialProperty.Id,
                        Property = residentialProperty,
                        NumberOfFloorsInBuilding = request.NumberOfFloorsInBuilding,
                        FloorNumberOfUnit = request.FloorNumberOfUnit,
                        LaundryFacilityAvailable = request.LaundryFacilityAvailable,
                        CleaningServiceAvailable = request.CleaningServiceAvailable,
                        StudentFriendly = request.StudentFriendly
                    };

                    await _listingRepository.AddPropertyAsync(apartment);

                    await _listingRepository.SaveChangesAsync();
                    
                    scope.Complete();

                    return new Result<Apartment>(true, ResultStatusCode.Success, apartment, "Apartment created successfully");
                }
                catch (Exception ex)
                {
                    return new Result<Apartment>(false, ResultStatusCode.ServerError, null, $"Error in creating apartment: {ex.Message}");
                }

            }
        }
    }
}