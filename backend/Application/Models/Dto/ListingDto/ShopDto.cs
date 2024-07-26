using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Models.Dto.ListingDto
{
    public class ShopDto
    {
        public bool DisplayWindowAvailable { get; set; }
        public double StorageRoomSize { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public Guid CommercialPropertyId { get; set; }
    }
}