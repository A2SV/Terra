using System.Transactions;
using Application.Contracts;
using Application.Features.Listings.Commands.Common;
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

                    var propertyLocation = InitiateCreateListingCommandHandler.CreatePropertyLocation(request);
                    var paymentInformation = InitiateCreateListingCommandHandler.CreatePaymentInformation(request);

                    await _listingRepository.AddPropertyLocationAsync(propertyLocation);
                    await _listingRepository.AddPaymentInformationAsync(paymentInformation);

                    var property = InitiateCreateListingCommandHandler.CreateProperty(request, listerId, propertyLocation, paymentInformation);

                    await _listingRepository.AddPropertyAsync(property);

                    await InitiateCreateListingCommandHandler.AddAmenitiesAsync(_amenityRepository, request, property);

                    var commercialProperty = new CommercialProperty
                    {
                        PropertyId = property.Id,
                        TotalFloors = request.TotalFloors,
                        ParkingSpace = request.ParkingSpace,
                        FloorNumber = request.FloorNumber
                    };
                    
                    await _listingRepository.AddPropertyAsync(commercialProperty);

                    var shop = new Shop
                    {
                        CommercialPropertyId = commercialProperty.Id,
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