using System.Linq.Expressions;
using Application.Contracts;
using Application.Features.Listings.Dtos;
using Domain.Entities;
using Domain.Enums;
using Domain.Models;
using Microsoft.EntityFrameworkCore;
using Persistence.Configurations;

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
        
        public async Task<Property?> GetPropertyByIdAsync(Guid propertyId)
        {
            return await _context.Properties
                .FirstOrDefaultAsync(p => p.Id == propertyId);
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

        public async Task<PaginatedList<PropertyDto>> GetAllListings(int pageIndex, int pageSize)
        {
            IQueryable<Property> query = _context.Properties
                .Include(p => p.Lister)
                .Include(p => p.PropertyLocation)
                .Include(p => p.PaymentInformation);
            
            var count = await query.CountAsync();

            var properties = await query
                .OrderBy(p => p.CreatedAt)
                .Skip((pageIndex - 1) * pageSize)
                .Take(pageSize)
                .ToListAsync();

            var totalPages = (int)Math.Ceiling(count / (double)pageSize);

            var propertyDto = new List<PropertyDto>();
            foreach (var property in properties)
            {
                var propertyPhotos = await _context.PropertyPhotos.Where(p => p.PropertyId == property.Id).ToListAsync();
                
                var propertyPhotosDto = new List<PropertyPhotoDto>();

                foreach (var photo in propertyPhotos)
                {
                    propertyPhotosDto.Add(new PropertyPhotoDto
                    {
                        Id = photo.Id,
                        Url = photo.Url
                    });
                }
                var propertyVideos = await _context.PropertyVideos.Where(p => p.PropertyId == property.Id).ToListAsync();

                var propertyVideosDto = new List<PropertyVideoDto>();

                foreach (var video in propertyVideos)
                {
                    propertyVideosDto.Add(new PropertyVideoDto
                    {
                        Id = video.Id,
                        Url = video.Url
                    });
                }
                ResidentialOrCommercial residentialOrCommercial = ResidentialOrCommercial.Residential;
                if (property.PropertyType > PropertyType.GuestHouse)
                {
                    residentialOrCommercial = ResidentialOrCommercial.Commercial;
                }
                propertyDto.Add(new PropertyDto
                {
                    Id = property.Id,
                    ListerId = property.ListerId,
                    PaymentInformationId = property.PaymentInformationId,
                    PropertyLocationId = property.PropertyLocationId,
                    Title = property.Title,
                    Description = property.Description,
                    PropertyType = residentialOrCommercial,
                    PropertySubType = property.PropertyType,
                    PublishStatus = property.PublishStatus,
                    MarketStatus = property.MarketStatus,
                    ListingType = property.ListingType,
                    PropertySize = property.PropertySize,
                    AvailableStartDate = property.AvailableStartDate,
                    AvailableEndDate = property.AvailableEndDate,
                    Lister = property.Lister,
                    PaymentInformation = property.PaymentInformation,
                    PropertyLocation = property.PropertyLocation,
                    PropertyPhotos = propertyPhotosDto,
                    PropertyVideos = propertyVideosDto
                });
            }


            return new PaginatedList<PropertyDto>(propertyDto, pageIndex, totalPages);
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
                .Include(p => p.PropertyLocation);
                

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


            return  new PaginatedList<Property>(properties, pageIndex, totalPages);
            }

        public async Task<DetailedPropertyDto?> GetListingByIdAsync(Guid id)
        {
            var property = await _context.Properties
                .Include(p => p.PaymentInformation)
                .Include(p => p.PropertyLocation)
                .Include(p => p.Lister)
                .FirstOrDefaultAsync(p => p.Id == id);

                

            if (property == null)
                return null;

            var propertyPhotos = await _context.PropertyPhotos.Where(p => p.PropertyId == id).ToListAsync();

            var propertyPhotosDto = new List<PropertyPhotoDto>();

            foreach (var photo in propertyPhotos)
            {
                propertyPhotosDto.Add(new PropertyPhotoDto
                {
                    Id = photo.Id,
                    Url = photo.Url
                });
            }

            var propertyVideos = await _context.PropertyVideos.Where(p => p.PropertyId == property.Id).ToListAsync();

            var propertyVideosDto = new List<PropertyVideoDto>();

            foreach (var video in propertyVideos)
            {
                propertyVideosDto.Add(new PropertyVideoDto
                {
                    Id = video.Id,
                    Url = video.Url
                });
            }

            ResidentialOrCommercial residentialOrCommercial = ResidentialOrCommercial.Residential;
            if (property.PropertyType > PropertyType.GuestHouse)
            {
                residentialOrCommercial = ResidentialOrCommercial.Commercial;
            }

            ResidentialProperty? residentialProperty = await _context.ResidentialProperties.FirstOrDefaultAsync(p => p.PropertyId == id);

            Apartment? apartment = null;
            GuestHouse? guestHouse = null;
            House? house = null;
            Hotel? hotel = null;
            StudentHostel? studentHostel = null;

            CommercialProperty? commercialProperty = await _context.CommercialProperties.FirstOrDefaultAsync(p => p.PropertyId == id);

            EventSpace? eventSpace = null;
            OfficeSpace? officeSpace = null;
            Shop? shop = null;
            Warehouse? warehouse = null;


            if (residentialProperty != null)
            {
                apartment = await _context.Apartments.FirstOrDefaultAsync(a => a.ResidentialPropertyId == residentialProperty.Id);
                guestHouse = await _context.GuestHouses.FirstOrDefaultAsync(a => a.ResidentialPropertyId == residentialProperty.Id);
                house = await _context.Houses.FirstOrDefaultAsync(a => a.ResidentialPropertyId == residentialProperty.Id);
                hotel = await _context.Hotels.FirstOrDefaultAsync(a => a.ResidentialPropertyId == residentialProperty.Id);
                studentHostel = await _context.StudentHostels.FirstOrDefaultAsync(a => a.ResidentialPropertyId == residentialProperty.Id);
            }
            else if (commercialProperty != null)
            {
                eventSpace = await _context.EventSpaces.FirstOrDefaultAsync(a => a.CommercialPropertyId == commercialProperty.Id);
                officeSpace = await _context.OfficeSpaces.FirstOrDefaultAsync(a => a.CommercialPropertyId == commercialProperty.Id);
                shop = await _context.Shops.FirstOrDefaultAsync(a => a.CommercialPropertyId == commercialProperty.Id);
                warehouse = await _context.Warehouses.FirstOrDefaultAsync(a => a.CommercialPropertyId == commercialProperty.Id);
            }

            var propertyAmenities = await _context.PropertyAmenities
                .Where(p => p.PropertyId == id)
                .Include(pa => pa.Amenity)
                .Select(pa => new AmenityDto
                {
                    AmenityName = pa.Amenity.Name
                })
                .AsNoTracking()
                .ToListAsync();

            var residentialPropertyDto = residentialProperty != null ? new ResidentialPropertyDto
            {
                FurnishedStatus = residentialProperty.FurnishedStatus,
                NumberOfBedrooms = residentialProperty.NumberOfBedrooms,
                NumberOfBathrooms = residentialProperty.NumberOfBathrooms,
                NumberOfWashrooms = residentialProperty.NumberOfWashrooms,
                NumberOfKitchens = residentialProperty.NumberOfKitchens,
                ApartmentDto = apartment != null ? new ApartmentDto
                {
                    NumberOfFloorsInBuilding = apartment.NumberOfFloorsInBuilding,
                    FloorNumberOfUnit = apartment.FloorNumberOfUnit,
                    LaundryFacilityAvailable = apartment.LaundryFacilityAvailable,
                    CleaningServiceAvailable = apartment.CleaningServiceAvailable,
                    StudentFriendly = apartment.StudentFriendly
                } : null,
                GuestHouseDto = guestHouse != null ? new GuestHouseDto
                {
                    StarRating = guestHouse.StarRating,
                    RestaurantOnSite = guestHouse.RestaurantOnSite
                } : null,
                HotelDto = hotel != null ? new HotelDto
                {
                    StarRating = hotel.StarRating,
                    RestaurantOnSite = hotel.RestaurantOnSite
                } : null,
                HouseDto = house != null ? new HouseDto
                {
                    NumberOfStories = house.NumberOfStories,
                    GarageSpace = house.GarageSpace,
                    StudentFriendly = house.StudentFriendly
                } : null,
                StudentHostelDto = studentHostel != null ? new StudentHostelDto
                {
                    RoomTypes = studentHostel.RoomTypes,
                    HostelType = studentHostel.HostelType,
                    HostelLocation = studentHostel.HostelLocation,
                    SharedFacilities = studentHostel.SharedFacilities,
                    MealPlanAvailable = studentHostel.MealPlanAvailable,
                    StudyAreaAvailable = studentHostel.StudyAreaAvailable,
                    LaundryFacilityAvailable = studentHostel.LaundryFacilityAvailable,
                    CleaningServiceAvailable = studentHostel.CleaningServiceAvailable
                } : null
            } : null;

            var commercialPropertyDto = commercialProperty != null ? new CommercialPropertyDto
            {
                TotalFloors = commercialProperty.TotalFloors,
                ParkingSpace = commercialProperty.ParkingSpace,
                FloorNumber = commercialProperty.FloorNumber,
                
                EventSpaceDto = eventSpace != null ? new EventSpaceDto
                {
                    MaximumCapacity = eventSpace.MaximumCapacity,
                    CateringServiceAvailable = eventSpace.CateringServiceAvailable,
                    AudioVisualEquipmentsAvailable = eventSpace.AudioVisualEquipmentsAvailable,
                    SuitableEvents = eventSpace.SuitableEvents
                } : null,
                OfficeSpaceDto = officeSpace != null ? new OfficeSpaceDto
                {
                    OfficeSpaceType = officeSpace.OfficeSpaceType,
                    MeetingRoomsAvailable = officeSpace.MeetingRoomsAvailable,
                    ReceptionAreaAvailable = officeSpace.ReceptionAreaAvailable
                } : null,
                ShopDto = shop != null ? new ShopDto
                {
                    DisplayWindowAvailable = shop.DisplayWindowAvailable,
                    StorageRoomSize = shop.StorageRoomSize
                } : null,
                WarehouseDto = warehouse != null ? new WarehouseDto
                {
                    CeilingHeight = warehouse.CeilingHeight,
                    LoadingDockAvailable = warehouse.LoadingDockAvailable,
                    OfficeSpaceAvailable = warehouse.OfficeSpaceAvailable,
                    SuitableGoods = warehouse.SuitableGoods
                } : null
            } : null;

            return new DetailedPropertyDto
            {
                Id = property.Id,
                ListerId = property.ListerId,
                PaymentInformationId = property.PaymentInformationId,
                PropertyLocationId = property.PropertyLocationId,
                Title = property.Title,
                Description = property.Description,
                PropertyType = residentialOrCommercial,
                PropertySubType = property.PropertyType,
                PublishStatus = property.PublishStatus,
                MarketStatus = property.MarketStatus,
                ListingType = property.ListingType,
                PropertySize = property.PropertySize,
                AvailableStartDate = property.AvailableStartDate,
                AvailableEndDate = property.AvailableEndDate,
                Lister = property.Lister,
                PaymentInformation = property.PaymentInformation,
                PropertyLocation = property.PropertyLocation,
                PropertyPhotos = propertyPhotosDto,
                PropertyVideos = propertyVideosDto,
                PropertyAmenities = propertyAmenities,
                ResidentialProperty = residentialPropertyDto,
                CommercialProperty = commercialPropertyDto
            };

        }

    }
}

