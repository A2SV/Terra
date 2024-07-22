using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class GuestHouse : BaseEntity
    {
        [ForeignKey(nameof(ResidentialProperty))]
        public Guid ResidentialPropertyId { get; set; }
        [Range(1, 5)]
        public int StarRating { get; set; }
        public bool RestaurantOnSite { get; set; }

        public ResidentialProperty ResidentialProperty { get; set; } = null!;
    }
}