import React from "react";

const WareHouseFeatures: React.FC = () => {
  return (
    <div className="p-6">
      <form className="space-y-4">
        <div className="grid grid-cols-2 gap-4">
          <div>
            <label className="block text-sm text-black font-semibold">Ceiling height</label>
            <input
              className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
              type="number"
              placeholder="Enter value"
            />
          </div>
          <div>
            <label className="block text-sm text-black font-semibold">Loading docks</label>
            <div>
              <input
                type="radio"
                id="LoadingdocksYes"
                name="Loadingdocks"
                value="Yes"
                className="mt-1"
              />
              <label htmlFor="LoadingdocksYes" className="pl-2">
                Yes
              </label>
            </div>
            <div>
              <input
                type="radio"
                id="LoadingdocksNo"
                name="Loadingdocks"
                value="No"
                className="mt-1"
              />
              <label htmlFor="LoadingdocksNo" className="pl-2">
                No
              </label>
            </div>
          </div>
        </div>
        <div className="grid grid-cols-2">
          <div>
            <label className="block text-sm text-black font-semibold pr-5 pt-1">
              Office space included
            </label>
            <div>
              <input
                type="radio"
                id="receptionYes"
                name="receptionArea"
                value="Yes"
                className="mt-1"
              />
              <label htmlFor="receptionYes" className="pl-2">
                Yes
              </label>
            </div>
            <div>
              <input
                type="radio"
                id="receptionNo"
                name="receptionArea"
                value="No"
                className="mt-1"
              />
              <label htmlFor="receptionNo" className="pl-2">
                No
              </label>
            </div>
          </div>
          <div>
            <label className="block text-sm text-black font-semibold">
              Type of goods suitable for storage
            </label>
            <select className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400">
              <option>General Merchandise</option>
              <option>Perishable Goods</option>
              <option>Hazardous Materials</option>
              <option>Electronics/Sensitive Equipment</option>
              <option>Industrial/Construction Materials</option>
            </select>
          </div>
        </div>
      </form>
    </div>
  );
};

export default WareHouseFeatures;
