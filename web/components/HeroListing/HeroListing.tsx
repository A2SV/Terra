"use client";
import React, { useState } from "react";
import houseIcon from "@/public/houseIcon.svg";
import angle from "@/public/angle.svg";
import locationIcon from "@/public/locationIcon.svg";
import bookmarkIcon from "@/public/bookmarkIcon.svg";
import shareIcon from "@/public/shareIcon.svg";
import printIcon from "@/public/printIcon.svg";
import listImg from "@/public/listImg.jpeg";
import proIcon from "@/public/proIcon.svg";
import whatsappIcon from "@/public/whatsappIcon.svg";
import bedIcon2 from "@/public/bedIcon2.svg";
import showerIcon2 from "@/public/showerIcon2.svg";
import carIcon from "@/public/carIcon.svg";
import rulerIcon from "@/public/rulerIcon.svg";
import calendarIcon from "@/public/calendarIcon.svg";
import Image from "next/image";
import DetailCarousel from "@/components/DetailCarousel/DetailCarousel";

const HeroListing = () => {
  const images = [
    "https://images.unsplash.com/photo-1522050212171-61b01dd24579?q=80&w=1480&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3Ds",
    "https://images.unsplash.com/photo-1483097365279-e8acd3bf9f18?q=80&w=1411&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1494526585095-c41746248156?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

  const [isChecked, setIsChecked] = useState(false);

  const handleCheckboxChange = () => {
    setIsChecked(!isChecked);
  };

  return (
    <div>
      <div className="bg-slate-200 mt-[88px] h-full">
        <div className="flex justify-between pt-[50px]">
          <div>
            <nav className="flex pl-[92px] font-roboto text-sm ju">
              <ol className="flex">
                <li className="flex ustify-center items-center text-btnColor">
                  <Image src={houseIcon} alt="house" className="size-4 mr-3 mt-o" />
                  Home
                </li>
                <li className="flex justify-center items-center text-btnColor">
                  <Image src={angle} alt="angle" className="size-8" />
                  Apartment
                </li>
                <li className="flex ustify-center items-center text-breadCrumb">
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

        <div className="flex">
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
          </div>
          <div className="w-[28%]">
            <div className="w-[326px] h-[650px] pr-1 mb-4 bg-white mt-6 rounded-md sticky top-2">
              <div className="flex px-7 pt-10 items-center">
                <Image src={listImg} alt="listImg" className="size-[72px] rounded-md" />
                <div className="flex flex-col">
                  <div className="flex h-6 justify-center items-center ml-3 space-x-2">
                    <Image src={proIcon} alt="proIcon" className="size-4" />
                    <p className="text-base font-nunito">Brittany Watkins</p>
                  </div>
                  <div className="ml-3 font-nunito text-base text-listBlue">View Listings</div>
                </div>
              </div>
              <form className="flex flex-col mt-3 mx-7">
                <div>
                  <label>
                    <input
                      type="text"
                      placeholder="Name"
                      className="w-[270px] font-nunito h-10 border border-gray-300 rounded-md text-sm pl-2 mb-4 focus:outline-none focus:border-slate-400 focus:shadow-md focus:ring-slate-400"
                    />
                  </label>
                </div>
                <div>
                  <label>
                    <input
                      type="text"
                      placeholder="Phone"
                      className="w-[270px] font-nunito h-10 border border-gray-300 rounded-md text-sm pl-2 mb-4 focus:outline-none focus:border-slate-400 focus:shadow-md focus:ring-slate-400"
                    />
                  </label>
                </div>
                <div>
                  <label>
                    <input
                      type="text"
                      placeholder="Email"
                      className="w-[270px] h-10 font-nunito border border-gray-300 rounded-md text-sm pl-2 mb-4 focus:outline-none focus:border-slate-400 focus:shadow-md focus:ring-slate-400"
                    />
                  </label>
                </div>
                <div>
                  <label>
                    <input
                      type="text"
                      className="w-[270px] h-[110px] font-nunito border border-gray-300 rounded-md text-sm pl-2 mb-3 focus:outline-none focus:border-slate-400 focus:shadow-md focus:ring-slate-400"
                    />
                  </label>
                </div>
                <div>
                  <select className="custom-select-double border rounded w-[270px] h-10 mb-3 pl-2 focus:outline-none focus:border-gray-200 text-sm font-nunito">
                    <option value="" disabled hidden className="text-slate-300">
                      Select
                    </option>
                    <option value="select">Select</option>
                  </select>
                </div>
                <div className="flex">
                  <div>
                    <label>
                      <input
                        checked={isChecked}
                        onChange={handleCheckboxChange}
                        type="checkbox"
                        id="checkbox"
                        className="form-checkbox size-4 border-slate-200 rounded-md text-sm pl-2 mb-3 focus:outline-none"
                      />
                    </label>
                  </div>
                  <div className="flex flex-col ml-1">
                    <p className="pt-0.5 text-xs pb-1 font-nunito">
                      By submitting this form I agree to
                    </p>
                    <p className="text-listBlue text-xs font-nunito">Terms of Use</p>
                  </div>
                </div>
                <div className="flex flex-col">
                  <div className="flex mt-5 space-x-3">
                    <button className="border bg-terraGreen text-white text-base font-nunito w-[128px] h-[42px] rounded-md font-light">
                      Send Message
                    </button>
                    <button className="border border-terraGreen text-terraGreen text-base font-nunito w-[128px] h-[42px] rounded-md">
                      Call
                    </button>
                  </div>
                  <button className="flex justify-center items-center mt-3 border border-terraGreen text-terraGreen text-base font-nunito w-[267px] h-[42px] rounded-md font-light">
                    <i className="pr-2">
                      <Image src={whatsappIcon} alt="proIcon" className="size-4" />
                    </i>
                    WhatsApp
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default HeroListing;
