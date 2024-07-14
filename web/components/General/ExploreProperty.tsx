import React from "react";
import Image from "next/image";
import { FaArrowRight } from "react-icons/fa6";

const ExploreProperty: React.FC = () => {
  return (
    <div className="relative min-h-property overflow-x-hidden bg-property flex flex-row justify-center items-center">
      <div className="flex flex-row justify-center items-center">
        <div className="w-ellipse h-ellipse top-0 -right-20 absolute z-0">
          <Image src="/ellipse-1-home.svg" className="object-cover" layout="fill" alt="ellipse" />
        </div>
        {/* <div className='w-ellipse h-ellipse bottom-4 left-0 absolute z-0'>
                    <Image src="/ellipse-1-home.svg" className="object-cover" layout="fill" alt="ellipse" />
                </div> */}
      </div>

      <div className="relative w-full z-10 ml-32">
        <div className="relative flex flex-row h-full w-1/2">
          <div className="absolute w-1.5 h-full bg-terrablue"></div>
          <div className="w-full flex flex-col z-10 justify-center items-start font-nunito ml-4">
            <h1 className="text-2xl font-nunito font-bold mb-1">Explore Cities</h1>
            <p className="font-nunito text-md">Discover your dream home in vibrant cities.</p>
          </div>
        </div>

        <div className="flex gap-x-8 relative  mt-10 space-x-4 overflow-x-scroll scrollbar-hide">
          <div className="relative rounded-lg overflow-hidden min-w-72 ">
            <div className="relative min-w-72 min-h-60">
              <Image
                src="/city-1.svg"
                alt="City 1"
                className="filter brightness-50 object-cover"
                layout="fill"
              />
            </div>
            <div className="absolute inset-0  p-4 md:p-6 text-white text-sm font-nunito flex flex-col justify-between">
              <div className="flex flex-col">
                <p className="text-md font-medium mb-1">East Legon</p>
                <p className="font-extralight">200 properties</p>
              </div>
              <div className="flex flex-row justify-between items-center text-md">
                <button className="text-white font-medium">More Details</button>
                <FaArrowRight className="ml-4 w-10 font-light sm:font-medium" />
              </div>
            </div>
          </div>

          <div className="relative rounded-lg overflow-hidden min-w-72 ">
            <div className="relative min-w-72 min-h-60">
              <Image
                src="/city-2.svg"
                alt="City 1"
                className="filter brightness-50 object-cover"
                layout="fill"
              />
            </div>
            <div className="absolute inset-0  p-4 md:p-6 text-white text-sm font-nunito flex flex-col justify-between">
              <div className="flex flex-col">
                <p className="text-md font-medium mb-1">East Legon</p>
                <p className="font-extralight">200 properties</p>
              </div>
              <div className="flex flex-row justify-between items-center text-md">
                <button className="text-white font-medium">More Details</button>
                <FaArrowRight className="ml-4 w-10 font-light sm:font-medium" />
              </div>
            </div>
          </div>

          <div className="relative rounded-lg overflow-hidden min-w-72 ">
            <div className="relative min-w-72 min-h-60">
              <Image
                src="/city-3.svg"
                alt="City 1"
                className="filter brightness-50 object-cover"
                layout="fill"
              />
            </div>
            <div className="absolute inset-0  p-4 md:p-6 text-white text-sm font-nunito flex flex-col justify-between">
              <div className="flex flex-col">
                <p className="text-md font-medium mb-1">East Legon</p>
                <p className="font-extralight">200 properties</p>
              </div>
              <div className="flex flex-row justify-between items-center text-md">
                <button className="text-white font-medium">More Details</button>
                <FaArrowRight className="ml-4 w-10 font-light sm:font-medium" />
              </div>
            </div>
          </div>

          <div className="relative rounded-lg overflow-hidden min-w-72 ">
            <div className="relative min-w-72 min-h-60">
              <Image
                src="/city-4.svg"
                alt="City 1"
                className="filter brightness-50 object-cover"
                layout="fill"
              />
            </div>
            <div className="absolute inset-0  p-4 md:p-6 text-white text-sm font-nunito flex flex-col justify-between">
              <div className="flex flex-col">
                <p className="text-md font-medium mb-1">East Legon</p>
                <p className="font-extralight">200 properties</p>
              </div>
              <div className="flex flex-row justify-between items-center text-md">
                <button className="text-white font-medium">More Details</button>
                <FaArrowRight className="ml-4 w-10 font-light sm:font-medium" />
              </div>
            </div>
          </div>

          <div className="relative rounded-lg overflow-hidden min-w-72 ">
            <div className="relative min-w-72 min-h-60">
              <Image
                src="/city-1.svg"
                alt="City 1"
                className="filter brightness-50 object-cover"
                layout="fill"
              />
            </div>
            <div className="absolute inset-0  p-4 md:p-6 text-white text-sm font-nunito flex flex-col justify-between">
              <div className="flex flex-col">
                <p className="text-md font-medium mb-1">East Legon</p>
                <p className="font-extralight">200 properties</p>
              </div>
              <div className="flex flex-row justify-between items-center text-md">
                <button className="text-white font-medium">More Details</button>
                <FaArrowRight className="ml-4 w-10 font-light sm:font-medium" />
              </div>
            </div>
          </div>

          <div className="relative rounded-lg overflow-hidden min-w-72 ">
            <div className="relative min-w-72 min-h-60">
              <Image
                src="/city-5.svg"
                alt="City 1"
                className="filter brightness-50 object-cover"
                layout="fill"
              />
            </div>
            <div className="absolute inset-0  p-4 md:p-6 text-white text-sm font-nunito flex flex-col justify-between">
              <div className="flex flex-col">
                <p className="text-md font-medium mb-1">East Legon</p>
                <p className="font-extralight">200 properties</p>
              </div>
              <div className="flex flex-row justify-between items-center text-md">
                <button className="text-white font-medium">More Details</button>
                <FaArrowRight className="ml-4 w-10 font-light sm:font-medium" />
              </div>
            </div>
          </div>

          <div className="relative rounded-lg overflow-hidden min-w-72 ">
            <div className="relative min-w-72 min-h-60">
              <Image
                src="/city-6.svg"
                alt="City 1"
                className="filter brightness-50 object-cover"
                layout="fill"
              />
            </div>
            <div className="absolute inset-0  p-4 md:p-6 text-white text-sm font-nunito flex flex-col justify-between">
              <div className="flex flex-col">
                <p className="text-md font-medium mb-1">East Legon</p>
                <p className="font-extralight">200 properties</p>
              </div>
              <div className="flex flex-row justify-between items-center text-md">
                <button className="text-white font-medium">More Details</button>
                <FaArrowRight className="ml-4 w-10 font-light sm:font-medium" />
              </div>
            </div>
          </div>

          <div className="relative rounded-lg overflow-hidden min-w-72 ">
            <div className="relative min-w-72 min-h-60">
              <Image
                src="/city-7.svg"
                alt="City 1"
                className="filter brightness-50 object-cover"
                layout="fill"
              />
            </div>
            <div className="absolute inset-0  p-4 md:p-6 text-white text-sm font-nunito flex flex-col justify-between">
              <div className="flex flex-col">
                <p className="text-md font-medium mb-1">East Legon</p>
                <p className="font-extralight">200 properties</p>
              </div>
              <div className="flex flex-row justify-between items-center text-md">
                <button className="text-white font-medium">More Details</button>
                <FaArrowRight className="ml-4 w-10 font-light sm:font-medium" />
              </div>
            </div>
          </div>

          <div className="relative rounded-lg overflow-hidden min-w-72 ">
            <div className="relative min-w-72 min-h-60">
              <Image
                src="/city-8.svg"
                alt="City 1"
                className="filter brightness-50 object-cover"
                layout="fill"
              />
            </div>
            <div className="absolute inset-0  p-4 md:p-6 text-white text-sm font-nunito flex flex-col justify-between">
              <div className="flex flex-col">
                <p className="text-md font-medium mb-1">East Legon</p>
                <p className="font-extralight">200 properties</p>
              </div>
              <div className="flex flex-row justify-between items-center text-md">
                <button className="text-white font-medium">More Details</button>
                <FaArrowRight className="ml-4 w-10 font-light sm:font-medium" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ExploreProperty;
