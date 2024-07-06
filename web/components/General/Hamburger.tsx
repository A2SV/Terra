import React, { useState } from "react";
import { Avatar } from "flowbite-react";

const HamburgerMenu = () => {
  const [isOpen, setIsOpen] = useState(false);

  const toggleMenu = () => {
    setIsOpen(!isOpen);
  };

  return (
    <div className="lg:hidden flex items-center pl-4">
      <button
        className="p-2 text-gray-700 rounded-md outline-none focus:border-gray-400 "
        onClick={toggleMenu}
      >
        <svg
          className="w-10 h-10"
          fill="none"
          stroke="currentColor"
          viewBox="0 0 24 24"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            strokeWidth="2"
            d="M4 6h16M4 12h16M4 18h16"
          ></path>
        </svg>
      </button>
      {isOpen && (
        <div className="fixed inset-0 bg-black bg-opacity-50 z-50">
          <div className="fixed top-0 right-0 h-full w-64 bg-gray-100 shadow-md z-50 transform transition-transform duration-300">
            <button
              className="p-2 text-gray-700 rounded-md outline-none focus:border-gray-400 "
              onClick={toggleMenu}
            >
              <svg
                className="w-10 h-10 flex "
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth="2"
                  d="M6 18L18 6M6 6l12 12"
                ></path>
              </svg>
            </button>
            <ul className="mt-2 space-y-2 bg-gray-100">
              <li className="px-4 py-2 rounded-md">
                <div className="flex flex-row">
                  <Avatar img="/header_image.jpg" alt="avatar of Jese" rounded />
                  <p className="flex items-center px-4">Daniel Shimelis</p>
                </div>
              </li>
              <li className="px-4 py-2 rounded-md">Home</li>
              <li className="px-4 py-2 rounded-md">Search</li>
              <li className="px-4 py-2 rounded-md">Student</li>
              <li className="px-4 py-2 rounded-md">About us</li>
              <li className="px-4 py-2  rounded-md">Contact us</li>
              <li className="px-4 py-2 rounded-md">
                <button className="bg-[#1779F3] text-white font-semibold text-[13px] px-7 py-3 rounded-[25px]">
                  Custom Listing
                </button>
              </li>
            </ul>
          </div>
        </div>
      )}
    </div>
  );
};

export default HamburgerMenu;
