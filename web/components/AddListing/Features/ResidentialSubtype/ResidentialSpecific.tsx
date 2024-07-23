"use client";
import React from "react";

const ResidentialSpecific: React.FC = () => {
  return (
    <div className="rounded-lg font-nunito flex">
      <div>
        <div className="p-6">
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

            <div className="grid grid-cols-3 gap-4">
              <div>
                <label className="block text-sm text-black font-semibold">Washrooms</label>
                <input
                  type="number"
                  placeholder="Type to add"
                  className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
                />
              </div>
              <div>
                <label className="block text-sm text-black font-semibold">Kitchens</label>
                <input
                  type="number"
                  placeholder="Type to add"
                  className="mt-1 block w-full p-2  rounded-md bg-gray-100 text-sm text-gray-400"
                />
              </div>
              <div>
                <label className="block text-sm text-black font-semibold">Furnished status</label>
                <select className="mt-1 block w-full p-2  rounded-md bg-gray-100 text-sm text-gray-400">
                  <option>Yes</option>
                  <option>No</option>
                </select>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};

export default ResidentialSpecific;
