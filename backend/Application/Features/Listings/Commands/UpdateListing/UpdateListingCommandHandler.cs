using System.Transactions;
using Application.Contracts;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.UpdateListing
{
    public class UpdateListingCommandHandler : IRequestHandler<UpdateListingCommand, Result<Property>>
    {
        private readonly IListingRepository _listingRepository;
        private readonly IAmenityRepository _amenityRepository;

        public UpdateListingCommandHandler(
            IListingRepository listingRepository,
            IAmenityRepository amenityRepository)
        {
            _listingRepository = listingRepository;
            _amenityRepository = amenityRepository;
        }

        public async Task<Result<Property>> Handle(UpdateListingCommand request, CancellationToken cancellationToken)
        {
            using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
            {
                try
                {
                    var property = await _listingRepository.GetPropertyByIdAsync(request.PropertyId);
                    if (property == null)
                    {
                        return new Result<Property>(false, ResultStatusCode.NotFound, null, "Property not found");
                    }

                    // Update basic property information
                    if (!string.IsNullOrEmpty(request.Title)) property.Title = request.Title;
                    if (!string.IsNullOrEmpty(request.Description)) property.Description = request.Description;
                    if (request.ListingType.HasValue) property.ListingType = request.ListingType.Value;
                    if (request.PropertySize.HasValue) property.PropertySize = request.PropertySize.Value;
                    if (request.AvailableStartDate.HasValue) property.AvailableStartDate = request.AvailableStartDate;
                    if (request.AvailableEndDate.HasValue) property.AvailableEndDate = request.AvailableEndDate;

                    // Update payment information
                    if (property.PaymentInformation != null)
                    {
                        if (request.PaymentCurrency.HasValue) 
                            property.PaymentInformation.Currency = request.PaymentCurrency.Value;
                        if (request.PaymentFrequency.HasValue) 
                            property.PaymentInformation.PaymentFrequency = request.PaymentFrequency.Value;
                        if (request.Price.HasValue) 
                            property.PaymentInformation.Cost = request.Price.Value;
                        if (request.Negotiable.HasValue) 
                            property.PaymentInformation.Negotiable = request.Negotiable.Value;
                    }

                    // Update location information
                    if (property.PropertyLocation != null)
                    {
                        if (!string.IsNullOrEmpty(request.StreetName)) 
                            property.PropertyLocation.StreetName = request.StreetName;
                        if (!string.IsNullOrEmpty(request.HouseNumber)) 
                            property.PropertyLocation.HouseNumber = request.HouseNumber;
                        if (!string.IsNullOrEmpty(request.City)) 
                            property.PropertyLocation.City = request.City;
                        if (!string.IsNullOrEmpty(request.Country)) 
                            property.PropertyLocation.Country = request.Country;
                        if (!string.IsNullOrEmpty(request.ZipCode)) 
                            property.PropertyLocation.ZipCode = request.ZipCode;
                        if (request.Longitude.HasValue) 
                            property.PropertyLocation.Longitude = request.Longitude.Value;
                        if (request.Latitude.HasValue) 
                            property.PropertyLocation.Latitude = request.Latitude.Value;
                    }

                    // Handle amenities
                    if (request.AddAmenities?.Any() == true)
                    {
                        foreach (var amenityId in request.AddAmenities)
                        {
                            var amenity = await _amenityRepository.GetAmenityByIdAsync(amenityId);
                            if (amenity != null)
                            {
                                await _listingRepository.AddPropertyAsync(new PropertyAmenity
                                {
                                    PropertyId = property.Id,
                                    AmenityId = Guid.Parse(amenityId),
                                    Property = property,
                                    Amenity = amenity
                                });
                            }
                        }
                    }

                    if (request.RemoveAmenities?.Any() == true)
                    {
                        // Add RemovePropertyAmenity method to IListingRepository and implement it
                        foreach (var amenityId in request.RemoveAmenities)
                        {
                            await _listingRepository.RemovePropertyAmenityAsync(property.Id, Guid.Parse(amenityId));
                        }
                    }

                    await _listingRepository.SaveChangesAsync();
                    scope.Complete();

                    return new Result<Property>(true, ResultStatusCode.Success, property, "Property updated successfully");
                }
                catch (Exception ex)
                {
                    return new Result<Property>(false, ResultStatusCode.ServerError, null, $"Error updating property: {ex.Message}");
                }
            }
        }
    }
}