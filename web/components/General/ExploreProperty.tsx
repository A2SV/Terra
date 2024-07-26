import React from "react";
import Image from "next/image";
import { FaArrowRight } from "react-icons/fa6";

const ExploreProperty: React.FC = () => {
  const cities = [
    { name: "Accra", image: "/accra.svg" },
    { name: "Takoradi", image: "/takoradi.svg" },
    { name: "Kumasi", image: "/kumasi.svg" },
    { name: "Cape Coast", image: "/cape.svg" },
    { name: "East Legon", image: "/explore_section_images/city-1.svg" },
    { name: "Tema", image: "/explore_section_images/city-5.svg" },
    { name: "Ashaiman", image: "/explore_section_images/city-6.svg" },
    { name: "Madina", image: "/explore_section_images/city-7.svg" },
    { name: "Tamale", image: "/explore_section_images/city-8.svg" },
  ];

  return (
    <div className="relative min-h-property overflow-x-hidden bg-property flex flex-row justify-center items-center">
      <div className="flex flex-row justify-center items-center">
        <div className="w-36 h-36 top-5 -right-16 absolute z-0">
          <Image
            src="/explore_section_images/ellipse-1-home.svg"
            className="object-cover"
            layout="fill"
            alt="ellipse"
          />
        </div>
      </div>

      <div className="relative w-full max-sm:mt-8 px-7 md:pl-14 z-10">
        <div className="relative flex flex-row h-full w-full md:w-1/2">
          <div className="absolute w-1 md:w-1.5 h-full bg-terrablue"></div>
          <div className="w-full flex flex-col z-10 justify-center items-start font-nunito ml-4">
            <h1 className="text-xl md:text-2xl font-nunito font-bold mb-1">Explore Cities</h1>
            <p className="font-nunito text-sm md:text-md">
              Discover your dream home in vibrant cities.
            </p>
          </div>
        </div>

        <div className="flex flex-col md:flex-row gap-x-8 relative mt-10 md:mt-20 max-sm:space-y-6 md:space-x-4 overflow-x-scroll scrollbar-hide">
          {cities.map((city, index) => (
            <div key={index} className="relative rounded-lg overflow-hidden w-full sm:min-w-72">
              <div className="relative w-full sm:min-w-72 min-h-60">
                <Image
                  src={city.image}
                  alt={city.name}
                  className="filter brightness-50 object-cover"
                  layout="fill"
                />
              </div>
              <div className="absolute inset-0 p-4 md:p-6 text-white text-sm font-nunito flex flex-col justify-between">
                <div className="flex flex-col">
                  <p className="text-md font-medium mb-1">{city.name}</p>
                </div>
                <div className="flex flex-row justify-between items-center text-md">
                  <button className="text-white font-medium">More Details</button>
                  <FaArrowRight className="ml-4 w-10 font-light sm:font-medium hover:cursor-pointer" />
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default ExploreProperty;
