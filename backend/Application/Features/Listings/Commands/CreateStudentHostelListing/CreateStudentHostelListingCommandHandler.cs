// using System.Transactions;
// using Application.Contracts;
// using Application.Features.Listings.Commands.Common;
// using Application.Models.ApiResult;
// using Domain.Entities;
// using MediatR;

// namespace Application.Features.Listings.Commands.CreateStudentHostelListing
// {
//     public class CreateStudentHostelListingCommandHandler : IRequestHandler<CreateStudentHostelListingCommand, Result<StudentHostel>>
//     {
//         private readonly IListingRepository _listingRepository;
//         private readonly IUserRepository _userRepository;
//         private readonly IAmenityRepository _amenityRepository;
//         private readonly IStorageService _storageService;

//         public CreateStudentHostelListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository, IStorageService storageService)
//         {
//             _listingRepository = listingRepository;
//             _userRepository = userRepository;
//             _amenityRepository = amenityRepository;
//             _storageService = storageService;
//         }

//         public async Task<Result<StudentHostel>> Handle(CreateStudentHostelListingCommand request, CancellationToken cancellationToken)
//         {
//             using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
//             {
//                 try
//                 {
//                     var listerId = request.ListerId.ToString();
//                     var user = await _userRepository.GetUserByIdAsync(listerId);
//                     if (user == null) {
//                         return new Result<StudentHostel>(false, ResultStatusCode.NotFound, null, "Lister of property not found");
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



//                     var studentHostel = new StudentHostel
//                     {
//                         ResidentialPropertyId = residentialProperty.Id,
//                         RoomTypes = request.RoomTypes,
//                         HostelType = request.StudentHostelType,
//                         HostelLocation = request.StudentHostelLocation,
//                         SharedFacilities = request.SharedFacilities,
//                         MealPlanAvailable = request.MealPlanAvailable,
//                         StudyAreaAvailable = request.StudyAreaAvailable,
//                         LaundryFacilityAvailable = request.LaundryFacilityAvailable,
//                         CleaningServiceAvailable = request.CleaningServiceAvailable
//                     };

//                     await _listingRepository.AddPropertyAsync(studentHostel);

//                     await _listingRepository.SaveChangesAsync();


//                     scope.Complete();

//                     return new Result<StudentHostel>(true, ResultStatusCode.Success, studentHostel, "Student hostel created successfully");
//                 }
//                 catch (Exception ex)
//                 {
//                     return new Result<StudentHostel>(false, ResultStatusCode.ServerError, null, $"Error in creating Student hostel: {ex.Message}");
//                 }

//             }
//         }
//     }
// }