using System.Transactions;
using Application.Contracts;
using Application.Features.Listings.Commands.Common;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.CreateHouseListing
{
    public class CreateHouseListingCommandHandler : IRequestHandler<CreateHouseListingCommand, Result<Property>>
    {
        private readonly IListingRepository _listingRepository;
        private readonly IUserRepository _userRepository;
        private readonly IAmenityRepository _amenityRepository;
        public CreateHouseListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository)
        {
            _listingRepository = listingRepository;
            _userRepository = userRepository;
            _amenityRepository = amenityRepository;
            _amenityRepository = amenityRepository;
        }

        public async Task<Result<Property>> Handle(CreateHouseListingCommand request, CancellationToken cancellationToken)
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

                    var house = new House
                    {
                        NumberOfStories = request.NumberOfStories,
                        GarageSpace = request.GarageSpace,
                        StudentFriendly = request.StudentFriendly
                    };

                    await _listingRepository.AddPropertyAsync(house);


                    var residentialProperty = new ResidentialProperty
                    {
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

                    return new Result<Property>(true, ResultStatusCode.Success, property, "House created successfully");
                }
                catch (Exception ex)
                {
                    return new Result<Property>(false, ResultStatusCode.ServerError, null, $"Error in creating house: {ex.Message}");
                }

            }
        }
    }
}