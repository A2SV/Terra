using System.Transactions;
using Application.Contracts;
using Application.Models.ApiResult;
using Application.Features.Listings.Commands.Common;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.CreateApartmentListing
{
    public class CreateApartmentListingCommandHandler : IRequestHandler<CreateApartmentListingCommand, Result<Property>>
    {
        private readonly IListingRepository _listingRepository;
        private readonly IUserRepository _userRepository;
        private readonly IAmenityRepository _amenityRepository;

        public CreateApartmentListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository)
        {
            _listingRepository = listingRepository;
            _userRepository = userRepository;
            _amenityRepository = amenityRepository;
        }

        public async Task<Result<Property>> Handle(CreateApartmentListingCommand request, CancellationToken cancellationToken)
        {
            using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
            {
                try
                {
                    var listerId = request.ListerId.ToString();
                    var user = await _userRepository.GetUserByIdAsync(listerId);
                    if (user == null) {
                        return new Result<Property>(false, ResultStatusCode.NotFound, null, "Lister of property not found");
                    }

                    var apartment = new Apartment
                    {
                        NumberOfFloorsInBuilding = request.NumberOfFloorsInBuilding,
                        FloorNumberOfUnit = request.FloorNumberOfUnit,
                        LaundryFacilityAvailable = request.LaundryFacilityAvailable,
                        CleaningServiceAvailable = request.CleaningServiceAvailable,
                        StudentFriendly = request.StudentFriendly
                    };

                    await _listingRepository.AddPropertyAsync(apartment);

                    var residentialProperty = new ResidentialProperty
                    {
                        SubTypeId = apartment.Id,
                        FurnishedStatus = request.FurnishedStatus,
                        NumberOfBedrooms = request.NumberOfBedrooms,
                        NumberOfBathrooms = request.NumberOfBathrooms,
                        NumberOfWashrooms = request.NumberOfWashrooms,
                        NumberOfKitchens = request.NumberOfKitchens
                    };

                    var propertyLocation = InitiateCreateListingCommandHandler.CreatePropertyLocation(request);
                    var paymentInformation = InitiateCreateListingCommandHandler.CreatePaymentInformation(request);

                    await _listingRepository.AddPropertyLocationAsync(propertyLocation);
                    await _listingRepository.AddPaymentInformationAsync(paymentInformation);
                    await _listingRepository.AddPropertyAsync(residentialProperty);


                    var property = InitiateCreateListingCommandHandler.CreateProperty(request, listerId, propertyLocation, paymentInformation, residentialProperty: residentialProperty);

                    await _listingRepository.AddPropertyAsync(property);

                    await InitiateCreateListingCommandHandler.AddAmenitiesAsync(_amenityRepository, request, property);

                    await _listingRepository.SaveChangesAsync();
                    
                    scope.Complete();

                    return new Result<Property>(true, ResultStatusCode.Success, property, "Apartment created successfully");
                }
                catch (Exception ex)
                {
                    return new Result<Property>(false, ResultStatusCode.ServerError, null, $"Error in creating apartment: {ex.Message}");
                }

            }
        }
    }
}