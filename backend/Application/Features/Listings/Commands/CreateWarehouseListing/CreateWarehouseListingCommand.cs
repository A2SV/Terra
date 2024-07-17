using System.ComponentModel.DataAnnotations;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateWarehouseListing
{
    public class CreateWarehouseListingCommand : IRequest<Result<Warehouse>>
    {
        [Required]
        public Guid CommercialPropertyId { get; set; }
        public double CeilingHeight { get; set; }
        public bool LoadingDockAvailable { get; set; }
        public bool OfficeSpaceAvailable { get; set; }
        [MinLength(1)]
        public List<WarehouseSuitableGoods> SuitableGoods { get; set; } = null!;
    }
}