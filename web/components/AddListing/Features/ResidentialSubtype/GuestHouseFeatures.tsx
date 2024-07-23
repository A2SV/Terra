import React from "react";

const GuestHouseFeatures: React.FC = () => {
  return (
    <div className="p-6">
      <form className="space-y-4">
        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="block text-sm text-black font-semibold">Star rating</label>
            <input
              className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
              type="number"
              placeholder="Enter value"
            />
          </div>
          <div>
            <label className="block text-sm text-black font-semibold">Restaurant on-site</label>
            <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
              <option>Yes</option>
              <option>No</option>
            </select>
          </div>
        </div>
      </form>
    </div>
  );
};

export default GuestHouseFeatures;
