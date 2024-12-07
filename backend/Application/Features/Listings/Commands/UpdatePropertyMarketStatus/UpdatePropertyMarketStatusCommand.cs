using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.UpdatePropertyMarketStatus;

public class UpdatePropertyMarketStatusCommand: IRequest<bool>
{
    public Guid PropertyId { get; set; }
    public PropertyMarketStatus NewStatus { get; set; } // Enum to set the new status
}
