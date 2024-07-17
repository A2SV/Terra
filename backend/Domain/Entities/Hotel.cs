using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class Hotel : BaseEntity
    {
        [ForeignKey("Property")]
        public Guid PropertyId { get; set; }
        [Range(1, 5)]
        public int StarRating { get; set; }
        public bool RestaurantOnSite { get; set; }

        public required ResidentialProperty Property { get; set; }
    }
}