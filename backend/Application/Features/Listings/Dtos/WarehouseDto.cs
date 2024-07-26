using Domain.Enums;

namespace Application.Features.Listings.Dtos
{
    public class WarehouseDto
    {
        public double CeilingHeight { get; set; }
        public bool LoadingDockAvailable { get; set; }
        public bool OfficeSpaceAvailable { get; set; }
        public List<WarehouseSuitableGoods>? SuitableGoods { get; set; }
    }
}