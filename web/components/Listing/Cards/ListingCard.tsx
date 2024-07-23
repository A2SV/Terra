import React from "react";
import Image from "next/image";
import bedIcon from "@/public/bed_icon.svg";
import showerIcon from "@/public/shower_icon.svg";
import constructionIcon from "@/public/construction_icon.svg";
import ListingProfile from "@/public/ListingProfile.svg";
import { HiOutlineLocationMarker, HiOutlineBookmark } from "react-icons/hi";
import { IoIosAddCircleOutline } from "react-icons/io";
import { RiExpandDiagonalLine } from "react-icons/ri";
import Link from "next/link";
import Carousel from "@/components/Carousel/Carousel";

const ListingCard = () => {
  const images = [
    "https://images.unsplash.com/photo-1522050212171-61b01dd24579?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3Ds",
    "https://images.unsplash.com/photo-1483097365279-e8acd3bf9f18?q=80&w=1411&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];
  return (
    <div className="w-[345.75px]  h-[455px] my-4 me-auto ms-auto  flex justify-center ">
      <div className="w-[382.75px]  h-[455px]  bg-white rounded-3xl hover:shadow-xl mx-2">
        <div className="picture relative overflow-x-hidden rounded-3xl">
          <Carousel images={images} />
          <div className="flex justify-center items-center absolute top-4 font-nunito left-5 bg-yellow-600 opacity-80 text-white rounded text-[13px] w-[72px] pt-[2px]">
            Featured
          </div>

          <div className="flex justify-center items-center absolute top-4 right-5 font-nunito bg-slate-700 text-white rounded text-[13px] w-[68px] pt-[2px]">
            For Rent
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
              <h2 className="font-nunito font-bold text-[24px] text-btnColor">$321,347</h2>
            </div>
            <p className="my-auto text-slate-400 font-nunito font-bold pr-4 text-sm">Apartment</p>
          </div>

          <div className="pl-4 pt-0">
            <h2 className="font-nunito font-bold text-lg text-gray-700">
              Beautiful home located in Taifa
            </h2>
          </div>
          <div className="flex pl-4 pr-3 my-2">
            <HiOutlineLocationMarker className="mr-2 w-5 h-5 text-slate-400" />
            <p className="text-[15px] text-slate-400 font-nunito font-bold">Accra | Taifa</p>
          </div>

          <div className="flex pl-4 space-x-5">
            <div className="flex space-x-2 justify-center items-center">
              <Image src={bedIcon} alt="bed" className="size-5" />
              <p className="font-nunito font-bold text-base text-gray-700 pt-1">3</p>
            </div>
            <div className="flex space-x-2 justify-center items-center">
              <Image src={showerIcon} alt="shower" className="size-5" />
              <p className="font-nunito font-bold text-base text-gray-700 pt-1">2</p>
            </div>
            <div className="flex space-x-2 justify-center items-center">
              <Image src={constructionIcon} alt="construction" className="size-5" />
              <p className="font-nunito font-bold text-base text-gray-700 pt-2">3000 sq.ft</p>
            </div>
          </div>
        </Link>
      </div>
    </div>
  );
};

export default ListingCard;
