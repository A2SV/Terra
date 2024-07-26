using Application.Contracts;
using Domain.Entities;
using Domain.Enums;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Persistence.Configurations;
using Application.Models.Dto.ListingDto;
using Application.Models.Dto.ListingDto.GetListingDto;


namespace Persistence.Repositories
{
    public class ListingRepository : IListingRepository
    {
        private readonly PropertyDbContext _context;
        public ListingRepository(PropertyDbContext context)
        {
            _context = context;
        }

        public async Task SaveChangesAsync()
        {
            await _context.SaveChangesAsync(CancellationToken.None);
        }

        public async Task<TEntity?> AddPropertyAsync<TEntity>(TEntity property) where TEntity : class
        {
            var result = await _context.Set<TEntity>().AddAsync(property);
            if (result == null) return null;
            return property;
        }

        public async Task<PropertyLocation?> AddPropertyLocationAsync(PropertyLocation propertyLocation)
        {
            var result = await _context.PropertyLocations.AddAsync(propertyLocation);
            if (result == null) return null;
            return propertyLocation;
        }

        public async Task<PaymentInformation?> AddPaymentInformationAsync(PaymentInformation paymentInformation)
        {
            var result = await _context.PaymentInformations.AddAsync(paymentInformation);
            if (result == null) return null;
            return paymentInformation;
        }

        public async Task<PaginatedList<Property>> GetAllListings(int pageIndex, int pageSize)
        {
            

            IQueryable<Property> query = _context.Properties;
            
            
            var count = await query.CountAsync();


            var properties = await query
                .OrderBy(p => p.CreatedAt)
                .Skip((pageIndex - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            var totalPages = (int)Math.Ceiling(count / (double)pageSize);


            return new PaginatedList<Property>(properties, pageIndex, totalPages);
        }


        public async Task<PaginatedList<Property>> Filter(
            int pageIndex, int pageSize,
            string? listingType, string? propertyType,
            string? subType, int? minPrice,
            int? maxPrice, string? paymentFrequency,
            int? minPropertySize, int? maxPropertySize,
            List<string>? amenities
                )
        {

            IQueryable<Property> query = _context.Properties
                .Include(p => p.PaymentInformation)
                .Include(p => p.PropertyLocation)
                .Include(p => p.ResidentialProperty)
                .Include(p => p.CommercialProperty);
                




            if (!string.IsNullOrEmpty(listingType) && Enum.TryParse<PropertyListingType>(listingType, out var parsedListingType))
            {
                query = query.Where(x => x.ListingType == parsedListingType);
            }

            if (!string.IsNullOrEmpty(propertyType))
                if (propertyType == "Residential")
                {
                    query = query.Where(p => (int)p.PropertyType < 5);
                }
                else
                {
                    query = query.Where(p => (int)p.PropertyType >5);
                }


            if (!string.IsNullOrEmpty(subType) && Enum.TryParse<PropertyType>(subType, out var parsedSubType))
            {
                query = query.Where(x => x.PropertyType == parsedSubType);

            }

            if (minPrice.HasValue || maxPrice.HasValue)
            {
                query = query.
                    Include(p => p.PaymentInformation)
                    .Where(x => (!minPrice.HasValue || x.PaymentInformation.Cost >= minPrice.Value) &&
                                (!maxPrice.HasValue || x.PaymentInformation.Cost <= maxPrice.Value));
            }



            if (!string.IsNullOrEmpty(subType) && Enum.TryParse<PaymentFrequency>(paymentFrequency, out var parsedPaymentFrequency))
            {
                query = query.
                        Include(p => p.PaymentInformation)
                        .Where(x => x.PaymentInformation.PaymentFrequency == parsedPaymentFrequency);


            }


            if (minPropertySize.HasValue || maxPropertySize.HasValue)
            {
                query = query
                    .Where(x => (!minPropertySize.HasValue || x.PropertySize >= minPropertySize.Value) &&
                                (!maxPrice.HasValue || x.PropertySize <= maxPrice.Value));
            }


            if (amenities != null)
            {
                query = query.Join(_context.PropertyAmenities,
                    property => property.Id,
                    propertyAmenity => propertyAmenity.PropertyId,
                    (property, propertyAmenity) => new { Property = property, PropertyAmenity = propertyAmenity })
                    .Where(x => (amenities.Contains(x.PropertyAmenity.Amenity.Name)))
                    .Select(x => x.Property);
            }

            var count = await query.CountAsync();


            var properties = await query
                .OrderBy(p => p.CreatedAt)
                .Skip((pageIndex - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            var totalPages = (int)Math.Ceiling(count / (double)pageSize);


            return new PaginatedList<Property>(properties, pageIndex, totalPages);
        }

        public async Task<GetListingDto> GetListingByIdAsync(Guid id)
        {
            var property = await _context.Properties
                .Include(p => p.PaymentInformation)
                .Include(p => p.PropertyLocation)
                .AsNoTracking()
                .FirstOrDefaultAsync(p => p.Id == id);

            if (property == null)
                return null;

            var propertyPhotos = await _context.PropertyPhotos
                .Where(pp => pp.PropertyId == id)
                .Select(pp => new PropertyPhotoDto
                {
                    Url = pp.Url,
                    CreatedAt = pp.CreatedAt,
                    UpdatedAt = pp.UpdatedAt,
                    PropertyId = pp.PropertyId
                })
                .AsNoTracking()
                .ToListAsync();

            var propertyVideos = await _context.PropertyVideos
                .Where(pv => pv.PropertyId == id)
                .Select(pv => new PropertyVideoDto
                {
                    Url = pv.Url,
                    CreatedAt = pv.CreatedAt,
                    UpdatedAt = pv.UpdatedAt,
                    PropertyId = pv.PropertyId
                })
                .AsNoTracking()
                .ToListAsync();

            var residentialProperties = await _context.ResidentialProperties
                .AsNoTracking()
                .FirstOrDefaultAsync(rp => rp.PropertyId == id);

            var commercialProperties = await _context.CommercialProperties
                .AsNoTracking()
                .FirstOrDefaultAsync(cp => cp.PropertyId == id);

            var propertyAmenities = await _context.PropertyAmenities
                .Where(pa => pa.PropertyId == id)
                .Include(pa => pa.Amenity)
                .Select(pa => new AmenityDto
                {
                    AmenityName = pa.Amenity.Name,
                    CreatedAt = pa.Amenity.CreatedAt,
                    UpdatedAt = pa.Amenity.UpdatedAt
                })
                .AsNoTracking()
                .ToListAsync();

            var residentialPropertyDetailsDto = residentialProperties != null ? new ResidentialPropertyDetailsDto
            {
                PropertyId = residentialProperties.PropertyId,
                FurnishedStatus = residentialProperties.FurnishedStatus,
                NumberOfBedrooms = residentialProperties.NumberOfBedrooms,
                NumberOfBathrooms = residentialProperties.NumberOfBathrooms,
                NumberOfWashrooms = residentialProperties.NumberOfWashrooms,
                NumberOfKitchens = residentialProperties.NumberOfKitchens,
                CreatedAt = residentialProperties.CreatedAt,
                UpdatedAt = residentialProperties.UpdatedAt,
                Apartments = await _context.Apartments
                    .Where(a => a.ResidentialPropertyId == residentialProperties.Id)
                    .Select(a => new ApartmentDto
                    {
                        ResidentialPropertyId = a.ResidentialPropertyId,
                        NumberOfFloorsInBuilding = a.NumberOfFloorsInBuilding,
                        FloorNumberOfUnit = a.FloorNumberOfUnit,
                        LaundryFacilityAvailable = a.LaundryFacilityAvailable,
                        CleaningServiceAvailable = a.CleaningServiceAvailable,
                        StudentFriendly = a.StudentFriendly,
                        CreatedAt = a.CreatedAt,
                        UpdatedAt = a.UpdatedAt
                    }).ToListAsync(),
                GuestHouses = await _context.GuestHouses
                    .Where(gh => gh.ResidentialPropertyId == residentialProperties.Id)
                    .Select(gh => new GuestHouseDto
                    {
                        ResidentialPropertyId = gh.ResidentialPropertyId,
                        StarRating = gh.StarRating,
                        RestaurantOnSite = gh.RestaurantOnSite,
                        CreatedAt = gh.CreatedAt,
                        UpdatedAt = gh.UpdatedAt
                    }).ToListAsync(),
                Hotels = await _context.Hotels
                    .Where(h => h.ResidentialPropertyId == residentialProperties.Id)
                    .Select(h => new HotelDto
                    {
                        ResidentialPropertyId = h.ResidentialPropertyId,
                        StarRating = h.StarRating,
                        RestaurantOnSite = h.RestaurantOnSite,
                        CreatedAt = h.CreatedAt,
                        UpdatedAt = h.UpdatedAt
                    }).ToListAsync(),
                Houses = await _context.Houses
                    .Where(h => h.ResidentialPropertyId == residentialProperties.Id)
                    .Select(h => new HouseDto
                    {
                        ResidentialPropertyId = h.ResidentialPropertyId,
                        NumberOfStories = h.NumberOfStories,
                        GarageSpace = h.GarageSpace,
                        StudentFriendly = h.StudentFriendly,
                        CreatedAt = h.CreatedAt,
                        UpdatedAt = h.UpdatedAt
                    }).ToListAsync(),
                StudentHostels = await _context.StudentHostels
                    .Where(sh => sh.ResidentialPropertyId == residentialProperties.Id)
                    .Select(sh => new StudentHostelDto
                    {
                        ResidentialPropertyId = sh.ResidentialPropertyId,
                        RoomTypes = sh.RoomTypes,
                        HostelType = (int)sh.HostelType,
                        HostelLocation = (int)sh.HostelLocation,
                        SharedFacilities = sh.SharedFacilities,
                        MealPlanAvailable = sh.MealPlanAvailable,
                        StudyAreaAvailable = sh.StudyAreaAvailable,
                        LaundryFacilityAvailable = sh.LaundryFacilityAvailable,
                        CleaningServiceAvailable = sh.CleaningServiceAvailable,
                        CreatedAt = sh.CreatedAt,
                        UpdatedAt = sh.UpdatedAt
                    }).ToListAsync()
            } : null;

            var commercialPropertyDetailsDto = commercialProperties != null ? new CommercialPropertyDetailsDto
            {
                PropertyId = commercialProperties.PropertyId,
                TotalFloors = commercialProperties.TotalFloors,
                ParkingSpace = commercialProperties.ParkingSpace,
                FloorNumber = commercialProperties.FloorNumber,
                CreatedAt = commercialProperties.CreatedAt,
                UpdatedAt = commercialProperties.UpdatedAt,
                EventSpaces = await _context.EventSpaces
                    .Where(es => es.CommercialPropertyId == commercialProperties.Id)
                    .Select(es => new EventSpaceDto
                    {
                        CommercialPropertyId = es.CommercialPropertyId,
                        MaximumCapacity = es.MaximumCapacity,
                        CateringServiceAvailable = es.CateringServiceAvailable,
                        AudioVisualEquipmentsAvailable = es.AudioVisualEquipmentsAvailable,
                        SuitableEvents = es.SuitableEvents,
                        CreatedAt = es.CreatedAt,
                        UpdatedAt = es.UpdatedAt
                    }).ToListAsync(),
                OfficeSpaces = await _context.OfficeSpaces
                    .Where(os => os.CommercialPropertyId == commercialProperties.Id)
                    .Select(os => new OfficeSpaceDto
                    {
                        CommercialPropertyId = os.CommercialPropertyId,
                        OfficeSpaceType = (int)os.OfficeSpaceType,
                        MeetingRoomsAvailable = os.MeetingRoomsAvailable,
                        ReceptionAreaAvailable = os.ReceptionAreaAvailable,
                        CreatedAt = os.CreatedAt,
                        UpdatedAt = os.UpdatedAt
                    }).ToListAsync(),
                Shops = await _context.Shops
                    .Where(s => s.CommercialPropertyId == commercialProperties.Id)
                    .Select(s => new ShopDto
                    {
                        CommercialPropertyId = s.CommercialPropertyId,
                        DisplayWindowAvailable = s.DisplayWindowAvailable,
                        StorageRoomSize = s.StorageRoomSize,
                        CreatedAt = s.CreatedAt,
                        UpdatedAt = s.UpdatedAt
                    }).ToListAsync(),
                Warehouses = await _context.Warehouses
                    .Where(w => w.CommercialPropertyId == commercialProperties.Id)
                    .Select(w => new WarehouseDto
                    {
                        CommercialPropertyId = w.CommercialPropertyId,
                        CeilingHeight = w.CeilingHeight,
                        LoadingDockAvailable = w.LoadingDockAvailable,
                        OfficeSpaceAvailable = w.OfficeSpaceAvailable,
                        SuitableGoods = w.SuitableGoods,
                        CreatedAt = w.CreatedAt,
                        UpdatedAt = w.UpdatedAt
                    }).ToListAsync()
            } : null;

            return new GetListingDto
            {
                Property = property,
                ResidentialProperty = residentialPropertyDetailsDto,
                CommercialProperty = commercialPropertyDetailsDto,
                PropertyAmenity = propertyAmenities,
                PropertyPhotos = propertyPhotos,
                PropertyVideos = propertyVideos
            };
        }

    }
}

