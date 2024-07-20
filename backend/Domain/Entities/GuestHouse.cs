using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Domain.Common;

namespace Domain.Entities
{
    public class GuestHouse : BaseEntity
    {
        [Range(1, 5)]
        public int StarRating { get; set; }
        public bool RestaurantOnSite { get; set; }
    }
}