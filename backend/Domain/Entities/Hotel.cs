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
        public required int StarRating { get; set; }
        public required bool RestaurantOnSite { get; set; }

        public required Property Property { get; set; }
    }
}