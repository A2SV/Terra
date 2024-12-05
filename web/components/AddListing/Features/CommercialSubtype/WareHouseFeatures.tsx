import React, { useState } from "react";

const WareHouseFeatures: React.FC<{
  handleInputChange: (name: string, value: string | number | boolean | string[]) => void;
}> = ({ handleInputChange }) => {
  const [ceilingHeight, setCeilingHeight] = useState<number | string>("");
  const [loadingDocks, setLoadingDocks] = useState<string>("Yes");
  const [officeSpaceIncluded, setOfficeSpaceIncluded] = useState<string>("Yes");
  const [goodsType, setGoodsType] = useState<string>("General Merchandise");

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    handleInputChange(name, value);
    if (name === "ceilingHeight") setCeilingHeight(value);
    if (name === "loadingDocks") setLoadingDocks(value);
    if (name === "officeSpaceIncluded") setOfficeSpaceIncluded(value);
    if (name === "goodsType") setGoodsType(value);
  };

  return (
    <div className="md:p-6">
      <div className="grid grid-cols-2 gap-4">
        <div>
          <label className="block text-sm text-black font-semibold">Ceiling height</label>
          <input
            className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm"
            type="number"
            name="ceilingHeight"
            value={ceilingHeight}
            onChange={handleChange}
            placeholder="Enter value"
          />
        </div>
        <div>
          <label className="block text-sm text-black font-semibold">Loading docks</label>
          <div>
            <input
              type="radio"
              id="LoadingdocksYes"
              name="loadingDocks"
              value="Yes"
              checked={loadingDocks === "Yes"}
              onChange={handleChange}
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
              name="loadingDocks"
              value="No"
              checked={loadingDocks === "No"}
              onChange={handleChange}
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
              name="officeSpaceIncluded"
              value="Yes"
              checked={officeSpaceIncluded === "Yes"}
              onChange={handleChange}
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
              name="officeSpaceIncluded"
              value="No"
              checked={officeSpaceIncluded === "No"}
              onChange={handleChange}
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
          <select
            className="mt-1 block w-full p-2 rounded-md bg-gray-100 text-sm text-gray-400"
            name="goodsType"
            value={goodsType}
            onChange={handleChange}
          >
            <option value="General Merchandise">General Merchandise</option>
            <option value="Perishable Goods">Perishable Goods</option>
            <option value="Hazardous Materials">Hazardous Materials</option>
            <option value="Electronics/Sensitive Equipment">Electronics/Sensitive Equipment</option>
            <option value="Industrial/Construction Materials">
              Industrial/Construction Materials
            </option>
          </select>
        </div>
      </div>
    </div>
  );
};

export default WareHouseFeatures;
