import React from "react";

const ApartmentFeatures: React.FC = () => {
  return (
    <div>
      <div className="p-6">
        <form className="space-y-4">
          <div className="grid grid-cols-2 gap-4">
            <div>
              <label className="block text-sm text-black font-semibold">
                Number of floors in building
              </label>
              <input
                type="number"
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
                placeholder="Enter value"
                className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
              />
            </div>
          </div>

          <div className="grid grid-cols-3 gap-4">
            <div className="flex">
              <label className="block text-sm text-black font-semibold pt-2 pr-5">
                Student-Friendly
              </label>
              <input type="checkbox" className="pl-5" />
            </div>
            <div className="flex">
              <label className=" text-sm text-black font-semibold pr-5 pl-5">
                Laundry Facility Available
              </label>
              <input type="checkbox" className="pl-5" />
            </div>
            <div className="flex">
              <label className="block text-sm text-black font-semibold pl-5">
                Cleaning Service Available
              </label>
              <input type="checkbox" />
            </div>
          </div>
        </form>
      </div>
    </div>
  );
};

export default ApartmentFeatures;
