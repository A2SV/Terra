"use client";
import React, { useState } from "react";
import ResidentialSpecific from "./Features/ResidentialSubtype/ResidentialSpecific";
import CommercialSpecific from "./Features/CommercialSubtype/CommercialSpecific";
import ImageSelector from "./ImageSelector";
import LocationForm from "./LocationForm";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus, faCheck } from "@fortawesome/free-solid-svg-icons";
import {
  residentialFeatureComponents,
  commercialFeatureComponents,
} from "./Features/FeatureMapping";
import SubmitButton from "./SubmitButton";
import ErrorMessage from "../Common/Reusable/ErrorMessage";
import SuccessMessage from "../Common/Reusable/SuccessMessage";

const typeOptions: { [key: string]: string[] } = {
  Residential: ["Apartment", "House", "Student's Hostels", "Hotel", "Guest House"],
  Commercial: ["Office Space", "Shop", "Warehouse", "Event Space"],
};

const priceFrequencyOptions: { [key: string]: string[] } = {
  Residential: ["Per Month", "Per Year"],
  "Student's Hostels": ["Per Semester", "Per Academic Year"],
  "Hotel/Guest House": ["Per Night", "Per Week"],
  Commercial: ["Per Month", "Per Year"],
};

const GeneralInfo: React.FC = () => {
  const [formData, setFormData] = useState({
    listingName: "",
    category: "",
    type: "",
    residentialSubtype: "",
    commercialSubtype: "",
    landSize: "",
    price: 0,
    frequency: "",
    negotiable: "",
    listingDescription: "",
    selectedAmenities: [],
    features: {
      numFloors: 0,
      floorNumber: 0,
      studentFriendly: false,
      laundryFacility: false,
      cleaningService: false,
      openPlan: false,
      individualOffices: false,
      meetingRooms: false,
      receptionArea: false,
      numStories: 0,
      garageSpaces: false,
      starRating: 0,
      restaurantOnSite: "",
      loadingDocks: "",
      officeSpaceIncluded: "",
      goodsSuitableForStorage: "",
      displayWindow: "",
      storageRoom: "",
      maximumCapacity: 0,
      eventTypes: [],
      cateringFacilities: "",
      audioVisualEquipment: "",
      selectedRoomTypes: [],
      hostelType: "Male only",
      hostelLocation: "On campus",
      furnishedStatus: false,
      numberOfBedrooms: 0,
      numberOfBathrooms: 0,
      numberOfWashrooms: 0,
      numberOfKitchens: 0,
      ceilingHeight: 0,
      parkingSpaces: 0,
      suitableGoods: [],
      officeType: "Open Plan",
      meetingRoomsAvailable: "Yes",
      receptionAreaAvailable: "Yes",
      totalFloors: 0,
      studentHostelType: "",
      studentHostelLocation: "",
      sharedFacilities: false,
      mealPlanAvailable: false,
      studyAreaAvailable: false,
      laundryFacilityAvailable: false,
      cleaningServiceAvailable: false,
    },
    images: [],
    location: {
      address: "",
      coordinates: {
        lat: 0,
        lng: 0,
      },
      video: "",
    },
  });

  const [type, setType] = useState<string>("Residential");
  const [category, setCategory] = useState<string>("Rent");
  const [residentialSubtype, setResidentialSubtype] = useState<string>("Apartment");
  const [commercialSubtype, setCommercialSubtype] = useState<string>("Office Space");
  const [selectedAmenities, setSelectedAmenities] = useState<string[]>([]);
  const [searchQuery, setSearchQuery] = useState<string>("");
  const [successMessage, setSuccessMessage] = useState<string>("");
  const [error, setError] = useState<string>("");

  const amenities = [
    "Air Conditioning",
    "Heating",
    "Balcony",
    "Deck",
    "Patio",
    "Garden",
    "Garage",
    "Parking Space",
    "Security System",
    "Gated Community",
    "Elevator",
    "High-Speed Internet",
    "Cable TV",
    "Wi-Fi",
    "Study Room",
    "Library",
    "Cafe",
    "Fireplace",
    "Furnished",
    "Unfurnished",
    "Wheelchair Accessible",
    "Pet-Friendly",
    "Non-Smoking",
    "Utilities Included",
    "Swimming Pool",
    "Washrooms",
    "Bathrooms",
    "Kitchen",
    "Toilet Facilities",
    "Bedrooms",
    "Gym",
    "Spa",
    "Sauna",
    "Playground",
    "Tennis Court",
    "Basketball Court",
    "Clubhouse",
    "Laundry Room",
    "In-Unit Washer/Dryer",
    "Shared Laundry Facilities",
    "Storage Space",
    "Walk-In Closet",
    "Dishwasher",
    "Microwave",
    "Refrigerator",
    "Stove/Oven",
    "Conference Room",
    "Meeting Room",
    "Reception Area",
    "Break Room",
    "Kitchenette",
    "On-Site Management",
    "Business Center",
    "Loading Dock",
    "Shipping Area",
    "24/7 Access",
    "Printing Facilities",
    "Copying Facilities",
    "Mail Room",
    "Server Room",
    "Backup Power Supply",
    "CCTV Surveillance",
    "Concierge Service",
    "Cleaning Service",
    "Maintenance Service",
    "Guest Parking",
    "Rooftop Access",
    "Community Events",
    "Public Transport Access",
    "Bike Storage",
    "Recycling Facilities",
    "Electric Vehicle Charging Station",
    "Smart Home Technology",
    "Solar Panels",
    "Green Building Certification",
    "Walking Trails",
    "Scenic View",
    "Waterfront Access",
    "Private Beach",
    "Beach View",
    "Dock Access",
  ];

  const handleInputChange = (name: string, value: string | number | boolean | string[]) => {
    setFormData((prevState: any) => ({
      ...prevState,
      [name]: value,
    }));
  };

  const toggleAmenity = (amenity: string) => {
    const updatedAmenities = selectedAmenities.includes(amenity)
      ? selectedAmenities.filter((item) => item !== amenity)
      : [...selectedAmenities, amenity];
    setSelectedAmenities(updatedAmenities);
    handleInputChange("selectedAmenities", updatedAmenities);
  };

  const handleCategoryChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    setCategory(event.target.value);
    handleInputChange("category", event.target.value);
  };

  const handleTypeChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    const selectedType = event.target.value;
    setType(selectedType);
    setResidentialSubtype(typeOptions[selectedType][0]);
    setCommercialSubtype(typeOptions[selectedType][0]);
    handleInputChange("type", selectedType);
  };

  const handleSubtypeChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    if (type === "Residential") {
      setResidentialSubtype(event.target.value);
      handleInputChange("residentialSubtype", event.target.value);
    } else {
      setCommercialSubtype(event.target.value);
      handleInputChange("commercialSubtype", event.target.value);
    }
  };

  const handleSearchQueryChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setSearchQuery(event.target.value);
  };

  const filteredAmenities = searchQuery
    ? amenities.filter((amenity) => amenity.toLowerCase().includes(searchQuery.toLowerCase()))
    : amenities.slice(0, 10); // Default to the first 10 amenities if no search query

  const ResidentialFeatureComponent = residentialFeatureComponents[residentialSubtype];
  const CommercialFeatureComponent = commercialFeatureComponents[commercialSubtype];

  return (
    <div className="mt-16 rounded-lg font-nunito flex flex-col lg:flex-row">
      {error && <ErrorMessage message={error} onClose={() => setError("")}></ErrorMessage>}
      {!error && successMessage && <SuccessMessage message={successMessage}></SuccessMessage>}
      <div className="w-full lg:w-1/2 lg:px-9 px-2 lg:mb-16">
        <p className="text-black font-bold text-lg mb-2 px-2 lg:px-0">General Info</p>
        <div className="md:border md:border-gray-300 md:p-6 p-4">
          <form className="space-y-4">
            <div>
              <label className="block text-sm text-black font-semibold">Listing Title</label>
              <input
                type="text"
                placeholder="Listing Title"
                onChange={(e) => handleInputChange("listingName", e.target.value)}
                className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
              />
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm text-black font-semibold">Category</label>
                <select
                  className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-black"
                  onChange={handleCategoryChange}
                >
                  <option>Rent</option>
                  <option>Sale</option>
                </select>
              </div>
              <div>
                <label className="block text-sm text-black font-semibold">Type</label>
                <select
                  value={type}
                  onChange={handleTypeChange}
                  className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-black"
                >
                  <option>Residential</option>
                  <option>Commercial</option>
                </select>
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm text-black font-semibold">
                  {type === "Commercial" ? "Commercial subtype" : "Residential subtype"}
                </label>
                <select
                  className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-black"
                  value={type === "Residential" ? residentialSubtype : commercialSubtype}
                  onChange={handleSubtypeChange}
                >
                  {typeOptions[type].map((subtypeOption) => (
                    <option key={subtypeOption}>{subtypeOption}</option>
                  ))}
                </select>
              </div>
              <div>
                <label className="block text-sm text-black font-semibold">Land size</label>
                <input
                  type="text"
                  placeholder="Enter value"
                  onChange={(e) => handleInputChange("landSize", e.target.value)}
                  className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
                />
              </div>
            </div>

            <div className="grid grid-cols-2 md:grid-cols-3 gap-4 mt-2">
              <div>
                <label className="block text-sm text-black font-semibold">Price</label>
                <input
                  type="number"
                  placeholder="Enter value"
                  onChange={(e) => handleInputChange("price", e.target.value)}
                  className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
                />
              </div>
              {category === "Rent" &&
                type === "Residential" &&
                !["Student's Hostels", "Hotel", "Guest House"].includes(residentialSubtype) && (
                  <div>
                    <label className="block text-sm text-black font-semibold">Frequency</label>
                    <select
                      className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
                      onChange={(e) => handleInputChange("frequency", e.target.value)}
                    >
                      {priceFrequencyOptions[type].map((option) => (
                        <option key={option}>{option}</option>
                      ))}
                    </select>
                  </div>
                )}
              {category === "Rent" && type === "Commercial" && (
                <div>
                  <label className="block text-sm text-black font-semibold">Frequency</label>
                  <select
                    className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
                    onChange={(e) => handleInputChange("frequency", e.target.value)}
                  >
                    {priceFrequencyOptions.Commercial.map((option) => (
                      <option key={option}>{option}</option>
                    ))}
                  </select>
                </div>
              )}
              {category === "Rent" &&
                type === "Residential" &&
                residentialSubtype === "Student's Hostels" && (
                  <div>
                    <label className="block text-sm text-black font-semibold">Frequency</label>
                    <select
                      className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
                      onChange={(e) => handleInputChange("frequency", e.target.value)}
                    >
                      {priceFrequencyOptions["Student's Hostels"].map((option) => (
                        <option key={option}>{option}</option>
                      ))}
                    </select>
                  </div>
                )}
              {category === "Rent" &&
                type === "Residential" &&
                ["Hotel", "Guest House"].includes(residentialSubtype) && (
                  <div>
                    <label className="block text-sm text-black font-semibold">Frequency</label>
                    <select
                      className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
                      onChange={(e) => handleInputChange("frequency", e.target.value)}
                    >
                      {priceFrequencyOptions["Hotel/Guest House"].map((option) => (
                        <option key={option}>{option}</option>
                      ))}
                    </select>
                  </div>
                )}
              {category === "Sale" && (
                <div>
                  <label className="block text-sm text-black font-semibold">Negotiable</label>
                  <select
                    className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
                    onChange={(e) => handleInputChange("negotiable", e.target.value)}
                  >
                    <option>Yes</option>
                    <option>No</option>
                  </select>
                </div>
              )}
            </div>

            <div>
              <label className="block text-sm text-black font-semibold">Listing Description</label>
              <textarea
                placeholder="Type Description"
                onChange={(e) => handleInputChange("listingDescription", e.target.value)}
                className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
              ></textarea>
            </div>

            <div className="mt-10 ">
              <h2 className="text-black font-bold text-lg mb-2">Features</h2>
              <div className="md:border md:border-gray-300">
                {type === "Residential" ? (
                  <ResidentialSpecific handleInputChange={handleInputChange} />
                ) : (
                  <CommercialSpecific handleInputChange={handleInputChange} />
                )}
                {type === "Residential" && ResidentialFeatureComponent && (
                  <ResidentialFeatureComponent handleInputChange={handleInputChange} />
                )}
                {type === "Commercial" && CommercialFeatureComponent && (
                  <CommercialFeatureComponent handleInputChange={handleInputChange} />
                )}
                <div className="md:p-6 md:pt-0 mt-5">
                  <label className="block text-sm text-black font-semibold">Amenities</label>
                  <input
                    type="text"
                    placeholder="Type to add"
                    onChange={handleSearchQueryChange}
                    className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
                  />
                  <div className="flex flex-wrap gap-2 mt-5">
                    {filteredAmenities.slice(0, 10).map((amenity) => (
                      <button
                        key={amenity}
                        type="button"
                        className={`px-3 py-1 rounded-md ${
                          selectedAmenities.includes(amenity)
                            ? "bg-neutral-300 text-terrablue text-sm"
                            : "bg-gray-100 text-sm text-gray-400"
                        }`}
                        onClick={() => toggleAmenity(amenity)}
                      >
                        <FontAwesomeIcon
                          className="text-xs mr-1"
                          icon={selectedAmenities.includes(amenity) ? faCheck : faPlus}
                        />
                        {amenity}
                      </button>
                    ))}
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
      <div className="w-full lg:w-1/2">
        <div className="mb-10 px-2 lg:px-0">
          <ImageSelector handleInputChange={handleInputChange} />
        </div>
        <div className="mt-20 lg:mt-0">
          <LocationForm handleInputChange={handleInputChange} />
        </div>
        <div>
          <SubmitButton setSuccessMessage={setSuccessMessage} setError={setError} data={formData} />
        </div>
      </div>
    </div>
  );
};

export default GeneralInfo;
