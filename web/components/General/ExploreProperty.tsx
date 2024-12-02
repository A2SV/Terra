import React, { useRef, useState, useEffect } from "react";
import Image from "next/image";
import { FaArrowRight, FaArrowLeft } from "react-icons/fa6";

type City = {
  name: string;
  image: string;
};

const ExploreProperty: React.FC = () => {
  const cities: City[] = [
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

  const scrollContainerRef = useRef<HTMLDivElement>(null);
  const [canScrollLeft, setCanScrollLeft] = useState<boolean>(false);
  const [canScrollRight, setCanScrollRight] = useState<boolean>(true);
  const [currentPage, setCurrentPage] = useState<number>(0);
  const [totalPages, setTotalPages] = useState<number>(0);

  const handleScroll = (): void => {
    if (scrollContainerRef.current) {
      const { scrollLeft, scrollWidth, clientWidth } = scrollContainerRef.current;
      setCanScrollLeft(scrollLeft > 0);
      setCanScrollRight(scrollLeft + clientWidth < scrollWidth);

      const totalPgs = Math.ceil(scrollWidth / clientWidth);
      const currPage = Math.round(scrollLeft / clientWidth);
      setTotalPages(totalPgs);
      setCurrentPage(currPage);
    }
  };

  const scroll = (direction: "left" | "right"): void => {
    if (scrollContainerRef.current) {
      const scrollAmount = scrollContainerRef.current.clientWidth;
      scrollContainerRef.current.scrollBy({
        left: direction === "right" ? scrollAmount : -scrollAmount,
        behavior: "smooth",
      });
    }
  };

  useEffect(() => {
    const updateTotalPages = (): void => {
      if (scrollContainerRef.current) {
        const { scrollWidth, clientWidth } = scrollContainerRef.current;
        const totalPgs = Math.ceil(scrollWidth / clientWidth);
        setTotalPages(totalPgs);
      }
    };
    updateTotalPages();
    window.addEventListener("resize", updateTotalPages);
    return () => {
      window.removeEventListener("resize", updateTotalPages);
    };
  }, []);

  return (
    <div className="relative min-h-property overflow-x-hidden bg-property flex justify-center items-center">
      <div className="flex flex-row justify-center items-center">
        <div className="w-36 h-36 top-5 -right-16 absolute z-0">
          <Image
            src="/explore_section_images/ellipse-1-home.svg"
            className="object-cover"
            fill
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

        <div
          className="flex flex-row gap-x-8 relative mt-10 md:mt-20 md:space-x-4 overflow-x-scroll scrollbar-hide"
          ref={scrollContainerRef}
          onScroll={handleScroll}
        >
          {cities.map((city, index) => (
            <div key={index} className="relative rounded-lg overflow-hidden min-w-72 min-h-60">
              <Image
                src={city.image}
                alt={city.name}
                className="filter brightness-50 object-cover"
                fill
              />
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

        <div className="flex justify-between my-10">
          <div className="flex space-x-2">
            {Array.from({ length: totalPages }, (_, index) => (
              <span
                key={index}
                className={`inline-block  h-2 ${
                  index === currentPage
                    ? "bg-terrablue w-6 rounded-md "
                    : "bg-terrablue bg-opacity-20 w-2 rounded-full"
                }`}
              ></span>
            ))}
          </div>
          <div className="flex space-x-3 mr-10">
            <button
              className={`size-7 ${
                canScrollLeft ? "bg-opacity-100" : "bg-opacity-20"
              } flex items-center justify-center rounded-sm bg-terrablue`}
              onClick={() => scroll("left")}
              disabled={!canScrollLeft}
            >
              <FaArrowLeft
                className={`w-3 text-xs text-white ${
                  canScrollLeft ? "cursor-pointer" : "cursor-not-allowed"
                }`}
              />
            </button>
            <button
              className={`size-7 ${
                canScrollRight ? "bg-opacity-100" : "bg-opacity-20"
              } flex items-center justify-center rounded-sm bg-terrablue`}
              onClick={() => scroll("right")}
              disabled={!canScrollRight}
            >
              <FaArrowRight
                className={`w-3 text-xs text-white ${
                  canScrollRight ? "cursor-pointer" : "cursor-not-allowed"
                }`}
              />
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ExploreProperty;
