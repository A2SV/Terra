import React, { useState } from "react";

const ApartmentFeatures: React.FC<{
  handleInputChange: (name: string, value: string | number | boolean | string[]) => void;
}> = ({ handleInputChange }) => {
  const [numFloors, setNumFloors] = useState<number | string>("");
  const [floorNumber, setFloorNumber] = useState<number | string>("");
  const [studentFriendly, setStudentFriendly] = useState<boolean>(false);
  const [laundryFacility, setLaundryFacility] = useState<boolean>(false);
  const [cleaningService, setCleaningService] = useState<boolean>(false);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, type, value, checked } = e.target;

    if (type === "checkbox") {
      const inputValue = checked;
      handleInputChange(name, inputValue);
      if (name === "studentFriendly") setStudentFriendly(inputValue);
      if (name === "laundryFacility") setLaundryFacility(inputValue);
      if (name === "cleaningService") setCleaningService(inputValue);
    } else {
      const inputValue = value;
      handleInputChange(name, inputValue);
      if (name === "numFloors") setNumFloors(inputValue);
      if (name === "floorNumber") setFloorNumber(inputValue);
    }
  };

  return (
    <div>
      <div className="p-6 space-y-5">
        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="block text-sm text-black font-semibold">
              Number of floors in building
            </label>
            <input
              type="number"
              name="numFloors"
              value={numFloors}
              onChange={handleChange}
              placeholder="Enter value"
              className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
            />
          </div>
          <div>
            <label className="block text-sm text-black font-semibold">
              Floor number of the unit
            </label>
            <input
              type="number"
              name="floorNumber"
              value={floorNumber}
              onChange={handleChange}
              placeholder="Enter value"
              className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
            />
          </div>
        </div>

        <div className="flex justify-between items-center my-3">
          <div className="flex sm:flex-row flex-col">
            <label className="text-sm text-black font-semibold pr-3">Student-Friendly</label>
            <input
              type="checkbox"
              name="studentFriendly"
              checked={studentFriendly}
              onChange={handleChange}
              className="pl-5"
            />
          </div>
          <div className="flex sm:flex-row flex-col">
            <label className=" text-sm text-black font-semibold pr-3">
              Laundry Facility Available
            </label>
            <input
              type="checkbox"
              name="laundryFacility"
              checked={laundryFacility}
              onChange={handleChange}
              className="pl-5"
            />
          </div>
          <div className="flex sm:flex-row flex-col">
            <label className="block text-sm text-black font-semibold pr-3">
              Cleaning Service Available
            </label>
            <input
              type="checkbox"
              name="cleaningService"
              checked={cleaningService}
              onChange={handleChange}
            />
          </div>
        </div>
      </div>
    </div>
  );
};

export default ApartmentFeatures;
