using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Models.Dto.ListingDto
{
    public class PropertyAmenityDto
    {
        public Guid PropertyId {get; set;}
        public Guid AmenityId {get; set;}
        public DateTime CreatedAt {get; set;}
        public DateTime UpdatedAt {get; set;}
    }
}