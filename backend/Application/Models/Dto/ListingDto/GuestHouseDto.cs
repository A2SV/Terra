using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Models.Dto.ListingDto
{
    public class GuestHouseDto
    {
        public int StarRating { get; set; }
        public bool RestaurantOnSite { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public Guid ResidentialPropertyId { get; set; }
    }
}