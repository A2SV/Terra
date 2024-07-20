using System.Transactions;
using Application.Contracts;
using Application.Features.Listings.Commands.Common;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateOfficeSpaceListing
{
    public class CreateOfficeSpaceListingCommandHandler : IRequestHandler<CreateOfficeSpaceListingCommand, Result<Property>>
    {
        private readonly IListingRepository _listingRepository;
        private readonly IUserRepository _userRepository;
        private readonly IAmenityRepository _amenityRepository;
        public CreateOfficeSpaceListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository)
        private readonly IAmenityRepository _amenityRepository;
        public CreateOfficeSpaceListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository)
        {
            _listingRepository = listingRepository;
            _userRepository = userRepository;
            _amenityRepository = amenityRepository;
            _amenityRepository = amenityRepository;
        }

        public async Task<Result<Property>> Handle(CreateOfficeSpaceListingCommand request, CancellationToken cancellationToken)
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

                    var officeSpace = new OfficeSpace
                    {
                        OfficeSpaceType = request.OfficeSpaceType,
                        MeetingRoomsAvailable = request.MeetingRoomsAvailable,
                        ReceptionAreaAvailable = request.ReceptionAreaAvailable,
                    };

                    await _listingRepository.AddPropertyAsync(officeSpace);

                    var commercialProperty = new CommercialProperty
                    {
                        SubTypeId = officeSpace.Id,
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

                    return new Result<Property>(true, ResultStatusCode.Success, property, "Office space created successfully");
                }
                catch (Exception ex)
                {
                    return new Result<Property>(false, ResultStatusCode.ServerError, null, $"Error in creating Office space: {ex.Message}");
                }

            }
        }
    }
}