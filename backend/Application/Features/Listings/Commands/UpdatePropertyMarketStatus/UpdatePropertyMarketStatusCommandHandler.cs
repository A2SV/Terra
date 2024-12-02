using Application.Contracts;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.UpdatePropertyMarketStatus;

public class UpdatePropertyMarketStatusCommandHandler: IRequestHandler<UpdatePropertyMarketStatusCommand, bool>
{
    private readonly IListingRepository _listingRepository;

    public UpdatePropertyMarketStatusCommandHandler(IListingRepository listingRepository)
    {
        _listingRepository = listingRepository;
    }

    public async Task<bool> Handle(UpdatePropertyMarketStatusCommand request, CancellationToken cancellationToken)
    {
        // Fetch the property by ID
        var property = await _listingRepository.GetPropertyByIdAsync(request.PropertyId);
        if (property == null)
            throw new KeyNotFoundException("Property not found.");
        
        ValidateStatusTransition(property.MarketStatus, request.NewStatus);
        
        property.MarketStatus = request.NewStatus;
        
        await _listingRepository.SaveChangesAsync();

        return true;
    }

    private void ValidateStatusTransition(PropertyMarketStatus currentStatus, PropertyMarketStatus newStatus)
    {
        if (currentStatus == newStatus)
        {
            return;
            // ($"No status change needed. Current status: {currentStatus}"); // No change needed
        }

        switch (currentStatus)
        {
            case PropertyMarketStatus.Unavailable:
                if (newStatus != PropertyMarketStatus.Available && 
                    newStatus != PropertyMarketStatus.Sold)
                {
                    throw new InvalidOperationException(
                        $"Transition from {currentStatus} to {newStatus} is invalid. " +
                        "Unavailable properties can only be marked as Available or Sold."
                    );
                }
                break;

            case PropertyMarketStatus.Available:
                if (newStatus != PropertyMarketStatus.Rented && 
                    newStatus != PropertyMarketStatus.Sold && 
                    newStatus != PropertyMarketStatus.Unavailable)
                {
                    throw new InvalidOperationException(
                        $"Transition from {currentStatus} to {newStatus} is invalid. " +
                        "Available properties can only be Rented, Sold, or marked as Unavailable."
                    );
                }
                break;

            case PropertyMarketStatus.Rented:
                if (newStatus != PropertyMarketStatus.Available)
                {
                    throw new InvalidOperationException(
                        $"Transition from {currentStatus} to {newStatus} is invalid. " +
                        "Rented properties can only be marked as Available."
                    );
                }
                break;

            case PropertyMarketStatus.Sold:
                throw new InvalidOperationException(
                    $"Transition from {currentStatus} to {newStatus} is invalid. " +
                    "Sold properties cannot change status."
                );

            default:
                throw new InvalidOperationException($"Unknown property status: {currentStatus}");
        }

        // Console.WriteLine($"Status transition from {currentStatus} to {newStatus} is valid.");
    }

}
