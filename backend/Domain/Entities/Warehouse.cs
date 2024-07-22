using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;
using Domain.Enums;

namespace Domain.Entities
{
    public class Warehouse : BaseEntity
    {
        [ForeignKey(nameof(CommercialProperty))]
        public Guid CommercialPropertyId { get; set; }
        public double CeilingHeight { get; set; }
        public bool LoadingDockAvailable { get; set; }
        public bool OfficeSpaceAvailable { get; set; }
        [MinLength(1)]
        public List<WarehouseSuitableGoods> SuitableGoods { get; set; } = new();

        public CommercialProperty CommercialProperty { get; set; } = null!;
    }
}