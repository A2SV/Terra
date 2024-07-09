import React from "react";
import Image from "next/image";
import Listing1 from "@/public/listing1.png";
import ListingProfile from "@/public/ListingProfile.svg";
import bedIcon from "@/public/bed_icon.svg";
import showerIcon from "@/public/shower_icon.svg";
import constructionIcon from "@/public/construction_icon.svg";
import { HiOutlineLocationMarker, HiOutlineBookmark } from "react-icons/hi";
import { IoIosAddCircleOutline } from "react-icons/io";
import { RiExpandDiagonalLine } from "react-icons/ri";
import Link from "next/link";

const ListingCard = () => {
  return (
    <div className="w-[345.75px] h-[450px] my-4 me-auto ms-auto">
      <Link href="/">
        <div className="w-[345.75px] h-[450px] bg-white rounded-3xl hover:shadow-xl mx-2 transform transition-transform duration-300 hover:translate-y-1 hover:scale-105">
          <div className="picture relative">
            <Image src={Listing1} alt="post" className="rounded-3xl h-[249.26px]" />
            <p className="absolute top-4 font-nunito left-2 bg-yellow-600 text-white px-4 rounded">
              Featured
            </p>
            <div className="details flex w-full absolute bottom-6 justify-between">
              <Image src={ListingProfile} alt="Single Listing Profile" className="ml-5" />
              <div className="actions flex space-x-1 mr-5">
                <div className="bottom-5 size-10 hover:bg-white bg-black opacity-75 rounded-md flex justify-center items-center">
                  <HiOutlineBookmark className="size-6 text-white hover:text-black" />
                </div>
                <div className="bottom-5 size-10 bg-black hover:bg-white opacity-75 rounded-md flex justify-center items-center">
                  <RiExpandDiagonalLine className="size-6 text-white hover:text-black" />
                </div>
                <div className="bottom-5 size-10 bg-black hover:bg-white opacity-75 rounded-md flex justify-center items-center">
                  <IoIosAddCircleOutline className="size-6 text-white hover:text-black" />
                </div>
              </div>
            </div>
          </div>

          <div className="p-3 pl-1 pr-1 flex justify-between">
            <div className="pl-2 pt-2">
              <h2 className="font-nunito font-extrabold text-[26.82px] text-listingBlue">
                $321,347
              </h2>
            </div>
            <p className=" my-auto text-gray-400 font-nunito font-bold">Apartment</p>
          </div>

          <div className="pl-2 pt-0">
            <h2 className="font-nunito font-bold text-xl">
              Beautiful home located in Taifa, Burkina
            </h2>
          </div>
          <div className="flex  pr-3 my-1">
            <HiOutlineLocationMarker className="mr-2 w-5 h-5 text-gray-400" />
            <p className="text-base text-gray-400 font-nunito font-bold">Accra | Taifa</p>
          </div>

          <div className="flex pt-3 pl-2 space-x-6">
            <div className="bed flex space-x-4">
              <Image src={bedIcon} alt="bed icon" />
              <p className="font-nunito font-normal text-base text-gray-400">3</p>
            </div>
            <div className="shower flex space-x-4">
              <Image src={showerIcon} alt="bed icon" />
              <p className="font-nunito font-normal text-base text-gray-400">2</p>
            </div>
            <div className="construction flex space-x-4">
              <Image src={constructionIcon} alt="bed icon" />
              <p className="font-nunito font-normal text-base text-gray-400">3000 sq.ft</p>
            </div>
          </div>
        </div>
      </Link>
    </div>
  );
};

export default ListingCard;
