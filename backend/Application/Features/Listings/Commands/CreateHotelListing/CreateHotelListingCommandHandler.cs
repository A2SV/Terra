using System.Transactions;
using Application.Contracts;
using Application.Features.Listings.Commands.Common;
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

                    var propertyLocation = InitiateCreateListingCommandHandler.CreatePropertyLocation(request);
                    var paymentInformation = InitiateCreateListingCommandHandler.CreatePaymentInformation(request);

                    await _listingRepository.AddPropertyLocationAsync(propertyLocation);
                    await _listingRepository.AddPaymentInformationAsync(paymentInformation);

                    var property = InitiateCreateListingCommandHandler.CreateProperty(request, listerId, propertyLocation, paymentInformation);

                    await _listingRepository.AddPropertyAsync(property);

                    var residentialProperty = new ResidentialProperty
                    {
                        PropertyId = property.Id,
                        FurnishedStatus = request.FurnishedStatus,
                        NumberOfBedrooms = request.NumberOfBedrooms,
                        NumberOfBathrooms = request.NumberOfBathrooms,
                        NumberOfWashrooms = request.NumberOfWashrooms,
                        NumberOfKitchens = request.NumberOfKitchens
                    };
                    
                    await _listingRepository.AddPropertyAsync(residentialProperty);

                    await InitiateCreateListingCommandHandler.AddAmenitiesAsync(_amenityRepository, request, property);

                    var hotel = new Hotel
                    {
                        ResidentialPropertyId = residentialProperty.Id,
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