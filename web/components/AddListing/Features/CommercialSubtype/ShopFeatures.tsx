import React from "react";

const ShopFeatures: React.FC = () => {
  return (
    <div className="p-6 pt-0">
      <form action="">
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
                className="mt-1"
              />
              <label htmlFor="storageRoomNo" className="pl-2">
                No
              </label>
            </div>
          </div>
        </div>
      </form>
    </div>
  );
};

export default ShopFeatures;
