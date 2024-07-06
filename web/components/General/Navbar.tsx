"use client";

import React, { useState } from "react";
import Image from "next/image";
import HamburgerMenu from "./Hamburger";

const Navbar = () => {
  const [activeItem, setActiveItem] = useState("Home");

  const handleItemClick = (item: string) => {
    setActiveItem(item);
  };

  return (
    <div>
      <div className="flex flex-row justify-between w-full h-16 py-2 lg:px-8 px-4 pt-2">
        <div>
          <Image src="/TERRA.svg" alt="Logo" height={64} width={70} className="object-cover" />
        </div>
        <div className="lg:flex flex-row items-end hidden ">
          <nav>
            <ul className="flex flex-row">
              {["Home", "Search", "Student", "About us", "Contact us"].map((item) => (
                <li
                  key={item}
                  className={`px-4  ${activeItem === item ? "text-[#03045E]" : "text-black"}`}
                  onClick={() => handleItemClick(item)}
                >
                  {item}
                </li>
              ))}
            </ul>
          </nav>
        </div>
        <div className="flex flex-row">
          <div className="flex flex-row  ">
            <Image
              src="/header_image.jpg"
              alt="avatar"
              height={50}
              width={50}
              className="object-cover  rounded-full"
            />
            <p className="lg:flex hidden items-center px-4">
              Daniel Shimelis <span className="text-[24px] pl-3"> &#124;</span>
            </p>
          </div>
          <div className="lg:flex hidden items-center">
            <button className="bg-[#1779F3] text-white font-semibold text-[13px] px-7 py-3 rounded-[25px] ">
              Custom Listing
            </button>
          </div>
          <HamburgerMenu />
        </div>
      </div>
    </div>
  );
};

export default Navbar;
