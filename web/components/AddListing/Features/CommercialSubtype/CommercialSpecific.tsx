"use client";
import React, { useState } from "react";

const CommercialSpecific: React.FC<{
  handleInputChange: (name: string, value: string | number | boolean) => void;
}> = ({ handleInputChange }) => {
  const [totalFloors, setTotalFloors] = useState<number | string>("");
  const [floorNumber, setFloorNumber] = useState<number | string>("");
  const [parkingSpaces, setParkingSpaces] = useState<number | string>("");

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    handleInputChange(name, value);
    if (name === "totalFloors") setTotalFloors(value);
    if (name === "floorNumber") setFloorNumber(value);
    if (name === "parkingSpaces") setParkingSpaces(value);
  };

  return (
    <div className="rounded-lg font-nunito flex">
      <div>
        <div className="md:p-6">
          <div className="grid grid-cols-3 gap-4">
            <div>
              <label className="block text-sm text-black font-semibold">Total Floors</label>
              <input
                type="number"
                name="totalFloors"
                value={totalFloors}
                onChange={handleChange}
                placeholder="Type Value"
                className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
              />
            </div>
            <div>
              <label className="block text-sm text-black font-semibold">Floor Number</label>
              <input
                type="number"
                name="floorNumber"
                value={floorNumber}
                onChange={handleChange}
                placeholder="Type Value"
                className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
              />
            </div>
            <div>
              <label className="block text-sm text-black font-semibold">Parking spaces</label>
              <input
                type="number"
                name="parkingSpaces"
                value={parkingSpaces}
                onChange={handleChange}
                placeholder="Type to add"
                className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default CommercialSpecific;
