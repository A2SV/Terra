"use client";
import React, { useState } from "react";
import FeaturesResidential from "./FeaturesResidential";
import FeaturesCommercial from "./FeaturesCommercial";
import ImageSelector from "./ImageSelector";
import LocationForm from "./LocationForm";

const GeneralInfo: React.FC = () => {
  const [type, setType] = useState<string>("Residential");

  const handleTypeChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    setType(event.target.value);
  };

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
                <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
                  <option>Rent or sale</option>
                </select>
              </div>
              <div>
                <label className="block text-sm text-black font-semibold">Type</label>
                <select
                  value={type}
                  onChange={handleTypeChange}
                  className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
                >
                  <option>Residential</option>
                  <option>Commercial</option>
                </select>
              </div>
            </div>

            <div className="grid grid-cols-4 gap-4">
              <div className="col-span-2">
                <label className="block text-sm text-black font-semibold">
                  Residential subtype
                </label>
                <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
                  <option>Apartment, house etc..</option>
                </select>
              </div>
              <div>
                <label className="block text-sm text-black font-semibold">Area</label>
                <input
                  type="text"
                  placeholder="Enter value"
                  className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
                />
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
              <div className="mt-4">
                <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
                  <option>Frequency</option>
                </select>
              </div>
              <div className="mt-4">
                <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
                  <option>USD</option>
                </select>
              </div>
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
          {type === "Residential" ? <FeaturesResidential /> : <FeaturesCommercial />}
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
