import React from "react";
import Image from "next/image";
import header from "../../public/add_listing_screen/header.svg";

const Header: React.FC = () => {
  return (
    <>
      <nav className="px-10 mb-12">
        <ul className="flex space-x-4 font-nunito text-sm font-bold mb-1">
          <li className="text-blue border-b-2 border-blue">
            <a href="#">Add New</a>
          </li>
          <li className="text-black">
            <a href="#">My Listings</a>
          </li>
          <li className="text-black">
            <a href="#">Favorites</a>
          </li>
          <li className="text-black ">
            <a href="#">Messages</a>
          </li>
          <li className="text-black ">
            <a href="#">Settings</a>
          </li>
        </ul>
        <div>
          <Image src={header} alt="header" className="w-full" width={100} height={40} />
        </div>
      </nav>
      <div className="font-nunito px-10 text-black">
        <p className="font-bold text-lg">Add Listing</p>
        <p className="text-sm">
          Click here to read about the{" "}
          <a href="#" className="text-blue underline">
            rules
          </a>{" "}
          for listing property
        </p>
      </div>
    </>
  );
};

export default Header;
