"use client";

import React, { useState } from "react";

const Select = () => {
  const [activeItem, setActiveItem] = useState("Apartments");

  const items = [
    "Apartments",
    "Hotels",
    "Hostels",
    "House",
    "Guest House",
    "Office space",
    "Shops",
    "Event Space",
    "Warehouse",
  ];

  const handleItemClick = (item: string) => {
    setActiveItem(item);
  };

  return (
    <div className="lg:mx-24 mx-10 md:h-[60px] h-[100px]  lg:mt-10 flex flex-col ml-3 md:mt-[130px] mt-[180px] ">
      <div>
        <h2 className="font-nunito text-[26px] font-bold px-5 text-lg md:text-2xl lg:text-3xl">Select from a variety of suites</h2>
      </div>
      <div className="flex justify-between  mt-4">
        <div className="flex overflow-x-scroll scrollbar-hide justify-start items-start ">
          <ul className="flex flex-row justify-center items-center">
            {items.map((item, index) => (
              <li
                key={index}
                className={`hover:text-terrablue cursor-pointer ${
                  item === "Guest House" || item === "Office space" || item === "Event Space"
                    ? "w-[140px]"
                    : "w-auto"
                } px-4 font-nunito text-[16px] ${activeItem === item ? "text-[#1779F3] underline decoration-blue-[#1779F3] underline-offset-4" : "text-black"}`}
                onClick={() => handleItemClick(item)}
              >
                {item}
              </li>
            ))}
          </ul>
        </div>
      </div>
    </div>
  );
};

export default Select;
