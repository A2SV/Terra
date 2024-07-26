using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Application.Models.Dto.ListingDto
{
    public class ResidentialPropertyDto
    {
        public Guid PropertyId {get; set;}
        public bool FurnishedStatus {get; set;}
        public int NumberOfBedrooms {get; set;}
        public int NumberOfBathrooms {get; set;}
        public int NumberOfWashrooms {get; set;}
        public int NumberOfKitchens {get; set;}
        public DateTime CreatedAt {get; set;}
        public DateTime UpdatedAt {get; set;}
    }
}