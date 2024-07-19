"use client";
import React, { useState } from "react";
import Image from "next/image";

const ResultsListBackgroundImage = () => {
  const [rentOrSale, setRentOrSale] = useState("all");
  return (
    <div className="relative w-screen h-listHeight">
      <div className="relative w-screen h-72">
        <Image
          src="/listing_images/list-bg.svg"
          className="object-cover w-full h-full"
          layout="fill"
          alt="results list"
        />
      </div>

      <div className="absolute inset-0 flex flex-col justify-center items-center font-pops">
        <h1 className="text-4xl text-white font-nunito font-semibold">Advanced Search</h1>
        <p className="text-white mt-2 font-nunito">
          Apply a plethora of filters to obtain your perfect match
        </p>

        <div className="flex space-x-0.5 mt-10 -mb-1 font-pops font-medium text-xs ">
          <button
            className={`px-6 pt-2 pb-3 rounded-sm transition-all duration-300 ${rentOrSale === "all" ? "bg-white text-black" : "bg-terraOrange text-white"}`}
            onClick={() => setRentOrSale("all")}
          >
            All
          </button>
          <button
            className={`px-6 pt-2 pb-3 rounded-sm transition-all duration-300 ${rentOrSale === "rent" ? "bg-white text-black" : "bg-terraOrange text-white"}`}
            onClick={() => setRentOrSale("rent")}
          >
            For Rent
          </button>
          <button
            className={`px-6 pt-2 pb-3 rounded-sm transition-all duration-300 ${rentOrSale === "sale" ? "bg-white text-black" : "bg-terraOrange text-white"}`}
            onClick={() => setRentOrSale("sale")}
          >
            For Sale
          </button>
        </div>

        <div className="w-4/5 flex flex-col max-w-5xl mx-auto gap-2 bg-white p-6 rounded-md shadow-lg font-pops text-xs">
          <div className="flex gap-2">
            <input
              type="text"
              placeholder="Location"
              className="border placeholder-black p-2 pr-6 rounded w-2/6 focus:outline-none focus:border-gray-200"
            />
            <select className="custom-select-single border p-2 rounded w-1/6 focus:outline-none focus:border-gray-200">
              <option>All Cities</option>
              <option>All Cities</option>
              <option>All Cities</option>
            </select>
            <select className="custom-select-single border p-2 rounded w-1/6 focus:outline-none focus:border-gray-200">
              <option>All Types</option>
              <option>All Types</option>
              <option>All Types</option>
            </select>
            <select className="custom-select-double border p-2 rounded w-1/6 focus:outline-none focus:border-gray-200">
              <option>Bedrooms</option>
              <option>Bedrooms</option>
              <option>Bedrooms</option>
            </select>
            <select className="custom-select-double border p-2 rounded w-1/6 focus:outline-none focus:border-gray-200">
              <option>Bathrooms</option>
              <option>Bathrooms</option>
              <option>Bathrooms</option>
            </select>
          </div>

          <div className="flex gap-2">
            <select className="custom-select-double border p-2 rounded w-1/6 focus:outline-none focus:border-gray-200">
              <option>Min. Price</option>
              <option>$100</option>
              <option>$200</option>
            </select>
            <select className="custom-select-double border p-2 rounded w-1/6 focus:outline-none focus:border-gray-200">
              <option>Max. Price</option>
              <option>$2000</option>
              <option>$3000s</option>
            </select>
            <input
              type="text"
              placeholder="Min. Area"
              className="border placeholder-black p-2 rounded w-1/6 focus:outline-none focus:border-gray-200"
            />
            <input
              type="text"
              placeholder="Max. Area"
              className="border placeholder-black p-2 rounded w-1/6 focus:outline-none focus:border-gray-200"
            />
            <select className="custom-select-single border p-2 pr-4 text-black rounded w-1/6 focus:outline-none focus:border-gray-200">
              <option>Negotiability</option>
              <option>Negotiability</option>
              <option>Negotiability</option>
            </select>
            <button className=" text-white bg-terrablue p-2 rounded-sm w-1/6">Search</button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ResultsListBackgroundImage;
