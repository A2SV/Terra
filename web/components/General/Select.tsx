"use client";

import { MdOutlineArrowCircleRight } from "react-icons/md";
import React, { useState, useEffect } from "react";

const Select = () => {
  const [activeItem, setActiveItem] = useState("Apartments");
  const [showAll, setShowAll] = useState(false);
  const [screenSize, setScreenSize] = useState(getScreenSize());

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
  const visibleItemsCount = showAll ? items.length : { lg: 9, md: 4, sm: 3 }[screenSize] || 0;

  function getScreenSize() {
    if (typeof window !== "undefined") {
      if (window.innerWidth >= 1024) return "lg";
      if (window.innerWidth >= 768) return "md";
      return "sm";
    }
    return "lg";
  }

  useEffect(() => {
    const handleResize = () => {
      setScreenSize(getScreenSize());
    };

    window.addEventListener("resize", handleResize);

    // Cleanup the event listener on component unmount
    return () => {
      window.removeEventListener("resize", handleResize);
    };
  }, []);

  const handleItemClick = (item: React.SetStateAction<string>) => {
    setActiveItem(item);
  };

  const toggleShowAll = () => {
    setShowAll(!showAll);
  };

  return (
    <div className="md:mx-24 h-[230px] lg:mt-10 flex flex-col  md:mt-[160px] mt-[210px] px-5 ">
      <div>
        <p className="font-nunito text-[26px] font-bold px-5">Select from a variety of suites</p>
      </div>
      <div className="flex flex-row justify-between items-center mt-8">
        <div>
          <ul className="flex flex-wrap">
            {items.slice(0, visibleItemsCount).map((item, index) => (
              <li
                key={index}
                className={`px-5 font-nunito text-[16px] ${activeItem === item ? "text-[#1779F3]" : "text-black"} ${showAll || index < visibleItemsCount ? "" : "hidden"}`}
                onClick={() => handleItemClick(item)}
              >
                {item}
              </li>
            ))}
          </ul>
        </div>
        <div className="flex justify-center items-center">
          <button
            className="bg-[#1779F3] text-white font-semibold text-[13px]  py-[8px] rounded-[25px] w-[130px] md:block hidden"
            onClick={toggleShowAll}
          >
            <div className="flex flex-row items-center justify-center">
              <MdOutlineArrowCircleRight size={20} />
              <p className="pl-3 font-nunito text-center">{showAll ? "View Less" : "View All"}</p>
            </div>
          </button>

          <p className="text-[#1779F3] md:hidden flex cursor-pointer" onClick={toggleShowAll}>
            {showAll ? "Hide" : "View All"}
          </p>
        </div>
        {showAll && (
          <ul className="flex flex-wrap mt-4">
            {items.slice(visibleItemsCount).map((item, index) => (
              <li
                key={index}
                className={`px-5 font-nunito text-[16px] ${activeItem === item ? "text-[#1779F3]" : "text-black"}`}
                onClick={() => handleItemClick(item)}
              >
                {item}
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  );
};

export default Select;
