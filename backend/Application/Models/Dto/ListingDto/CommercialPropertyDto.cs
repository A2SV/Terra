using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Models.Dto.ListingDto
{
    public class CommercialPropertyDto
    {
        public Guid PropertyId {get; set;}
        public int TotalFloors {get; set;}
        public bool ParkingSpace {get; set;}
        public int FloorNumber {get; set;}
        public DateTime CreatedAt {get; set;}
        public DateTime UpdatedAt {get; set;}
    }
}
