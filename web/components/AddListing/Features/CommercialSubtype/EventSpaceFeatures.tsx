import React, { useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faPlus, faCheck } from "@fortawesome/free-solid-svg-icons";

const EventSpaceFeatures: React.FC<{ handleInputChange: (name: string, value: any) => void }> = ({
  handleInputChange,
}) => {
  const [maxCapacity, setMaxCapacity] = useState<number | string>("");
  const [selectedeventTypes, setSelectedeventTypes] = useState<string[]>([]);
  const [cateringServices, setCateringServices] = useState<string>("Yes");
  const [audioVisualEquipment, setAudioVisualEquipment] = useState<string>("Yes");

  const eventTypes = [
    "religious",
    "wedding",
    "funeral",
    "festivals",
    "conference",
    "concert",
    "party",
  ];

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    handleInputChange(name, value);
    if (name === "maxCapacity") setMaxCapacity(value);
    if (name === "cateringServices") setCateringServices(value);
    if (name === "audioVisualEquipment") setAudioVisualEquipment(value);
  };

  const toggleeventType = (eventType: string) => {
    const updatedEventTypes = selectedeventTypes.includes(eventType)
      ? selectedeventTypes.filter((item) => item !== eventType)
      : [...selectedeventTypes, eventType];
    setSelectedeventTypes(updatedEventTypes);
    handleInputChange("selectedeventTypes", updatedEventTypes);
  };

  return (
    <div className="p-6">
      <div className="grid grid-cols-2 gap-4">
        <div>
          <label className="block text-sm text-black font-semibold">Maximum capacity</label>
          <input
            className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
            type="number"
            name="maxCapacity"
            value={maxCapacity}
            onChange={handleChange}
            placeholder="Enter value"
          />
        </div>
        <div>
          <label className="block text-sm text-black font-semibold">Type of events suitable</label>
          <div className="flex flex-wrap gap-2 mt-1">
            {eventTypes.map((type) => (
              <button
                key={type}
                type="button"
                className={`px-2 py-1 rounded-md ${selectedeventTypes.includes(type) ? "bg-neutral-300 text-terrablue text-sm" : "bg-gray-100 text-sm text-gray-400"}`}
                onClick={() => toggleeventType(type)}
              >
                <FontAwesomeIcon
                  className="text-xs mr-1"
                  icon={selectedeventTypes.includes(type) ? faCheck : faPlus}
                />
                {type}
              </button>
            ))}
          </div>
        </div>
      </div>
      <div className="grid grid-cols-2">
        <div>
          <label className="block text-sm text-black font-semibold pr-5 pt-1">
            Catering facilities
          </label>
          <div>
            <input
              type="radio"
              id="cateringYes"
              name="cateringServices"
              value="Yes"
              checked={cateringServices === "Yes"}
              onChange={handleChange}
              className="mt-1"
            />
            <label htmlFor="cateringYes" className="pl-2">
              Yes
            </label>
          </div>
          <div>
            <input
              type="radio"
              id="cateringNo"
              name="cateringServices"
              value="No"
              checked={cateringServices === "No"}
              onChange={handleChange}
              className="mt-1"
            />
            <label htmlFor="cateringNo" className="pl-2">
              No
            </label>
          </div>
        </div>
        <div>
          <label className="block text-sm text-black font-semibold pr-5 pt-1">
            Audio-Visual equipment available
          </label>
          <div>
            <input
              type="radio"
              id="audioVisualYes"
              name="audioVisualEquipment"
              value="Yes"
              checked={audioVisualEquipment === "Yes"}
              onChange={handleChange}
              className="mt-1"
            />
            <label htmlFor="audioVisualYes" className="pl-2">
              Yes
            </label>
          </div>
          <div>
            <input
              type="radio"
              id="audioVisualNo"
              name="audioVisualEquipment"
              value="No"
              checked={audioVisualEquipment === "No"}
              onChange={handleChange}
              className="mt-1"
            />
            <label htmlFor="audioVisualNo" className="pl-2">
              No
            </label>
          </div>
        </div>
      </div>
    </div>
  );
};

export default EventSpaceFeatures;
