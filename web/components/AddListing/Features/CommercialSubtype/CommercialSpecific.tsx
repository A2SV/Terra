"use client";
import React from "react";

const CommercialSpecific: React.FC = () => {
  return (
    <div className="rounded-lg font-nunito flex">
      <div>
        <div className="p-6">
          <form className="space-y-4">
            <div className="grid grid-cols-3 gap-4">
              <div>
                <label className="block text-sm text-black font-semibold">Total Floors</label>
                <input
                  type="number"
                  placeholder="Type Value"
                  className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
                />
              </div>
              <div>
                <label className="block text-sm text-black font-semibold">Floor Number</label>
                <input
                  type="number"
                  placeholder="Type Value"
                  className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
                />
              </div>
              <div>
                <label className="block text-sm text-black font-semibold">Parking spaces</label>
                <input
                  type="number"
                  placeholder="Type to add"
                  className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
                />
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};

export default CommercialSpecific;
