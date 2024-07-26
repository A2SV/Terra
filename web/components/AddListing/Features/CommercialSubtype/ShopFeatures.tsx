import React, { useState } from "react";

const ShopFeatures: React.FC<{
  handleInputChange: (name: string, value: string | number | boolean | string[]) => void;
}> = ({ handleInputChange }) => {
  const [displayWindow, setDisplayWindow] = useState<string>("Yes");
  const [storageRoom, setStorageRoom] = useState<string>("Yes");

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    handleInputChange(name, value);
    if (name === "displayWindow") setDisplayWindow(value);
    if (name === "storageRoom") setStorageRoom(value);
  };

  return (
    <div className="p-6 pt-0">
        <div className="flex">
          <div>
            <label className="block text-sm text-black font-semibold pr-5 pt-1">
              Display window
            </label>
            <div>
              <input
                type="radio"
                id="displayWindowYes"
                name="displayWindow"
                value="Yes"
                checked={displayWindow === "Yes"}
                onChange={handleChange}
                className="mt-1"
              />
              <label htmlFor="displayWindowYes" className="pl-2">
                Yes
              </label>
            </div>
            <div>
              <input
                type="radio"
                id="displayWindowNo"
                name="displayWindow"
                value="No"
                checked={displayWindow === "No"}
                onChange={handleChange}
                className="mt-1"
              />
              <label htmlFor="displayWindowNo" className="pl-2">
                No
              </label>
            </div>
          </div>
          <div className="pl-14">
            <label className="block text-sm text-black font-semibold pr-5 pt-1">Storage room</label>
            <div>
              <input
                type="radio"
                id="storageRoomYes"
                name="storageRoom"
                value="Yes"
                checked={storageRoom === "Yes"}
                onChange={handleChange}
                className="mt-1"
              />
              <label htmlFor="storageRoomYes" className="pl-2">
                Yes
              </label>
            </div>
            <div>
              <input
                type="radio"
                id="storageRoomNo"
                name="storageRoom"
                value="No"
                checked={storageRoom === "No"}
                onChange={handleChange}
                className="mt-1"
              />
              <label htmlFor="storageRoomNo" className="pl-2">
                No
              </label>
            </div>
          </div>
        </div>
    </div>
  );
};

export default ShopFeatures;
