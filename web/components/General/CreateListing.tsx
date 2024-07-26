import React from "react";
import Image from "next/image";

const CreateListing = () => {
  return (
    <div className="bg-backgroundColor relative">
      <div className="w-full flex lg:flex-row flex-col justify-between items-center md:pl-12 md:pr-12 space-y-10 lg:pt-[30px] pb-[30px] md:pb-20">
        <div className="flex flex-row relative items-center justify-center md:w-1/2 w-full">
          <div className="z-20 relative">
            <div className="md:w-[600px] md:h-[600px] w-[400px] h-[400px]">
              <Image src="/createListing.svg" fill={true} alt="house" />
            </div>
          </div>
        </div>
        <div className="md:w-1/2 w-full flex flex-row items-center justify-center px-auto">
          <div className="flex flex-col space-y-6 relative z-20">
            <div className="md:w-[400px] w-[300px]">
              <h1 className="text-[28px] font-bold text-normalTextColor font-nunito">
                Got any property you want to sell or lease?
              </h1>
            </div>

            <div className="md:w-[400px] w-[300px]">
              <h1 className="md:text-[18px] text-[18px] text-normalTextColor font-bold font-nunito">
                Click the button below to create listings of your property
              </h1>
            </div>

            <div className="flex justify-start">
              <ul className="list-none pl-3 space-y-5">
                <li className="relative text-[18px] text-normalTextColor pl-2 font-nunito">
                  <span className="absolute left-0 top-0 inline-block w-[6px] h-[6px] rounded-full bg-bulletColor transform -translate-x-3 translate-y-2"></span>
                  Residential
                </li>
                <li className="relative text-[18px] text-normalTextColor pl-2 font-nunito">
                  <span className="absolute left-0 top-0 inline-block w-[6px] h-[6px] rounded-full bg-bulletColor transform -translate-x-3 translate-y-2"></span>
                  Commercial
                </li>
              </ul>
            </div>

            <div>
              <button className="bg-terrablue text-white font-bold text-[16px] px-6 py-3 rounded-[25px] font-nunito">
                Create Listing
              </button>
            </div>
          </div>

          <div className="absolute z-10 lg:top-20 lg:right-[128px] md:bottom-[366px] md:right-[100px] md:block hidden">
            <Image src="/ellipse.svg" width={150} height={150} alt="ellipse" />
          </div>
          <div className="absolute z-10 top-[420px] right-0 block md:hidden">
            <Image src="/semiEllipse.svg" width={60} height={70} alt="ellipse" />
          </div>
        </div>
      </div>
    </div>
  );
};

export default CreateListing;
