using System.ComponentModel.DataAnnotations;
using Application.Features.Listings.Commands.Common;
using Application.Models.ApiResult;
using Domain.Entities;
using Domain.Enums;
using MediatR;

namespace Application.Features.Listings.Commands.CreateWarehouseListing
{
    public class CreateWarehouseListingCommand : InitiateCreateListingCommand, IRequest<Result<Property>>
    {
        [Required]
        public int TotalFloors { get; set; }
        public int FloorNumber { get; set; }
        public bool ParkingSpace { get; set; }
        
        public double CeilingHeight { get; set; }
        public bool LoadingDockAvailable { get; set; }
        public bool OfficeSpaceAvailable { get; set; }
        [MinLength(1)]
        public List<WarehouseSuitableGoods> SuitableGoods { get; set; } = null!;
    }
}