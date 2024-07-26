"use client";

import { Avatar } from "flowbite-react";
import { FiPlusCircle, FiFileText, FiMessageSquare } from "react-icons/fi";
import { MdOutlineFavoriteBorder } from "react-icons/md";
import { GiSettingsKnobs } from "react-icons/gi";
import { GrPowerShutdown } from "react-icons/gr";
import { useState, useEffect } from "react";
import Link from "next/link";

export function ProfilePic() {
  const [isHovering, setIsHovering] = useState(false);
  const [isDropdownVisible, setIsDropdownVisible] = useState(false);

  const handleMouseEnter = () => {
    setIsHovering(true);
    setIsDropdownVisible(true);
  };

  const handleMouseLeave = () => {
    setIsHovering(false);
    setTimeout(() => {
      if (!isHovering) {
        setIsDropdownVisible(false);
      }
    }, 3000);
  };

  useEffect(() => {
    let timer: string | number | NodeJS.Timeout | undefined;
    if (!isHovering) {
      timer = setTimeout(() => {
        setIsDropdownVisible(false);
      }, 3000);
    }
    return () => clearTimeout(timer);
  }, [isHovering]);

  return (
    <div
      className="relative flex justify-start cursor-pointer"
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
    >
      <Avatar alt="User settings" img="/header_image.jpg" rounded />
      {isDropdownVisible && (
        <div className="absolute top-full mt-2 z-10 w-48 bg-white border rounded-lg shadow-lg ">
          <div className="dropdown-menu rounded-lg">
            <div className="dropdown-item flex items-center px-4 py-2 hover:bg-gray-100 cursor-pointer rounded-t-lg">
              <FiPlusCircle className="mr-3" /> <p className="text-[14px]"> Add Listings </p>
            </div>
            <div className="dropdown-item flex items-center px-4 py-2 hover:bg-gray-100 cursor-pointer">
              <FiFileText className="mr-3" />
              <p className="text-[14px]"> My Listings </p>
            </div>
            <div className="dropdown-item flex items-center px-4 py-2 hover:bg-gray-100 cursor-pointer">
              <FiMessageSquare className="mr-3" /> <p className="text-[14px]"> Messages </p>
            </div>
            <div className="dropdown-item flex items-center px-4 py-2 hover:bg-gray-100 cursor-pointer">
              <MdOutlineFavoriteBorder className="mr-3" />{" "}
              <p className="text-[14px]"> Favourites </p>
            </div>
            <div className="dropdown-item flex items-center px-4 py-2 hover:bg-gray-100 cursor-pointer">
              <GiSettingsKnobs className="mr-3" />
              <p className="text-[14px]"> Settings </p>
            </div>
            <div className="border-t my-2"></div>
            <Link href="/auth">
              <div className="dropdown-item flex items-center px-4 py-2 hover:bg-gray-100 cursor-pointer rounded-b-lg">
                <GrPowerShutdown className="mr-3" /> <p className="text-[14px]"> Sign out </p>
              </div>
            </Link>
          </div>
        </div>
      )}
    </div>
  );
}
