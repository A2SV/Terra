using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Models.Dto.ListingDto
{
    public class HouseDto
    {

        public int NumberOfStories { get; set; }
        public double GarageSpace { get; set; }
        public bool StudentFriendly { get; set; }
        public DateTime CreatedAt {get; set;}
        public DateTime UpdatedAt { get; set; }
        public Guid ResidentialPropertyId { get; set; }
    }
}