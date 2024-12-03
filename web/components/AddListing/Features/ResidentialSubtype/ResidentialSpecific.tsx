"use client";
import React, { useState } from "react";

const ResidentialSpecific: React.FC<{
  handleInputChange: (name: string, value: string | number | boolean) => void;
}> = ({ handleInputChange }) => {
  const [bedrooms, setBedrooms] = useState<number | string>("");
  const [bathrooms, setBathrooms] = useState<number | string>("");
  const [washrooms, setWashrooms] = useState<number | string>("");
  const [kitchens, setKitchens] = useState<number | string>("");
  const [furnishedStatus, setFurnishedStatus] = useState<string>("");

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    console.log(e.target.value);
    const { name, value } = e.target;
    handleInputChange(name, value);
    switch (name) {
      case "bedrooms":
        setBedrooms(value);
        break;
      case "bathrooms":
        setBathrooms(value);
        break;
      case "washrooms":
        setWashrooms(value);
        break;
      case "kitchens":
        setKitchens(value);
        break;
      case "furnishedStatus":
        setFurnishedStatus(value);
        break;
      default:
        break;
    }
  };

  return (
    <div className="rounded-lg font-nunito flex">
      <div>
        <div className="md:p-6 space-y-3">
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm text-black font-semibold">Bedrooms</label>
              <input
                type="number"
                name="bedrooms"
                value={bedrooms}
                onChange={handleChange}
                placeholder="Type to add"
                className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
              />
            </div>
            <div>
              <label className="block text-sm text-black font-semibold">Bathrooms</label>
              <input
                type="number"
                name="bathrooms"
                value={bathrooms}
                onChange={handleChange}
                placeholder="Type to add"
                className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
              />
            </div>
          </div>

          <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
            <div>
              <label className="block text-sm text-black font-semibold">Washrooms</label>
              <input
                type="number"
                name="washrooms"
                value={washrooms}
                onChange={handleChange}
                placeholder="Type to add"
                className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
              />
            </div>
            <div>
              <label className="block text-sm text-black font-semibold">Kitchens</label>
              <input
                type="number"
                name="kitchens"
                value={kitchens}
                onChange={handleChange}
                placeholder="Type to add"
                className="mt-1 block w-full p-2  rounded-md bg-gray-100 text-sm text-gray-400"
              />
            </div>
            <div>
              <label className="block text-sm text-black font-semibold">Furnished status</label>
              <select
                name="furnishedStatus"
                value={furnishedStatus}
                onChange={handleChange}
                className="mt-1 block w-full p-2  rounded-md bg-gray-100 text-sm text-gray-400"
              >
                <option value="">Select</option>
                <option value="yes">Yes</option>
                <option value="no">No</option>
              </select>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ResidentialSpecific;
