"use client";
import React, { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus, faCheck } from "@fortawesome/free-solid-svg-icons";

const StudentHostelFeatures: React.FC = () => {
  const [selectedroomTypes, setSelectedroomTypes] = useState<string[]>([]);

  const roomTypes = ["Single", "Double", "Triple", "Quad", "5+ (dormitory)"];

  const toggleroomType = (roomType: string) => {
    setSelectedroomTypes((prev) =>
      prev.includes(roomType) ? prev.filter((item) => item !== roomType) : [...prev, roomType]
    );
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
                className={`px-3 py-1 rounded-md ${selectedroomTypes.includes(type) ? "bg-neutral-300 text-terrablue text-sm" : "bg-gray-100 text-sm text-gray-400"}`}
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
            <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-black">
              <option>Male only</option>
              <option>Female only</option>
              <option>Co-ed</option>
            </select>
          </div>
          <div>
            <label className="block text-sm text-black font-semibold">Location</label>
            <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
              <option>On campus</option>
              <option>Off campus</option>
            </select>
          </div>
        </div>
        <div className="flex">
          <label className="block text-sm text-black font-semibold pr-5">Student-Friendly</label>
          <input type="checkbox" />
        </div>
      </form>
    </div>
  );
};

export default StudentHostelFeatures;
