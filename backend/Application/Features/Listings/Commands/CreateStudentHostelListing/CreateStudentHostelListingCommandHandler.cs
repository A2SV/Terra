using System.Transactions;
using Application.Contracts;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.CreateStudentHostelListing
{
    public class CreateStudentHostelListingCommandHandler : IRequestHandler<CreateStudentHostelListingCommand, Result<StudentHostel>>
    {
        private readonly IListingRepository _listingRepository;
        private readonly IUserRepository _userRepository;
        private readonly IAmenityRepository _amenityRepository;
        public CreateStudentHostelListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository)
        {
            _listingRepository = listingRepository;
            _userRepository = userRepository;
            _amenityRepository = amenityRepository;
        }

        public async Task<Result<StudentHostel>> Handle(CreateStudentHostelListingCommand request, CancellationToken cancellationToken)
        {
            using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
            {
                try
                {
                    var listerId = request.ListerId.ToString();
                    var user = await _userRepository.GetUserByIdAsync(listerId);
                    if (user == null) {
                        return new Result<StudentHostel>(false, ResultStatusCode.NotFound, null, "Lister of property not found");
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
                    await _listingRepository.AddPropertyAsync(residentialProperty);

                    var studentHostel = new StudentHostel
                    {
                        PropertyId = residentialProperty.Id,
                        Property = residentialProperty,
                        RoomTypes = request.RoomTypes,
                        HostelType = request.StudentHostelType,
                        HostelLocation = request.StudentHostelLocation,
                        SharedFacilities = request.SharedFacilities,
                        MealPlanAvailable = request.MealPlanAvailable,
                        StudyAreaAvailable = request.StudyAreaAvailable,
                        LaundryFacilityAvailable = request.LaundryFacilityAvailable,
                        CleaningServiceAvailable = request.CleaningServiceAvailable
                    };

                    await _listingRepository.AddPropertyAsync(studentHostel);

                    await _listingRepository.SaveChangesAsync();
                    
                    scope.Complete();

                    return new Result<StudentHostel>(true, ResultStatusCode.Success, studentHostel, "Student hostel created successfully");
                }
                catch (Exception ex)
                {
                    return new Result<StudentHostel>(false, ResultStatusCode.ServerError, null, $"Error in creating Student hostel: {ex.Message}");
                }

            }
        }
    }
}