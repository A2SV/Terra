import React from "react";
import Image from "next/image";
import HeroImage from "@/public/pyramid.png";
import HeroBack from "@/public/heroNew.png";
import { IoIosArrowDown } from "react-icons/io";
import { FiSearch } from "react-icons/fi";
import Link from "next/link";

const HeroSection: React.FC = () => {
  return (
    <div className="relative">
      <div className="flex justify-center h-screen">
        <div className="relative rounded-3xl flex w-[1280px] h-[600px] mt-[85px] mx-4 lg:mx-2">
          <div className="flex flex-col absolute inset-0 z-40 mx-[12%] sm:w-[40%] h-1/3 mt-[508px] md:mt-[480px] md:w-[60%] md:mx-40 lg:w-[64%] lg:ml-16 lg:mt-[350px]">
            <div className="flex w-[300px] h-[55px] bg-slate-200 rounded-t-3xl bg-opacity-80 md:w-[300px] lg:w-[271px] ">
              <Link href={""}>
                <div className="flex justify-center items-center bg-white bg-opacity-70 w-[100px] h-[60px] rounded-t-3xl font-nunito text-lg font-semibold hover:bg-white lg:w-[90px] lg:h-[60px]">
                  All
                </div>
              </Link>
              <Link href={""}>
                <div className="flex justify-center items-center w-[100px] h-[60px] rounded-t-3xl font-nunito text-lg font-semibold hover:bg-white lg:w-[90px] lg:h-[60px]">
                  Rent
                </div>
              </Link>
              <Link href={""}>
                <div className="flex justify-center items-center w-[100px] h-[60px] rounded-t-3xl font-nunito text-lg font-semibold hover:bg-white lg:w-[90px] lg:h-[60px]">
                  Buy
                </div>
              </Link>
            </div>

            <div className="absolute flex lg:items-center mt-[55px] w-[300px] h-[250px] bg-white rounded-b-3xl rounded-tr-none drop-shadow-xl flex-wrap md:w-[470px] md:rounded-3xl md:rounded-tl-none lg:w-[810px] lg:h-[100px] lg:rounded-3xl lg:rounded-tl-none">
              <div className="flex flex-wrap lg:justify-center items-center mx-4">
                <div className="flex flex-col ml-3 md:ml-5 lg:mt-0 lg:ml-1 ">
                  <div className="text-sm font-nunito font-semibold md:text-lg lg:text-lg">
                    Property Type
                  </div>
                  <Link href={""}>
                    <div className="flex items-center">
                      <div className="font-nunito text-xs text-slate-400 hover:text-slate-600 md:text-sm lg:text-sm">
                        Property Type
                      </div>
                      <div className="text-base p-2 text-slate-400 hover:transform transition-transform duration-200 hover:scale-125">
                        <IoIosArrowDown />
                      </div>
                    </div>
                  </Link>
                </div>

                <div className="h-11 bg-slate-400 border md:ml-10 mx-4 lg:mx-10"></div>

                <div className="flex flex-col ml-3 md:ml-10 lg:mt-0 lg:ml-1">
                  <div className="text-sm font-nunito font-semibold md:text-lg lg:text-lg">
                    Location
                  </div>
                  <Link href={""}>
                    <div className="flex items-center">
                      <div className="font-nunito text-xs text-slate-400 hover:text-slate-600 md:text-sm lg:text-sm">
                        All Cities
                      </div>
                      <div className="text-base p-2 text-slate-400 hover:transform transition-transform duration-200 hover:scale-125">
                        <IoIosArrowDown />
                      </div>
                    </div>
                  </Link>
                </div>

                <div className="h-12 bg-slate-400 border mx-10 hidden md:block lg:block"></div>

                <div className="flex flex-col ml-3 md:ml-5 lg:mt-0 lg:ml-1">
                  <div className="text-sm font-nunito font-semibold md:text-lg lg:text-lg">
                    Property Size
                  </div>
                  <Link href={""}>
                    <div className="flex items-center">
                      <div className="font-nunito text-xs text-slate-400 hover:text-slate-600 md:text-sm lg:text-sm">
                        Bedrooms
                      </div>
                      <div className="text-lg p-2 text-slate-400 hover:transform transition-transform duration-200 hover:scale-125">
                        <IoIosArrowDown />
                      </div>
                    </div>
                  </Link>
                </div>

                <div className="h-12 bg-slate-400 border mx-9 mr-7 md:ml-12 lg:mr-0 lg:mx-10"></div>

                <div className="flex flex-col md:ml-7 lg:mt-0 lg:ml-10">
                  <div className="text-sm font-nunito font-semibold md:text-base lg:text-lg">
                    Your Budget
                  </div>
                  <div className="flex items-center">
                    <form>
                      <label></label>
                      <div className="font-nunito text-xs text-slate-400 lg:text-sm">
                        <input
                          type="text"
                          placeholder="Max Price"
                          className="w-[100px] h-8 bg-slate-100 rounded-md p-2 text-slate-400"
                        />
                      </div>
                    </form>
                  </div>
                </div>

                <button className="flex justify-center items-center w-[120px] h-[40px] hover:transform transition-transform duration-200 hover:scale-105 hover:bg-blue bg-terrablue border ml-20 rounded-xl text-xl text-white md:ml-8 md:w-[42px] md:h-[42px] lg:ml-14 lg:w-[42px] lg:h-[42px]">
                  <FiSearch />
                  <div className="mx-2 md:hidden">
                    <p className="font-nunito text-lg">Search</p>
                  </div>
                </button>
              </div>
            </div>
          </div>
          <div className="absolute inset-0 z-30 pt-24 pl-18 ml-4 lg:ml-0 lg:pl-20 w-11/12 -mr-52 flex flex-col text-center md:w-9/12 md:ml-28 lg:items-start">
            <p className="text-4xl pb-3 font-bold font-nunito text-white md:text-[42px] ">
              Discover Your Ideal Home
            </p>
            <p className="text-4xl pb-5 font-bold font-nunito text-white md:text-[42px]">
              with Terra
            </p>
            <p className="text-lg font-nunito font-semibold text-white md:text-xl md:mt-2 lg:text-left">
              Seamlessly Rent, Buy, or Sell Properties. Uncover<br></br> Your Next Dream Space
              Today.
            </p>
          </div>

          <div className="flex w-full h-full absolute inset-0 z-20 ">
            <Image
              src={HeroImage}
              alt="hero"
              className="w-[630px] h-[600px] object-fill pt-20 ml-auto hidden rounded-br-3xl lg:block"
            />
          </div>

          <div className="w-full h-full absolute inset-0 z-10">
            <Image
              src={HeroBack}
              alt="hero"
              className="object-cover overflow-hidden w-full h-full rounded-3xl"
            />
          </div>
        </div>
      </div>
    </div>
  );
};

export default HeroSection;