using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Models.Dto.ListingDto.GetListingByIdDto
{
    public class PropertyVideoDto
    {
        public Guid PropertyId { get; set; }
        public string Url { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }
}