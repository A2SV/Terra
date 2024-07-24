// using System.Transactions;
// using Application.Contracts;
// using Application.Models.ApiResult;
// using Application.Features.Listings.Commands.Common;
// using Domain.Entities;
// using MediatR;

// namespace Application.Features.Listings.Commands.CreateApartmentListing
// {
//     public class CreateApartmentListingCommandHandler : IRequestHandler<CreateApartmentListingCommand, Result<Apartment>>
//     {
//         private readonly IListingRepository _listingRepository;
//         private readonly IUserRepository _userRepository;
//         private readonly IAmenityRepository _amenityRepository;
//         private readonly IStorageService _storageService;

//         public CreateApartmentListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository, IStorageService storageService)
//         {
//             _listingRepository = listingRepository;
//             _userRepository = userRepository;
//             _amenityRepository = amenityRepository;
//             _storageService = storageService;
//         }

//         public async Task<Result<Apartment>> Handle(InitiateCreateListingCommand rootRequest, CreateApartmentListingCommand request, CancellationToken cancellationToken)
//         {
//             using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
//             {
//                 try
//                 {
//                     var listerId = rootRequest.ListerId.ToString();
//                     var user = await _userRepository.GetUserByIdAsync(listerId);
//                     if (user == null) {
//                         return new Result<Apartment>(false, ResultStatusCode.NotFound, null, "Lister of property not found");
//                     }

//                     var propertyLocation = InitiateCreateListingCommandHandler.CreatePropertyLocation(rootRequest);
//                     var paymentInformation = InitiateCreateListingCommandHandler.CreatePaymentInformation(request);

//                     await _listingRepository.AddPropertyLocationAsync(propertyLocation);
//                     await _listingRepository.AddPaymentInformationAsync(paymentInformation);

//                     var property = InitiateCreateListingCommandHandler.CreateProperty(request, listerId, propertyLocation, paymentInformation);

//                     await _listingRepository.AddPropertyAsync(property);

//                     var residentialProperty = new ResidentialProperty
//                     {
//                         PropertyId = property.Id,
//                         FurnishedStatus = request.FurnishedStatus,
//                         NumberOfBedrooms = request.NumberOfBedrooms,
//                         NumberOfBathrooms = request.NumberOfBathrooms,
//                         NumberOfWashrooms = request.NumberOfWashrooms,
//                         NumberOfKitchens = request.NumberOfKitchens
//                     };
                    
//                     await _listingRepository.AddPropertyAsync(residentialProperty);

//                     await InitiateCreateListingCommandHandler.AddAmenitiesAsync(_amenityRepository, request, property);

//                     var apartment = new Apartment
//                     {
//                         ResidentialPropertyId = residentialProperty.Id,
//                         NumberOfFloorsInBuilding = request.NumberOfFloorsInBuilding,
//                         FloorNumberOfUnit = request.FloorNumberOfUnit,
//                         LaundryFacilityAvailable = request.LaundryFacilityAvailable,
//                         CleaningServiceAvailable = request.CleaningServiceAvailable,
//                         StudentFriendly = request.StudentFriendly
//                     };

//                     await _listingRepository.AddPropertyAsync(apartment);

//                     await _listingRepository.SaveChangesAsync();
                    
//                     scope.Complete();

//                     return new Result<Apartment>(true, ResultStatusCode.Success, apartment, "Apartment created successfully");
//                 }
//                 catch (Exception ex)
//                 {
//                     return new Result<Apartment>(false, ResultStatusCode.ServerError, null, $"Error in creating apartment: {ex.Message}");
//                 }

//             }
//         }
//     }
// }