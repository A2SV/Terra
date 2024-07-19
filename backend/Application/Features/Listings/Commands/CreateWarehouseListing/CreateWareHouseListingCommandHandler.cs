using System.Transactions;
using Application.Contracts;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateWarehouseListing
{
    public class CreateWarehouseListingCommandHandler : IRequestHandler<CreateWarehouseListingCommand, Result<Warehouse>>
    {
        private readonly IListingRepository _listingRepository;
        private readonly IUserRepository _userRepository;
        public CreateWarehouseListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository)
        {
            _listingRepository = listingRepository;
            _userRepository = userRepository;
        }

        public async Task<Result<Warehouse>> Handle(CreateWarehouseListingCommand request, CancellationToken cancellationToken)
        {
            using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
            {
                try
                {
                    var listerId = request.ListerId.ToString();
                    var user = await _userRepository.GetUserByIdAsync(listerId);
                    if (user == null) {
                        return new Result<Warehouse>(false, ResultStatusCode.NotFound, null, "Lister of property not found");
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

                    var commercialProperty = new CommercialProperty
                    {
                        PropertyId = property.Id,
                        Property = property,
                        TotalFloors = request.TotalFloors,
                        ParkingSpace = request.ParkingSpace,
                        FloorNumber = request.FloorNumber
                    };

                    await _listingRepository.AddPropertyLocationAsync(propertyLocation);
                    await _listingRepository.AddPaymentInformationAsync(paymentInformation);
                    await _listingRepository.AddPropertyAsync(commercialProperty);

                    var warehouse = new Warehouse
                    {
                        PropertyId = commercialProperty.Id,
                        Property = commercialProperty,
                        CeilingHeight = request.CeilingHeight,
                        LoadingDockAvailable = request.LoadingDockAvailable,
                        OfficeSpaceAvailable = request.OfficeSpaceAvailable,
                        SuitableGoods = request.SuitableGoods
                    };

                    await _listingRepository.AddPropertyAsync(warehouse);

                    await _listingRepository.SaveChangesAsync();
                    
                    scope.Complete();

                    return new Result<Warehouse>(true, ResultStatusCode.Success, warehouse, "Warehouse created successfully");
                }
                catch (Exception ex)
                {
                    return new Result<Warehouse>(false, ResultStatusCode.ServerError, null, $"Error in creating warehouse: {ex.Message}");
                }

            }
        }
    }
}