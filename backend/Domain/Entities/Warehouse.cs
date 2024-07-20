using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;
using Domain.Enums;

namespace Domain.Entities
{
    public class Warehouse : BaseEntity
    {
        public double CeilingHeight { get; set; }
        public bool LoadingDockAvailable { get; set; }
        public bool OfficeSpaceAvailable { get; set; }
        [MinLength(1)]
        public List<WarehouseSuitableGoods> SuitableGoods { get; set; } = new();
    }
}