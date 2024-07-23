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
  const [type, setType] = useState<string>("Residential");
  const [category, setCategory] = useState<string>("Rent");
  const [residentialSubtype, setResidentialSubtype] = useState<string>("Apartment");
  const [commercialSubtype, setCommercialSubtype] = useState<string>("Office Space");
  const [selectedAmenities, setSelectedAmenities] = useState<string[]>([]);

  const amenities = [
    "wifi",
    "Furnished",
    "Air conditioning",
    "Ceiling fan",
    "Garden",
    "Allow oven and stove",
    "Study room",
    "Cable tv",
    "Parking space",
    "High speed internet",
  ];

  const toggleAmenity = (amenity: string) => {
    setSelectedAmenities((prev) =>
      prev.includes(amenity) ? prev.filter((item) => item !== amenity) : [...prev, amenity]
    );
  };

  const handleCategoryChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    setCategory(event.target.value);
  };

  const handleTypeChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    const selectedType = event.target.value;
    setType(selectedType);
    setResidentialSubtype(typeOptions[selectedType][0]);
    setCommercialSubtype(typeOptions[selectedType][0]);
  };

  const handleSubtypeChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    if (type === "Residential") {
      setResidentialSubtype(event.target.value);
    } else {
      setCommercialSubtype(event.target.value);
    }
  };

  const ResidentialFeatureComponent = residentialFeatureComponents[residentialSubtype];
  const CommercialFeatureComponent = commercialFeatureComponents[commercialSubtype];

  return (
    <div className="mt-16 rounded-lg font-nunito flex flex-col lg:flex-row">
      <div className="w-full lg:w-1/2 px-9 lg:mb-16">
        <p className="text-black font-bold text-lg mb-2">General Info</p>
        <div className="border border-gray-300 p-6">
          <form className="space-y-4">
            <div>
              <label className="block text-sm text-black font-semibold">Listing Name</label>
              <input
                type="text"
                placeholder="Your Name"
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
                  className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
                />
              </div>
            </div>

            <div className="grid grid-cols-3 gap-4 mt-2">
              <div>
                <label className="block text-sm text-black font-semibold">Price</label>
                <input
                  type="number"
                  placeholder="Enter value"
                  className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
                />
              </div>
              {category === "Rent" &&
                type === "Residential" &&
                !["Student's Hostels", "Hotel", "Guest House"].includes(residentialSubtype) && (
                  <div>
                    <label className="block text-sm text-black font-semibold">Frequency</label>
                    <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
                      {priceFrequencyOptions[type].map((option) => (
                        <option key={option}>{option}</option>
                      ))}
                    </select>
                  </div>
                )}
              {category === "Rent" && type === "Commercial" && (
                <div>
                  <label className="block text-sm text-black font-semibold">Frequency</label>
                  <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
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
                    <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
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
                    <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
                      {priceFrequencyOptions["Hotel/Guest House"].map((option) => (
                        <option key={option}>{option}</option>
                      ))}
                    </select>
                  </div>
                )}
              {category === "Sale" && (
                <div>
                  <label className="block text-sm text-black font-semibold">Negotiable</label>
                  <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
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
                className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
              ></textarea>
            </div>
          </form>
        </div>

        <div className="mt-10">
          <h2 className="text-black font-bold text-lg mb-2">Features</h2>
          <div className="border border-gray-300">
            {type === "Residential" ? <ResidentialSpecific /> : <CommercialSpecific />}
            {type === "Residential" && ResidentialFeatureComponent && (
              <ResidentialFeatureComponent />
            )}
            {type === "Commercial" && CommercialFeatureComponent && <CommercialFeatureComponent />}
            <div className="p-6 pt-0">
              <label className="block text-sm text-black font-semibold">Amenities</label>
              <input
                type="text"
                placeholder="Type to add"
                className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
              />
              <div className="flex flex-wrap gap-2">
                {amenities.map((amenity) => (
                  <button
                    key={amenity}
                    type="button"
                    className={`px-3 py-1 rounded-md ${selectedAmenities.includes(amenity) ? "bg-neutral-300 text-terrablue text-sm" : "bg-gray-100 text-sm text-gray-400"}`}
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
      </div>
      <div className="w-full lg:w-1/2">
        <div className="mb-10">
          <ImageSelector />
        </div>
        <div className="mt-20 lg:mt-0">
          <LocationForm />
        </div>
      </div>
    </div>
  );
};

export default GeneralInfo;
