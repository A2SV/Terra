"use client";
import React, { useState } from "react";
import { MdKeyboardArrowDown, MdKeyboardArrowUp } from "react-icons/md";

interface AppliedFilters {
  listingType: string;
  propertyType: string;
  propertySubType: string;
  currency: string;
  frequency: string;
  amenities: string[];
  studentAccommodation: string;
}

const Filters: React.FC = () => {
  const [accordionOpen, setAccordionOpen] = useState<boolean>(false);
  const [appliedFilters, setAppliedFilters] = useState<AppliedFilters>({
    listingType: "",
    propertyType: "Residential",
    propertySubType: "",
    currency: "",
    frequency: "",
    amenities: [],
    studentAccommodation: "",
  });

  const handleFilterChange = (filterKey: keyof AppliedFilters, value: string) => {
    setAppliedFilters((prevFilters) => ({
      ...prevFilters,
      [filterKey]: value,
    }));
  };

  const handleAmenitiesChange = (amenity: string) => {
    setAppliedFilters((prevFilters) => {
      const amenities = prevFilters.amenities.includes(amenity)
        ? prevFilters.amenities.filter((a) => a !== amenity)
        : [...prevFilters.amenities, amenity];
      return { ...prevFilters, amenities };
    });
  };

  const handleSubmit = () => {};

  const frequencies = ["Any", "Per Night", "Monthly", "Annually"];

  const residentialSubTypes = ["Apartment", "Hotel", "Student Hostel", "House", "Guest House"];

  const commercialSubTypes = ["Warehouse", "Office Space", "Shops", "Event Space"];

  const amenitiesList = [
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
    "Study room",
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
    "Toilet facilities",
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

  return (
    <div className="w-[25%] flex flex-col px-5">
      <h1 className="text-[28px] font-nunito font-bold pt-6">Filters</h1>

      <div className="flex flex-col space-y-4 pt-4">
        <h1 className="text-[20px] font-nunito font-bold">Listings Type</h1>
        <div className="flex flex-row space-x-4 mx-6">
          <label className="flex items-center">
            <input
              type="radio"
              value="For Rent"
              checked={appliedFilters.listingType === "For Rent"}
              onChange={() => handleFilterChange("listingType", "For Rent")}
              className="form-radio h-4 w-4 text-blue accent-terrablue"
            />
            <span className="ml-2 font-nunito text-black text-[16px]">For Rent</span>
          </label>
          <label className="flex items-center">
            <input
              type="radio"
              value="For Sale"
              checked={appliedFilters.listingType === "For Sale"}
              onChange={() => handleFilterChange("listingType", "For Sale")}
              className="form-radio h-4 w-4 text-blue accent-terrablue"
            />
            <span className="ml-2 font-nunito text-black text-[16px]">For Sale</span>
          </label>
        </div>
      </div>

      <div className="flex flex-col space-y-4 pt-5">
        <h1 className="text-[20px] font-nunito font-bold">Property Type</h1>
        <div className="flex flex-row space-x-4">
          <label className="flex items-center mx-6">
            <input
              type="radio"
              value="Residential"
              checked={appliedFilters.propertyType === "Residential"}
              onChange={() => handleFilterChange("propertyType", "Residential")}
              className="form-radio h-4 w-4 text-blue accent-terrablue"
            />
            <span className="ml-2 font-nunito text-black text-[16px]">Residential</span>
          </label>
          <label className="flex items-center">
            <input
              type="radio"
              value="Commercial"
              checked={appliedFilters.propertyType === "Commercial"}
              onChange={() => handleFilterChange("propertyType", "Commercial")}
              className="form-radio h-4 w-4 text-blue accent-terrablue"
            />
            <span className="ml-2 font-nunito text-black text-[16px]">Commercial</span>
          </label>
        </div>
      </div>

      <div className="flex px-[20px] w-[320px] rounded-[20px] bg-gray-50 mt-8 flex-col py-[10px]">
        <div>
          <h1 className="text-[20px] font-nunito font-bold">Sub-Type</h1>
        </div>
        <div className="flex flex-wrap py-3 gap-3">
          {appliedFilters.propertyType === "Residential"
            ? residentialSubTypes.map((subType) => (
                <div
                  key={subType}
                  className={`flex font-nunito text-[14px] justify-center items-center px-4 py-[2px] rounded-xl ${
                    appliedFilters.propertySubType === subType
                      ? "bg-terrablue text-white shadow-lg"
                      : "border border-black"
                  }`}
                  onClick={() => handleFilterChange("propertySubType", subType)}
                >
                  <p>{subType}</p>
                </div>
              ))
            : commercialSubTypes.map((subType) => (
                <div
                  key={subType}
                  className={`flex font-nunito text-[14px] justify-center items-center px-4 py-[2px] rounded-xl ${
                    appliedFilters.propertySubType === subType
                      ? "bg-terrablue text-white shadow-lg"
                      : "border border-black"
                  }`}
                  onClick={() => handleFilterChange("propertySubType", subType)}
                >
                  <p>{subType}</p>
                </div>
              ))}
        </div>
      </div>

      <div className="flex flex-col space-y-4 pt-4">
        <h1 className="text-[20px] font-nunito font-bold">Currency</h1>
        <div className="flex flex-row space-x-4 mx-4">
          <label className="flex items-center">
            <input
              type="radio"
              value="USD"
              checked={appliedFilters.currency === "USD"}
              onChange={() => handleFilterChange("currency", "USD")}
              className="form-radio h-4 w-4 text-blue accent-terrablue"
            />
            <span className="ml-2 font-nunito text-black text-[16px]">USD</span>
          </label>
          <label className="flex items-center">
            <input
              type="radio"
              value="GHC"
              checked={appliedFilters.currency === "GHC"}
              onChange={() => handleFilterChange("currency", "GHC")}
              className="form-radio h-4 w-4 text-blue accent-terrablue"
            />
            <span className="ml-2 font-nunito text-black text-[16px]">GHC</span>
          </label>
        </div>
      </div>

      <div className="flex px-[20px] w-[320px]  rounded-[20px] bg-gray-50 mt-8 flex-col py-[10px]">
        <h1 className="text-[20px] font-nunito font-bold ">Price Frequency</h1>
        <div className="flex flex-wrap gap-3 mt-3">
          {frequencies.map((frequency) => (
            <div
              key={frequency}
              className={`flex font-nunito text-[14px] justify-center items-center px-4 py-[2px] rounded-xl ${
                appliedFilters.frequency === frequency
                  ? "bg-terrablue text-white shadow-lg"
                  : "border border-black"
              }`}
              onClick={() => handleFilterChange("frequency", frequency)}
            >
              <p>{frequency}</p>
            </div>
          ))}
        </div>
      </div>

      <div className="flex px-[20px] w-[320px] rounded-[20px] bg-gray-50 mt-8 flex-col py-[10px]">
        <div className="flex flex-row justify-between">
          <h1 className="text-[20px] font-nunito font-bold">Amenities</h1>
          <button onClick={() => setAccordionOpen(!accordionOpen)}>
            {accordionOpen ? (
              <MdKeyboardArrowUp className="text-xl md:text-3xl shrink-0 mx-1" />
            ) : (
              <MdKeyboardArrowDown className="text-xl md:text-3xl shrink-0 mx-1" />
            )}
          </button>
        </div>

        {accordionOpen && (
          <div className="flex flex-wrap pt-3 gap-3">
            {amenitiesList.map((item) => (
              <div
                key={item}
                className={`flex font-nunito text-[14px] justify-center items-center px-4 py-[2px] rounded-xl ${
                  appliedFilters.amenities.includes(item)
                    ? "bg-terrablue text-white shadow-lg"
                    : "border border-black"
                }`}
                onClick={() => handleAmenitiesChange(item)}
              >
                <p>{item}</p>
              </div>
            ))}
          </div>
        )}
      </div>

      <div className="flex flex-col space-y-4 pt-4">
        <h1 className="text-[20px] font-nunito font-bold">Student Accommodation</h1>
        <div className="flex flex-row space-x-4 mx-6">
          <label className="flex items-center">
            <input
              type="radio"
              value="Yes"
              checked={appliedFilters.studentAccommodation === "Yes"}
              onChange={() => handleFilterChange("studentAccommodation", "Yes")}
              className="form-radio h-4 w-4 text-blue accent-terrablue"
            />
            <span className="ml-2 font-nunito text-black text-[16px]">Yes</span>
          </label>
          <label className="flex items-center">
            <input
              type="radio"
              value="No"
              checked={appliedFilters.studentAccommodation === "No"}
              onChange={() => handleFilterChange("studentAccommodation", "No")}
              className="form-radio h-4 w-4 text-blue accent-terrablue"
            />
            <span className="ml-2 font-nunito text-black text-[16px]">No</span>
          </label>
        </div>
      </div>

      <div className="flex flex-row space-x-6 mt-6 mb-3">
        <button
          className="bg-gray-200 text-black font-nunito font-semibold text-[13px] px-3 py-2 rounded-[25px]"
          onClick={() =>
            setAppliedFilters({
              listingType: "",
              propertyType: "",
              propertySubType: "",
              currency: "",
              frequency: "",
              amenities: [],
              studentAccommodation: "",
            })
          }
        >
          Reset All
        </button>

        <button
          className="bg-[#1779F3] text-white font-nunito font-semibold text-[13px] px-3 py-2 rounded-[25px]"
          onClick={handleSubmit}
        >
          Show Results
        </button>
      </div>
    </div>
  );
};

export default Filters;
