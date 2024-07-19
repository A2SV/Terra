"use client";
import * as React from "react";
import Box from "@mui/material/Box";
import Slider from "@mui/material/Slider";
import { useState } from "react";

function valuetext(value: number) {
  return `${value}°C`;
}

const AdvancedListingSettings = () => {
  const [landSize, setLandSize] = React.useState<number[]>([200, 4000]);
  const [priceRange, setPriceRange] = useState([200, 4000]);

  const handleLandSizeChange = (event: Event, newValue: number | number[]) => {
    setLandSize(newValue as number[]);
  };

  const handlePriceRangeChange = (event: Event, newValue: number | number[]) => {
    setPriceRange(newValue as number[]);
  };

  return (
    <div className="bg-gray-100">
      <div className="w-10/12 h-20 flex justify-between items-center mx-auto space-x-4 p-4 font-nunito text-xs rounded">
        <div className="w-1/4 flex flex-col space-y-3 mb-1 border-gray-400 border-r-2 pr-5">
          <label htmlFor="amenities" className="font-bold">
            Amenities
          </label>
          <input
            id="amenities"
            type="text"
            placeholder="Enter keyword"
            className="w-11/12 font-nunito border px-2 py-2 rounded focus:outline-none focus:border-gray-200"
          />
        </div>

        <div className="w-1/4 flex flex-col space-y-1 border-gray-400 border-r-2">
          <div className="w-4/5 flex flex-row justify-between items-center mx-auto">
            <label className="font-bold">Land size</label>
            <div className="ml-4 bg-white p-1 rounded border text-gray-600">
              {landSize[0]} - {landSize[1]} sqm
            </div>
          </div>
          <div className="flex justify-between items-center mx-auto">
            <Box sx={{ width: 200 }}>
              <Slider
                className="text-terraOrange"
                getAriaLabel={() => "Land size range"}
                value={landSize}
                onChange={handleLandSizeChange}
                valueLabelDisplay="auto"
                getAriaValueText={valuetext}
                min={200}
                max={4000}
              />
            </Box>
          </div>
        </div>

        <div className="w-1/4 flex flex-col space-y-2 border-gray-400 border-r-2 ">
          <div className="w-4/5 flex flex-row justify-between items-center mx-auto">
            <label className="font-bold">Price Range</label>
            <div className="ml-4 bg-white p-1 rounded border text-gray-600">
              ${priceRange[0]} - ${priceRange[1]}
            </div>
          </div>
          <div className="flex justify-between items-center mx-auto">
            <Box sx={{ width: 200 }}>
              <Slider
                className="text-terraOrange"
                getAriaLabel={() => "Price range"}
                value={priceRange}
                onChange={handlePriceRangeChange}
                valueLabelDisplay="auto"
                getAriaValueText={valuetext}
                min={200}
                max={4000}
              />
            </Box>
          </div>
        </div>

        <div className="w-1/4 ml-20">
          <button className="w-40 h-9 text-white font-medium bg-terrablue p-2 rounded-sm ml-7">
            Search
          </button>
        </div>
      </div>
    </div>
  );
};

export default AdvancedListingSettings;
