"use client";
import houseIcon from "@/public/houseIcon.svg";
import angle from "@/public/angle.svg";
import locationIcon from "@/public/locationIcon.svg";
import bookmarkIcon from "@/public/bookmarkIcon.svg";
import shareIcon from "@/public/shareIcon.svg";
import printIcon from "@/public/printIcon.svg";
import bedIcon2 from "@/public/bedIcon2.svg";
import showerIcon2 from "@/public/showerIcon2.svg";
import carIcon from "@/public/carIcon.svg";
import rulerIcon from "@/public/rulerIcon.svg";
import calendarIcon from "@/public/calendarIcon.svg";
import Image from "next/image";
import DetailCarousel from "@/components/Silders/DetailCarousel/DetailCarousel";
import ListDescription from "@/components/Listing/ListDesc";
import Review from "@/components/Listing/Review";
// import ListingCard from "@/components/Listing/Cards/ListingCard";
import { FaChevronLeft, FaChevronRight } from "react-icons/fa6";
const HeroListing = () => {
  const images = [
    "https://images.unsplash.com/photo-1522050212171-61b01dd24579?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3Ds",
    "https://images.unsplash.com/photo-1483097365279-e8acd3bf9f18?q=80&w=1411&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1494526585095-c41746248156?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

  return (
    <div>
      <div className="mt-[88px]">
        <div className="flex justify-between pt-[50px]">
          <div>
            <nav className="flex pl-[92px] font-roboto text-sm ">
              <ol className="flex">
                <li className="flex justify-center items-center text-btnColor">
                  <Image src={houseIcon} alt="house" className="size-4 mr-3 mt-o" />
                  Home
                </li>
                <li className="flex justify-center items-center text-btnColor">
                  <Image src={angle} alt="angle" className="size-8" />
                  Apartment
                </li>
                <li className="flex justify-center items-center text-breadCrumb">
                  <Image src={angle} alt="angle" className="size-8 " />
                  Light and modern apartment
                </li>
              </ol>
            </nav>
            <div className="pl-[92px] pt-3 text-3xl text-listingBlack">
              Light And Modern Apartment
            </div>
            <div className="flex pl-[92px] pt-3 space-x-1">
              <button className="bg-terraLemon text-xs text-white px-2 rounded-sm">FEATURED</button>
              <button className="bg-listingGray text-xs p-1 text-white px-2 rounded-sm">
                FOR RENT
              </button>
            </div>
            <div className="flex pt-4 items-center text-sm pl-[90px]">
              <Image src={locationIcon} alt="location" className="size-4 mr-2 text-lightGray" />
              <p className="text-lightGray">2436 SW 8th St, Miami, FL 33135, USA</p>
            </div>
          </div>
          <div className="pr-32">
            <div className="flex space-x-1 pl-10 pb-3">
              <Image src={bookmarkIcon} alt="bookmark" className="size-8 text-lightGray" />
              <Image src={shareIcon} alt="share" className="size-8 text-lightGray" />
              <Image src={printIcon} alt="print" className="size-8 text-lightGray" />
            </div>
            <p className="font-roboto text-3xl font-semibold">$4,500/mo</p>
          </div>
        </div>

        <div className="">
          <div className="w-[72%]">
            <div className="overflow-x-hidden w-[790px] ml-[92px] mt-6">
              <DetailCarousel images={images} />
            </div>
            <div className="flex flex-col ml-[92px] w-[790px] h-[215px] bg-white mt-8 mb-3 rounded-md px-10">
              <div className="flex justify-between mt-10 items-center">
                <p className="text-lg font-roboto">Overview</p>
                <p className="text-base font-roboto">
                  <strong>Property</strong>:HZ40
                </p>
              </div>
              <div className="border-[1px] border-slate-200 mt-9"></div>

              <div className="flex mt-6 space-x-12 items-end">
                <div className="flex flex-col">
                  <p className="font-roboto font-semibold text-listingBlack">Apartment</p>
                  <p className="font-light font-roboto text-terragray text-sm">Property Type</p>
                </div>

                <div className="flex flex-col">
                  <div className="flex items-center space-x-2 pb-[1px]">
                    <Image src={bedIcon2} alt="bedIcon2" className="size-[18px]" />
                    <p className="text-base font-roboto text-listingBlack font-semibold">4</p>
                  </div>
                  <p className="font-light font-roboto text-terragray text-sm">Bedrooms</p>
                </div>

                <div className="flex flex-col">
                  <div className="flex items-center space-x-2 pb-[1px]">
                    <Image src={showerIcon2} alt="bedIcon2" className="size-[18px]" />
                    <p className="text-base font-roboto text-listingBlack font-semibold">2</p>
                  </div>
                  <p className="font-light font-roboto text-terragray text-sm">Bathrooms</p>
                </div>

                <div className="flex flex-col">
                  <div className="flex items-center space-x-2 pb-[1px]">
                    <Image src={carIcon} alt="bedIcon2" className="size-[18px]" />
                    <p className="text-base font-roboto text-listingBlack font-semibold">1</p>
                  </div>
                  <p className="font-light font-roboto text-terragray text-sm">Garage</p>
                </div>

                <div className="flex flex-col">
                  <div className="flex items-center space-x-2 pb-[1px]">
                    <Image src={rulerIcon} alt="bedIcon2" className="size-[18px]" />
                    <p className="text-base font-roboto text-listingBlack font-semibold">1200</p>
                  </div>
                  <p className="font-light font-roboto text-terragray text-sm">Sq m</p>
                </div>

                <div className="flex flex-col">
                  <div className="flex items-center space-x-2 pb-[1px]">
                    <Image src={calendarIcon} alt="bedIcon2" className="size-[18px]" />
                    <p className="text-base font-roboto text-listingBlack font-semibold">2016</p>
                  </div>
                  <p className="font-light font-roboto text-terragray text-sm">Year Built</p>
                </div>
              </div>
            </div>
            <div className="w-[790px] ml-[92px]">
              <ListDescription />
              <Review />
              <div className="flex justify-center space-x-2 my-40">
                <button className="size-10 bg-white text-sky-500 text-lg flex items-center justify-center rounded ">
                  <FaChevronLeft />
                </button>
                <button className="size-10 bg-white text-sky-500 text-lg flex items-center justify-center rounded ">
                  <FaChevronRight />
                </button>
              </div>
            </div>
          </div>
          <div className="w-[28%]"></div>
          <div className="flex flex-wrap w-[80%] justify-center mb-60">{/* <ListingCard /> */}</div>
        </div>
      </div>
    </div>
  );
};

export default HeroListing;
