using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class Shop : BaseEntity
    {
        [ForeignKey("Property")]
        public Guid PropertyId { get; set; }
        public bool DisplayWindowAvailable { get; set; }
        public double StorageRoomSize { get; set; }

        public required CommercialProperty Property { get; set; }
    }
}