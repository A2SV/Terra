// using System.Transactions;
// using Application.Contracts;
// using Application.Features.Listings.Commands.Common;
// using Application.Models.ApiResult;
// using Domain.Entities;
// using Domain.Enums;
// using MediatR;

// namespace Application.Features.Listings.Commands.CreateOfficeSpaceListing
// {
//     public class CreateOfficeSpaceListingCommandHandler : IRequestHandler<CreateOfficeSpaceListingCommand, Result<OfficeSpace>>
//     {
//         private readonly IListingRepository _listingRepository;
//         private readonly IUserRepository _userRepository;
//         private readonly IAmenityRepository _amenityRepository;
//         private readonly IStorageService _storageService;

//         public CreateOfficeSpaceListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository, IStorageService storageService)
//         {
//             _listingRepository = listingRepository;
//             _userRepository = userRepository;
//             _amenityRepository = amenityRepository;
//             _storageService = storageService;
//         }
//         public async Task<Result<OfficeSpace>> Handle(CreateOfficeSpaceListingCommand request, CancellationToken cancellationToken)
//         {
//             using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
//             {
//                 try
//                 {
//                     var listerId = request.ListerId.ToString();
//                     var user = await _userRepository.GetUserByIdAsync(listerId);
//                     if (user == null) {
//                         return new Result<OfficeSpace>(false, ResultStatusCode.NotFound, null, "Lister of property not found");
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

//                     var officeSpace = new OfficeSpace
//                     {
//                         CommercialPropertyId = commercialProperty.Id,
//                         OfficeSpaceType = request.OfficeSpaceType,
//                         MeetingRoomsAvailable = request.MeetingRoomsAvailable,
//                         ReceptionAreaAvailable = request.ReceptionAreaAvailable,
//                     };

//                     await _listingRepository.AddPropertyAsync(officeSpace);

//                     await _listingRepository.SaveChangesAsync();
                    
//                     scope.Complete();

//                     return new Result<OfficeSpace>(true, ResultStatusCode.Success, officeSpace, "Office space created successfully");
//                 }
//                 catch (Exception ex)
//                 {
//                     return new Result<OfficeSpace>(false, ResultStatusCode.ServerError, null, $"Error in creating Office space: {ex.Message}");
//                 }

//             }
//         }
//     }
// }