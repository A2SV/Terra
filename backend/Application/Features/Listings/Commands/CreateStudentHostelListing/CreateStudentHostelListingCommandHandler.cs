using System.Transactions;
using Application.Contracts;
using Application.Features.Listings.Commands.Common;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.CreateStudentHostelListing
{
    public class CreateStudentHostelListingCommandHandler : IRequestHandler<CreateStudentHostelListingCommand, Result<Property>>
    {
        private readonly IListingRepository _listingRepository;
        private readonly IUserRepository _userRepository;
        private readonly IAmenityRepository _amenityRepository;
        public CreateStudentHostelListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository)
        {
            _listingRepository = listingRepository;
            _userRepository = userRepository;
            _amenityRepository = amenityRepository;
            _amenityRepository = amenityRepository;
        }

        public async Task<Result<Property>> Handle(CreateStudentHostelListingCommand request, CancellationToken cancellationToken)
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

                    var studentHostel = new StudentHostel
                    {
                        RoomTypes = request.RoomTypes,
                        HostelType = request.StudentHostelType,
                        HostelLocation = request.StudentHostelLocation,
                        SharedFacilities = request.SharedFacilities,
                        MealPlanAvailable = request.MealPlanAvailable,
                        StudyAreaAvailable = request.StudyAreaAvailable,
                        LaundryFacilityAvailable = request.LaundryFacilityAvailable,
                        CleaningServiceAvailable = request.CleaningServiceAvailable
                    };

                    await _listingRepository.AddPropertyAsync(studentHostel);


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

                    return new Result<Property>(true, ResultStatusCode.Success, property, "Student hostel created successfully");
                }
                catch (Exception ex)
                {
                    return new Result<Property>(false, ResultStatusCode.ServerError, null, $"Error in creating Student hostel: {ex.Message}");
                }

            }
        }
    }
}