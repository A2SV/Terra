// using System.Transactions;
// using Application.Contracts;
// using Application.Features.Listings.Commands.Common;
// using Application.Models.ApiResult;
// using Domain.Entities;
// using Domain.Enums;
// using MediatR;

// namespace Application.Features.Listings.Commands.CreateWarehouseListing
// {
//     public class CreateWarehouseListingCommandHandler : IRequestHandler<CreateWarehouseListingCommand, Result<Warehouse>>
//     {
//         private readonly IListingRepository _listingRepository;
//         private readonly IUserRepository _userRepository;
//         private readonly IAmenityRepository _amenityRepository;
//         private readonly IStorageService _storageService;

//         public CreateWarehouseListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository, IStorageService storageService)
//         {
//             _listingRepository = listingRepository;
//             _userRepository = userRepository;
//             _amenityRepository = amenityRepository;
//             _storageService = storageService;
//         }

//         public async Task<Result<Warehouse>> Handle(CreateWarehouseListingCommand request, CancellationToken cancellationToken)
//         {
//             using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
//             {
//                 try
//                 {
//                     var listerId = request.ListerId.ToString();
//                     var user = await _userRepository.GetUserByIdAsync(listerId);
//                     if (user == null) {
//                         return new Result<Warehouse>(false, ResultStatusCode.NotFound, null, "Lister of property not found");
//                     }

//                     var propertyLocation = InitiateCreateListingCommandHandler.CreatePropertyLocation(request);
//                     var paymentInformation = InitiateCreateListingCommandHandler.CreatePaymentInformation(request);

//                     await _listingRepository.AddPropertyLocationAsync(propertyLocation);
//                     await _listingRepository.AddPaymentInformationAsync(paymentInformation);

//                     var property = InitiateCreateListingCommandHandler.CreateProperty(request, listerId, propertyLocation, paymentInformation);

//                     await _listingRepository.AddPropertyAsync(property);

//                     await InitiateCreateListingCommandHandler.AddAmenitiesAsync(_amenityRepository, request, property);

//                     var commercialProperty = new CommercialProperty
//                     {
//                         PropertyId = property.Id,
//                         TotalFloors = request.TotalFloors,
//                         ParkingSpace = request.ParkingSpace,
//                         FloorNumber = request.FloorNumber
//                     };
                    
//                     await _listingRepository.AddPropertyAsync(commercialProperty);

//                     var warehouse = new Warehouse
//                     {
//                         CommercialPropertyId = commercialProperty.Id,
//                         CeilingHeight = request.CeilingHeight,
//                         LoadingDockAvailable = request.LoadingDockAvailable,
//                         OfficeSpaceAvailable = request.OfficeSpaceAvailable,
//                         SuitableGoods = request.SuitableGoods
//                     };

//                     await _listingRepository.AddPropertyAsync(warehouse);

//                     await _listingRepository.SaveChangesAsync();

//                     scope.Complete();

//                     return new Result<Warehouse>(true, ResultStatusCode.Success, warehouse, "Warehouse created successfully");
//                 }
//                 catch (Exception ex)
//                 {
//                     return new Result<Warehouse>(false, ResultStatusCode.ServerError, null, $"Error in creating warehouse: {ex.Message}");
//                 }

//             }
//         }
//     }
// }