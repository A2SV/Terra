import React from "react";
import Image from "next/image";
import Listing1 from "@/public/listing1.png";
import { HiOutlineLocationMarker, HiOutlineBookmark } from "react-icons/hi";
import { GoDotFill } from "react-icons/go";
import Link from "next/link";

const ListingCard = () => {
  return (
    <div className="w-[345.75px] h-[450px]">
      <Link href="/">
        <div className="w-[345.75px] h-[450px] bg-white rounded-3xl hover:shadow-xl mx-2 transform transition-transform duration-300 hover:translate-y-1 hover:scale-105">
          <Image src={Listing1} alt="post" className="rounded-3xl h-[249.26px]" />

          <div className="p-3 pl-1 pr-1 flex justify-between">
            <div className="flex justify-center items-center pr-3">
              <HiOutlineLocationMarker className="mr-2 w-5 h-5 text-gray-400" />
              <p className="text-base text-gray-400 font-nunito font-bold">Accra | Taifa</p>
            </div>

            <div className="pt-0.5">
              <HiOutlineBookmark className="w-5 h-5 text-gray-400" />
            </div>
          </div>

          <div className="pl-2 pt-0">
            <h2 className="font-nunito font-bold text-xl">
              Beautiful home located in Taifa, Burkina
            </h2>
          </div>

          <div className="pl-2 pt-2">
            <h2 className="font-nunito font-extrabold text-[26.82px] text-listingBlue">$321,347</h2>
          </div>

          <div className="flex pt-3 pl-2">
            <p className="font-nunito font-normal text-base text-gray-400">3 beds</p>
            <div className="flex items-center justify-center px-2">
              <GoDotFill className="w-[9px] h-[9px] fill-listingBlue" />
            </div>
            <p className="font-nunito font-normal text-base text-gray-400">3 bathrooms</p>
            <div className="flex items-center justify-center px-2">
              <GoDotFill className="w-[9px] h-[9px] fill-listingBlue" />
            </div>
            <p className="font-nunito font-normal text-base text-gray-400">500 acres</p>
          </div>
        </div>
      </Link>
    </div>
  );
};

export default ListingCard;
