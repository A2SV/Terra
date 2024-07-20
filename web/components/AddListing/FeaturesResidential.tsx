"use client";
import React, { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus, faCheck } from "@fortawesome/free-solid-svg-icons";

const FeaturesResidential: React.FC = () => {
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

  return (
    <div className="rounded-lg font-nunito mb-20 flex">
      <div>
        <h2 className="text-black font-bold text-lg mb-2">Features</h2>
        <div className="border border-gray-300 p-6">
          <form className="space-y-4">
            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm text-black font-semibold">Bedrooms</label>
                <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
                  <option>select or enter</option>
                </select>
              </div>
              <div>
                <label className="block text-sm text-black font-semibold">Bathrooms</label>
                <select className="mt-1 block w-full p-2  rounded-md bg-gray-100 text-sm text-gray-400">
                  <option>select or enter</option>
                </select>
              </div>
            </div>

            <div>
              <label className="block text-sm text-black font-semibold">Room type</label>
              <div className="flex flex-wrap gap-2 mt-1">
                {["Single", "Double", "Triple", "Quad", "5+ (dormitory)"].map((type) => (
                  <button
                    key={type}
                    type="button"
                    className="px-3 py-1  rounded-md bg-gray-100 text-sm text-gray-400"
                  >
                    + {type}
                  </button>
                ))}
              </div>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm text-black font-semibold">Hostel type</label>
                <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
                  <option>select or enter</option>
                </select>
              </div>
              <div>
                <label className="block text-sm text-black font-semibold">Location</label>
                <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
                  <option>on or off campus</option>
                </select>
              </div>
            </div>

            <div>
              <label className="block text-sm text-black font-semibold">Amenities</label>
              <input
                type="text"
                placeholder="Type to add"
                className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
              />
              <div className="flex flex-wrap gap-2 mt-2">
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
          </form>
        </div>
      </div>
    </div>
  );
};

export default FeaturesResidential;
