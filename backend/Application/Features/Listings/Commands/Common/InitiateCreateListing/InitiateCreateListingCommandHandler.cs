using System.Transactions;
using Application.Contracts;
using Application.Models.ApiResult;
using Domain.Entities;
using MediatR;

namespace Application.Features.Listings.Commands.Common
{
    public class InitiateCreateListingCommandHandler : IRequestHandler<InitiateCreateListingCommand, Result<Property>>
    {
        private readonly IListingRepository _listingRepository;
        private readonly IUserRepository _userRepository;
        private readonly IAmenityRepository _amenityRepository;

        public InitiateCreateListingCommandHandler(IListingRepository listingRepository, IUserRepository userRepository, IAmenityRepository amenityRepository)
        {
            _listingRepository = listingRepository;
            _userRepository = userRepository;
            _amenityRepository = amenityRepository;
        }

        public async Task<Result<Property>> Handle(InitiateCreateListingCommand request, CancellationToken cancellationToken)
        {
            using (var scope = new TransactionScope(TransactionScopeAsyncFlowOption.Enabled))
            {
                try
                {
                    var listerId = request.ListerId.ToString();
                    var user = await _userRepository.GetUserByIdAsync(listerId);
                    if (user == null)
                    {
                        return new Result<Property>(false, ResultStatusCode.NotFound, null, "Lister of property not found");
                    }

                    var propertyLocation = new PropertyLocation
                    {
                        StreetName = request.StreetName,
                        HouseNumber = request.HouseNumber,
                        City = request.City,
                        Country = request.Country,
                        ZipCode = request.ZipCode,
                        Longitude = request.Longitude,
                        Latitude = request.Latitude
                    };
                    var paymentInformation = new PaymentInformation
                    {
                        Currency = request.PaymentCurrency,
                        PaymentFrequency = request.PaymentFrequency,
                        Cost = request.Price,
                        Negotiable = request.Negotiable
                    };

                    await _listingRepository.AddPropertyLocationAsync(propertyLocation);
                    await _listingRepository.AddPaymentInformationAsync(paymentInformation);

                    var property = new Property
                    {
                        PaymentInformationId = paymentInformation.Id,
                        PropertyLocationId = propertyLocation.Id,
                        ListerId = listerId,
                        Title = request.Title,
                        Description = request.Description,
                        PropertyType = request.PropertyType,
                        ListingType = request.ListingType,
                        PublishStatus = request.PropertyPublishStatus,
                        MarketStatus = request.PropertyMarketStatus,
                        PropertySize = request.PropertySize,
                        AvailableStartDate = request.AvailableStartDate,
                        AvailableEndDate = request.AvailableEndDate
                    };
                    await _listingRepository.AddPropertyAsync(property);

                    if (request.Pictures != null)
                    {
                        foreach (var picture in request.Pictures)
                        {
                            var image = new PropertyPhoto
                            {
                                PropertyId = property.Id,
                                Url = picture
                            };
                            await _listingRepository.AddPropertyAsync(image);
                        }
                    }

                    if (request.Videos != null)
                    {
                        foreach (var video in request.Videos)
                        {
                            var videoUrl = new PropertyVideo
                            {
                                PropertyId = property.Id,
                                Url = video
                            };
                            await _listingRepository.AddPropertyAsync(videoUrl);
                        }
                    }

                    if (request.Amenities != null)
                    {
                        foreach (var amenity in request.Amenities)
                        {
                            var response = await _amenityRepository.GetAllAmenitiesAsync("Name", amenity);
                            if (response != null && response.Count() > 0)
                            {
                                var propertyAmenity = new PropertyAmenity
                                {
                                    PropertyId = property.Id,
                                    Property = property,
                                    AmenityId = response[0].Id,
                                    Amenity = response[0]
                                };
                                await _amenityRepository.AddAmenityAsync(propertyAmenity);
                            }
                        }
                    }

                    if (request.Apartment != null)
                    {
                        var residentialProperty = new ResidentialProperty
                        {
                            PropertyId = property.Id,
                            FurnishedStatus = request.Apartment.FurnishedStatus,
                            NumberOfBedrooms = request.Apartment.NumberOfBedrooms,
                            NumberOfBathrooms = request.Apartment.NumberOfBathrooms,
                            NumberOfWashrooms = request.Apartment.NumberOfWashrooms,
                            NumberOfKitchens = request.Apartment.NumberOfKitchens
                        };
                    
                        await _listingRepository.AddPropertyAsync(residentialProperty);

                        var apartment = new Apartment
                        {
                            ResidentialPropertyId = residentialProperty.Id,
                            NumberOfFloorsInBuilding = request.Apartment.NumberOfFloorsInBuilding,
                            FloorNumberOfUnit = request.Apartment.FloorNumberOfUnit,
                            LaundryFacilityAvailable = request.Apartment.LaundryFacilityAvailable,
                            CleaningServiceAvailable = request.Apartment.CleaningServiceAvailable,
                            StudentFriendly = request.Apartment.StudentFriendly
                        };

                        await _listingRepository.AddPropertyAsync(apartment);
                    }
                    else if (request.EventSpace != null)
                    {
                        var commercialProperty = new CommercialProperty
                        {
                            PropertyId = property.Id,
                            TotalFloors = request.EventSpace.TotalFloors,
                            ParkingSpace = request.EventSpace.ParkingSpace,
                            FloorNumber = request.EventSpace.FloorNumber
                        };
                    
                        await _listingRepository.AddPropertyAsync(commercialProperty);

                        var eventSpace = new EventSpace
                        {
                            CommercialPropertyId = commercialProperty.Id,
                            MaximumCapacity = request.EventSpace.MaximumCapacity,
                            CateringServiceAvailable = request.EventSpace.CateringServiceAvailable,
                            AudioVisualEquipmentsAvailable = request.EventSpace.AudioVisualEquipmentsAvailable,
                            SuitableEvents = request.EventSpace.SuitableEvents
                        };

                        await _listingRepository.AddPropertyAsync(eventSpace);
                    }  
                    else if (request.GuestHouse != null)
                    {
                        var residentialProperty = new ResidentialProperty
                        {
                            PropertyId = property.Id,
                            FurnishedStatus = request.GuestHouse.FurnishedStatus,
                            NumberOfBedrooms = request.GuestHouse.NumberOfBedrooms,
                            NumberOfBathrooms = request.GuestHouse.NumberOfBathrooms,
                            NumberOfWashrooms = request.GuestHouse.NumberOfWashrooms,
                            NumberOfKitchens = request.GuestHouse.NumberOfKitchens
                        };
                    
                        await _listingRepository.AddPropertyAsync(residentialProperty);

                        var guestHouse = new GuestHouse
                        {
                            ResidentialPropertyId = residentialProperty.Id,
                            StarRating = request.GuestHouse.StarRating,
                            RestaurantOnSite = request.GuestHouse.RestaurantOnSite
                        };

                        await _listingRepository.AddPropertyAsync(guestHouse);
                    }
                    else if (request.Hotel != null)
                    {
                        var residentialProperty = new ResidentialProperty
                        {
                            PropertyId = property.Id,
                            FurnishedStatus = request.Hotel.FurnishedStatus,
                            NumberOfBedrooms = request.Hotel.NumberOfBedrooms,
                            NumberOfBathrooms = request.Hotel.NumberOfBathrooms,
                            NumberOfWashrooms = request.Hotel.NumberOfWashrooms,
                            NumberOfKitchens = request.Hotel.NumberOfKitchens
                        };
                    
                        await _listingRepository.AddPropertyAsync(residentialProperty);
                        var hotel = new Hotel
                        {
                            ResidentialPropertyId = residentialProperty.Id,
                            StarRating = request.Hotel.StarRating,
                            RestaurantOnSite = request.Hotel.RestaurantOnSite
                        };

                        await _listingRepository.AddPropertyAsync(hotel);
                    }
                    else if (request.House != null)
                    {
                        var residentialProperty = new ResidentialProperty
                        {
                            PropertyId = property.Id,
                            FurnishedStatus = request.House.FurnishedStatus,
                            NumberOfBedrooms = request.House.NumberOfBedrooms,
                            NumberOfBathrooms = request.House.NumberOfBathrooms,
                            NumberOfWashrooms = request.House.NumberOfWashrooms,
                            NumberOfKitchens = request.House.NumberOfKitchens
                        };
                    
                        await _listingRepository.AddPropertyAsync(residentialProperty);

                        var house = new House
                        {
                            ResidentialPropertyId = residentialProperty.Id,
                            NumberOfStories = request.House.NumberOfStories,
                            GarageSpace = request.House.GarageSpace,
                            StudentFriendly = request.House.StudentFriendly
                        };

                        await _listingRepository.AddPropertyAsync(house);
                    }
                    else if (request.OfficeSpace != null)
                    {
                        var commercialProperty = new CommercialProperty
                        {
                            PropertyId = property.Id,
                            TotalFloors = request.OfficeSpace.TotalFloors,
                            ParkingSpace = request.OfficeSpace.ParkingSpace,
                            FloorNumber = request.OfficeSpace.FloorNumber
                        };
                    
                        await _listingRepository.AddPropertyAsync(commercialProperty);

                        var officeSpace = new OfficeSpace
                        {
                            CommercialPropertyId = commercialProperty.Id,
                            OfficeSpaceType = request.OfficeSpace.OfficeSpaceType,
                            MeetingRoomsAvailable = request.OfficeSpace.MeetingRoomsAvailable,
                            ReceptionAreaAvailable = request.OfficeSpace.ReceptionAreaAvailable,
                        };

                        await _listingRepository.AddPropertyAsync(officeSpace);
                    }
                    else if (request.Shop != null)
                    {
                        var commercialProperty = new CommercialProperty
                        {
                            PropertyId = property.Id,
                            TotalFloors = request.Shop.TotalFloors,
                            ParkingSpace = request.Shop.ParkingSpace,
                            FloorNumber = request.Shop.FloorNumber
                        };
                    
                        await _listingRepository.AddPropertyAsync(commercialProperty);

                        var shop = new Shop
                        {
                            CommercialPropertyId = commercialProperty.Id,
                            DisplayWindowAvailable = request.Shop.DisplayWindowAvailable,
                            StorageRoomSize = request.Shop.StorageRoomSize
                        };

                        await _listingRepository.AddPropertyAsync(shop);
                    }
                    else if (request.StudentHostel != null)
                    {
                        var residentialProperty = new ResidentialProperty
                        {
                            PropertyId = property.Id,
                            FurnishedStatus = request.StudentHostel.FurnishedStatus,
                            NumberOfBedrooms = request.StudentHostel.NumberOfBedrooms,
                            NumberOfBathrooms = request.StudentHostel.NumberOfBathrooms,
                            NumberOfWashrooms = request.StudentHostel.NumberOfWashrooms,
                            NumberOfKitchens = request.StudentHostel.NumberOfKitchens
                        };
                    
                        await _listingRepository.AddPropertyAsync(residentialProperty);

                        var studentHostel = new StudentHostel
                        {
                            ResidentialPropertyId = residentialProperty.Id,
                            RoomTypes = request.StudentHostel.RoomTypes,
                            HostelType = request.StudentHostel.StudentHostelType,
                            HostelLocation = request.StudentHostel.StudentHostelLocation,
                            SharedFacilities = request.StudentHostel.SharedFacilities,
                            MealPlanAvailable = request.StudentHostel.MealPlanAvailable,
                            StudyAreaAvailable = request.StudentHostel.StudyAreaAvailable,
                            LaundryFacilityAvailable = request.StudentHostel.LaundryFacilityAvailable,
                            CleaningServiceAvailable = request.StudentHostel.CleaningServiceAvailable
                        };

                        await _listingRepository.AddPropertyAsync(studentHostel);
                    }
                    else if (request.Warehouse != null)
                    {
                        var commercialProperty = new CommercialProperty
                        {
                            PropertyId = property.Id,
                            TotalFloors = request.Warehouse.TotalFloors,
                            ParkingSpace = request.Warehouse.ParkingSpace,
                            FloorNumber = request.Warehouse.FloorNumber
                        };
                    
                        await _listingRepository.AddPropertyAsync(commercialProperty);

                        var warehouse = new Warehouse
                        {
                            CommercialPropertyId = commercialProperty.Id,
                            CeilingHeight = request.Warehouse.CeilingHeight,
                            LoadingDockAvailable = request.Warehouse.LoadingDockAvailable,
                            OfficeSpaceAvailable = request.Warehouse.OfficeSpaceAvailable,
                            SuitableGoods = request.Warehouse.SuitableGoods
                        };

                        await _listingRepository.AddPropertyAsync(warehouse);
                    }

                    await _listingRepository.SaveChangesAsync();

                    scope.Complete();

                    return new Result<Property>(true, ResultStatusCode.Success, property, "Property created successfully");
                }
                catch (Exception ex)
                {
                    return new Result<Property>(false, ResultStatusCode.ServerError, null, ex.Message);
                }
            }
        }
    }
}