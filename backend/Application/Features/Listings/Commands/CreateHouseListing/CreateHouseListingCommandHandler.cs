// using System.Transactions;
// using Application.Contracts;
// using Application.Features.Listings.Commands.Common;
// using Application.Models.ApiResult;
// using Domain.Entities;
// using MediatR;

// namespace Application.Features.Listings.Commands.CreateHouseListing
// {
//     public class CreateHouseListingCommandHandler : IRequestHandler<CreateHouseListingCommand, Result<House>>
//     {
//         private readonly IListingRepository _listingRepository;
//         private readonly IUserRepository _userRepository;
//         private readonly IAmenityRepository _amenityRepository;
//         private readonly IStorageService _storageService;

//         public CreateHouseListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository, IStorageService storageService)
//         {
//             _listingRepository = listingRepository;
//             _userRepository = userRepository;
//             _amenityRepository = amenityRepository;
//             _storageService = storageService;
//         }
//         public async Task<Result<House>> Handle(CreateHouseListingCommand request, CancellationToken cancellationToken)
//         {
//             using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
//             {
//                 try
//                 {
//                     var listerId = request.ListerId.ToString();
//                     var user = await _userRepository.GetUserByIdAsync(listerId);
//                     if (user == null) {
//                         return new Result<House>(false, ResultStatusCode.NotFound, null, "Lister of property not found");
//                     }

//                     var propertyLocation = InitiateCreateListingCommandHandler.CreatePropertyLocation(request);
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


//                     var house = new House
//                     {
//                         ResidentialPropertyId = residentialProperty.Id,
//                         NumberOfStories = request.NumberOfStories,
//                         GarageSpace = request.GarageSpace,
//                         StudentFriendly = request.StudentFriendly
//                     };

//                     await _listingRepository.AddPropertyAsync(house);

//                     await _listingRepository.SaveChangesAsync();
    
//                     scope.Complete();

//                     return new Result<House>(true, ResultStatusCode.Success, house, "House created successfully");
//                 }
//                 catch (Exception ex)
//                 {
//                     return new Result<House>(false, ResultStatusCode.ServerError, null, $"Error in creating house: {ex.Message}");
//                 }

//             }
//         }
//     }
// }