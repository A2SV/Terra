using System.Transactions;
using Application.Contracts;
using Application.Features.Listings.Commands.Common;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateWarehouseListing
{
    public class CreateWarehouseListingCommandHandler : IRequestHandler<CreateWarehouseListingCommand, Result<Property>>
    {
        private readonly IListingRepository _listingRepository;
        private readonly IUserRepository _userRepository;
        private readonly IAmenityRepository _amenityRepository;
        public CreateWarehouseListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository)
        {
            _listingRepository = listingRepository;
            _userRepository = userRepository;
            _amenityRepository = amenityRepository;
        }

        public async Task<Result<Property>> Handle(CreateWarehouseListingCommand request, CancellationToken cancellationToken)
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

                    var warehouse = new Warehouse
                    {
                        CeilingHeight = request.CeilingHeight,
                        LoadingDockAvailable = request.LoadingDockAvailable,
                        OfficeSpaceAvailable = request.OfficeSpaceAvailable,
                        SuitableGoods = request.SuitableGoods
                    };

                    await _listingRepository.AddPropertyAsync(warehouse);

                    var commercialProperty = new CommercialProperty
                    {
                        SubTypeId = warehouse.Id,
                        TotalFloors = request.TotalFloors,
                        ParkingSpace = request.ParkingSpace,
                        FloorNumber = request.FloorNumber
                    };

                    var propertyLocation = InitiateCreateListingCommandHandler.CreatePropertyLocation(request);
                    var paymentInformation = InitiateCreateListingCommandHandler.CreatePaymentInformation(request);

                    await _listingRepository.AddPropertyLocationAsync(propertyLocation);
                    await _listingRepository.AddPaymentInformationAsync(paymentInformation);
                    await _listingRepository.AddPropertyAsync(commercialProperty);


                    var property = InitiateCreateListingCommandHandler.CreateProperty(request, listerId, propertyLocation, paymentInformation, commercialProperty: commercialProperty);

                    await _listingRepository.AddPropertyAsync(property);

                    await InitiateCreateListingCommandHandler.AddAmenitiesAsync(_amenityRepository, request, property);

                    await _listingRepository.SaveChangesAsync();


                    scope.Complete();

                    return new Result<Property>(true, ResultStatusCode.Success, property, "Warehouse created successfully");
                }
                catch (Exception ex)
                {
                    return new Result<Property>(false, ResultStatusCode.ServerError, null, $"Error in creating warehouse: {ex.Message}");
                }

            }
        }
    }
}