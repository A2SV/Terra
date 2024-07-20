using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class CommercialProperty : BaseEntity
    {
        [ForeignKey("SubTypeId")]
        public Guid SubTypeId { get; set; }
        [Range(1, int.MaxValue)]
        public int TotalFloors { get; set; }
        public bool ParkingSpace { get; set; }
        public int FloorNumber { get; set; }
    }
}