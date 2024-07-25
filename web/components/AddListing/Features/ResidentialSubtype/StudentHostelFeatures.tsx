"use client";
import React, { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus, faCheck } from "@fortawesome/free-solid-svg-icons";

const StudentHostelFeatures: React.FC<{
  handleInputChange: (name: string, value: string | number | boolean | string[]) => void;
}> = ({ handleInputChange }) => {
  const [selectedroomTypes, setSelectedroomTypes] = useState<string[]>([]);
  const [hostelType, setHostelType] = useState<string>("Male only");
  const [location, setLocation] = useState<string>("On campus");
  const [studentFriendly, setStudentFriendly] = useState<boolean>(false);

  const roomTypes = ["Single", "Double", "Triple", "Quad", "5+ (dormitory)"];

  const toggleroomType = (roomType: string) => {
    const updatedRoomTypes = selectedroomTypes.includes(roomType)
      ? selectedroomTypes.filter((item) => item !== roomType)
      : [...selectedroomTypes, roomType];
    setSelectedroomTypes(updatedRoomTypes);
    handleInputChange("selectedroomTypes", updatedRoomTypes);
  };

  const handleHostelTypeChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setHostelType(e.target.value);
    handleInputChange("hostelType", e.target.value);
  };

  const handleLocationChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setLocation(e.target.value);
    handleInputChange("location", e.target.value);
  };

  const handleStudentFriendlyChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setStudentFriendly(e.target.checked);
    handleInputChange("studentFriendly", e.target.checked);
  };

  return (
    <div className="p-6">
      <form className="space-y-4">
        <div>
          <label className="block text-sm text-black font-semibold">Room type</label>
          <div className="flex flex-wrap gap-2 mt-1">
            {roomTypes.map((type) => (
              <button
                key={type}
                type="button"
                className={`px-3 py-1 rounded-md ${
                  selectedroomTypes.includes(type)
                    ? "bg-neutral-300 text-terrablue text-sm"
                    : "bg-gray-100 text-sm text-gray-400"
                }`}
                onClick={() => toggleroomType(type)}
              >
                <FontAwesomeIcon
                  className="text-xs mr-1"
                  icon={selectedroomTypes.includes(type) ? faCheck : faPlus}
                />
                {type}
              </button>
            ))}
          </div>
        </div>
        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="block text-sm text-black font-semibold">Hostel type</label>
            <select
              className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-black"
              value={hostelType}
              onChange={handleHostelTypeChange}
            >
              <option>Male only</option>
              <option>Female only</option>
              <option>Co-ed</option>
            </select>
          </div>
          <div>
            <label className="block text-sm text-black font-semibold">Location</label>
            <select
              className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
              value={location}
              onChange={handleLocationChange}
            >
              <option>On campus</option>
              <option>Off campus</option>
            </select>
          </div>
        </div>
        <div className="flex">
          <label className="block text-sm text-black font-semibold pr-5">Student-Friendly</label>
          <input type="checkbox" checked={studentFriendly} onChange={handleStudentFriendlyChange} />
        </div>
      </form>
    </div>
  );
};

export default StudentHostelFeatures;
