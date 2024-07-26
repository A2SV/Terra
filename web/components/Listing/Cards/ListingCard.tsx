import React from "react";
import Image from "next/image";
// import bedIcon from "@/public/bed_icon.svg";
// import showerIcon from "@/public/shower_icon.svg";
import constructionIcon from "@/public/construction_icon.svg";
import ListingProfile from "@/public/ListingProfile.svg";
import { HiOutlineLocationMarker, HiOutlineBookmark } from "react-icons/hi";
import { IoIosAddCircleOutline } from "react-icons/io";
import { RiExpandDiagonalLine } from "react-icons/ri";
import Link from "next/link";
import Carousel from "@/components/Carousel/Carousel";
import { Listing } from "@/types/listingTypes";

interface ListingCardProps {
  item: Listing;
}
const propertyTypeMapping: { [key: number]: string } = {
  0: "Residential",
  1: "Commercial",
};

const propertySubTypeMapping: { [key: number]: string } = {
  0: "House",
  1: "Apartment",
  2: "Student Hostel",
  3: "Hotel",
  4: "Guest House",
  5: "Office Space",
  6: "Shop",
  7: "Warehouse",
  8: "Event Space",
};

const listingTypeMapping: { [key: number]: string } = {
  0: "For Rent",
  1: "For Sale",
};

const getTextFromMapping = (value: number, mapping: { [key: number]: string }): string => {
  return mapping[value] || "Unknown";
};

const ListingCard: React.FC<ListingCardProps> = ({ item }) => {
  return (
    <div className="md:w-[400px] w-[345.75px]  h-[455px] md:h-[480px] my-4 me-auto ms-auto  flex justify-center ">
      <div className="md:w-[400px] w-[382.75px] h-[480px]   bg-white rounded-3xl  mx-2">
        <div className="picture relative overflow-x-hidden rounded-3xl">
          <Carousel images={item.propertyPhotos.map((photo) => photo.url)} />
          <div className="flex justify-center items-center absolute top-4 font-nunito left-5 bg-yellow-600 opacity-80 text-white rounded text-[13px] w-[72px] pt-[2px]">
            {getTextFromMapping(item.propertyType, propertyTypeMapping)}
          </div>

          <div className="flex justify-center items-center absolute top-4 right-5 font-nunito bg-slate-700 text-white rounded text-[13px] w-[68px] pt-[2px]">
            {getTextFromMapping(item.listingType, listingTypeMapping)}
          </div>

          <div className="details flex items-center w-full absolute bottom-4 justify-between">
            <Image
              src={ListingProfile}
              alt="Single Listing Profile"
              className="ml-5 size-10 transform transition-transform duration-300 hover:translate-y-1 hover:scale-105 "
            />
            <div className="actions flex space-x-1 mr-5">
              <div className="bottom-5 size-9 text-white hover:bg-white hover:text-black bg-black opacity-75 rounded-md flex justify-center items-center">
                <HiOutlineBookmark className="size-5" />
              </div>
              <div className="bottom-5 size-9 bg-black text-white hover:bg-white hover:text-black opacity-75 rounded-md flex justify-center items-center">
                <RiExpandDiagonalLine className="size-5" />
              </div>
              <div className="bottom-5 size-9 bg-black text-white hover:bg-white hover:text-black opacity-75 rounded-md flex justify-center items-center">
                <IoIosAddCircleOutline className="size-5" />
              </div>
            </div>
          </div>
        </div>
        <Link href="">
          <div className="p-2 pl-1 pr-1 flex justify-between">
            <div className="pl-4 ">
              <h2 className="font-nunito font-bold text-[24px] text-btnColor">
                ${item.paymentInformation.cost}
              </h2>
            </div>
            <p className="my-auto text-slate-400 font-nunito font-bold pr-4 text-sm">
              {getTextFromMapping(item.propertyType, propertySubTypeMapping)}
            </p>
          </div>

          <div className="pl-4 pt-0">
            <h2 className="font-nunito font-bold text-lg text-gray-700">{item.title}</h2>
          </div>
          <div className="flex pl-4 pr-3 my-2">
            <HiOutlineLocationMarker className="mr-2 w-5 h-5 text-slate-400" />
            <p className="text-[15px] text-slate-400 font-nunito font-bold">
              {item.propertyLocation.city} | {item.propertyLocation.streetName}
            </p>
          </div>

          <div className="flex pl-4 space-x-5">
            {/* <div className="flex space-x-2 justify-center items-center">
              <Image src={bedIcon} alt="bed" className="size-5" />
              <p className="font-nunito font-bold text-base text-gray-700 pt-1">3</p>
            </div>
            <div className="flex space-x-2 justify-center items-center">
              <Image src={showerIcon} alt="shower" className="size-5" />
              <p className="font-nunito font-bold text-base text-gray-700 pt-1">2</p>
            </div> */}
            <div className="flex space-x-2 justify-center items-center">
              <Image src={constructionIcon} alt="construction" className="size-5" />
              <p className="font-nunito font-bold text-base text-gray-700 pt-2">
                {item.propertySize} sq.ft
              </p>
            </div>
          </div>
        </Link>
      </div>
    </div>
  );
};

export default ListingCard;
