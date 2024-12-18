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
import DetailCarousel from "@/components/Sliders/DetailCarousel/DetailCarousel";
import ListDescription from "@/components/Listing/ListDesc";
import Review from "@/components/Listing/Review";
import ContactCard from "@/components/Listing/Cards/ContactCard";
import { FaChevronLeft, FaChevronRight } from "react-icons/fa6";
import { useGetListingByIdQuery } from "@/redux/listingApi";
import { useParams } from "next/navigation";
import { useState, useEffect } from "react";
import { PropertyPhoto } from "@/types/listingTypes";
import Spinner from "@/components/Common/Reusable/Spinner";
import formatMoney from "@/components/Common/Reusable/MoneyFormatter";


type EnumMapping = {
  [key: string]: { [key: number]: string };
};

export const enumMapping: EnumMapping = {
  propertyType: {
    0: "House",
    1: "Apartment",
    2: "StudentHostel",
    3: "Hotel",
    4: "GuestHouse",
    5: "OfficeSpace",
    6: "Shop",
    7: "Warehouse",
    8: "EventSpace",
  },
  listingType: {
    0: "Rent",
    1: "Sale",
  },
  paymentCurrency: {
    0: "GHS",
    1: "USD",
    2: "EUR",
    3: "GBP",
  },
  paymentFrequency: {
    0: "Day",
    1: "Week",
    2: "Month",
    3: "Year",
    4: "Sem",
    5: "Academic Year",
    6: "Once",
  },
  propertyMarketStatus: {
    0: "Unavailable",
    1: "Available",
    2: "Rented",
    3: "Sold",
  },
  propertyPublishStatus: {
    0: "Unpublished",
    1: "Published",
    2: "InReview",
  },
  studentHostelLocation: {
    0: "OnCampus",
    1: "OffCampus",
  },
  studentHostelRoomTypes: {
    0: "Single",
    1: "Double",
    2: "Triple",
    3: "Quad",
    4: "Dormitory",
  },
  studentHostelType: {
    0: "Male",
    1: "Female",
    2: "Coed",
  },
  warehouseSuitableGoods: {
    0: "GeneralMerchandise",
    1: "PerishableGoods",
    2: "HazardousMaterials",
    3: "Electronics",
    4: "IndustrialOrConstructionMaterials",
  },
  eventSpaceSuitableEvents: {
    0: "Wedding",
    1: "Religious",
    2: "Funeral",
    3: "Festival",
    4: "Conference",
    5: "Party",
    6: "Concert",
  },
  officeSpaceType: {
    0: "OpenPlan",
    1: "IndividualOffice",
  },
};


const HeroListing = () => {
  const params = useParams<{ id: string }>();

  const { data, error, isLoading } = useGetListingByIdQuery({ listingId: params.id });
  const [listingData, setListingData] = useState<any>({});
  useEffect(() => {
    if (data) {
      setListingData(data);
    }
  }, [data]);

  if (isLoading) {
    return (
      <div className="flex items-center justify-center h-screen">
        <Spinner />
      </div>
    );
  }

  if (error) {
    return (
      <div className="flex items-center justify-center h-screen">Error loading Listing data.</div>
    );
  }

  if (!data) {
    return <div className="flex items-center justify-center h-screen"> No Listing data found.</div>;
  }

  const images: string[] = [
    ...(listingData.propertyPhotos?.map((photo: PropertyPhoto) => photo.url) || []),
  ];

  return (
    <div className="flex flex-col min-w-[100%] pl-4 lg:pl-14 pr-4 lg:pr-14">
      <div className="flex flex-col lg:flex-row justify-between pt-10">
        <nav className="flex font-roboto text-sm mb-3 mt-10">
          <ol className="flex">
            <li className="flex justify-center items-center text-btnColor">
              <Image src={houseIcon} alt="house" className="size-4 mr-3 mt-o" />
              Home
            </li>
            <li className="flex justify-center items-center text-btnColor">
              <Image src={angle} alt="angle" className="size-8" />
              {enumMapping.propertyType[listingData.propertyType]}
            </li>
            <li className="flex justify-center items-center text-breadCrumb">
              <Image src={angle} alt="angle" className="size-8" />
              {listingData.title}
            </li>
          </ol>
        </nav>
      </div>
      <div className="flex flex-col lg:flex-row justify-between pt-3 pb-6">
        <div>
          <div className="text-2xl text-listingBlack">{listingData.title}</div>
          <div className="flex pt-3 space-x-1">
            <button className="bg-terraLemon text-xs text-white px-2 mb-2 rounded-sm">
              FEATURED
            </button>
            <button className="bg-listingGray text-xs p-1 text-white px-2 mb-2 rounded-sm">
              FOR {enumMapping.listingType[listingData.listingType]?.toUpperCase()}
            </button>
          </div>
          <div className="flex items-center text-sm mb-2">
            <Image src={locationIcon} alt="location" className="size-4 mr-2 text-lightGray" />
            <p className="text-lightGray">
              {listingData.propertyLocation?.streetName}, {listingData.propertyLocation?.city},{" "}
              {listingData.propertyLocation?.zipCode}, {listingData.propertyLocation?.country}
            </p>
          </div>
        </div>
        <div className="flex flex-col gap-2 items-start lg:items-end">
          <div className="flex flex-row gap-2">
            <Image src={bookmarkIcon} alt="bookmark" className="size-8 text-lightGray" />
            <Image src={shareIcon} alt="share" className="size-8 text-lightGray" />
            <Image src={printIcon} alt="print" className="size-8 text-lightGray" />
          </div>
          <p className="font-roboto text-3xl font-semibold">
            {formatMoney(listingData.paymentInformation?.cost ?? 0, {
              currency: enumMapping.paymentCurrency[listingData.paymentInformation?.currency],
              locale: "en-GH",
            })}
            / {enumMapping.paymentFrequency[listingData.paymentInformation?.paymentFrequency]}
          </p>
        </div>
      </div>
      <div className="flex flex-col lg:flex-row justify-between gap-10">
        <div className="flex flex-col w-full lg:w-8/12 bg-white rounded-md p-6 mb-8">
          <DetailCarousel images={images} />
        </div>
        <ContactCard
          agentImage="https://images.unsplash.com/photo-1494526585095-c41746248156?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
          agentName={`${listingData.lister?.firstName}, ${listingData.lister?.lastName}}`}
          agentListingsUrl="/listings"
        />
      </div>
      <div className="flex flex-col w-full lg:w-8/12 bg-white rounded-md p-6 mb-8">
        <div className="flex justify-between items-center">
          <p className="text-lg font-roboto">Overview</p>
        </div>
        <div className="border-b border-slate-200 mt-4 mb-6"></div>

        <div className="flex flex-wrap gap-12">
          <div className="flex flex-col">
            <p className="font-roboto font-semibold text-listingBlack">
              {enumMapping.propertyType[listingData.propertyType]}
            </p>
            <p className="font-light font-roboto text-terragray text-sm">Property Type</p>
          </div>

          <div className="flex flex-col">
            <div className="flex items-center space-x-2">
              <Image src={bedIcon2} alt="bedIcon2" className="w-5 h-5" />
              <p className="text-base font-roboto text-listingBlack font-semibold">
                {listingData.residentialProperty?.numberOfBedrooms}
              </p>
            </div>
            <p className="font-light font-roboto text-terragray text-sm">Bedrooms</p>
          </div>

          <div className="flex flex-col">
            <div className="flex items-center space-x-2">
              <Image src={showerIcon2} alt="showerIcon2" className="w-5 h-5" />
              <p className="text-base font-roboto text-listingBlack font-semibold">
                {listingData.residentialProperty?.numberOfBathrooms}
              </p>
            </div>
            <p className="font-light font-roboto text-terragray text-sm">Bathrooms</p>
          </div>

          <div className="flex flex-col">
            <div className="flex items-center space-x-2">
              <Image src={carIcon} alt="carIcon" className="w-5 h-5" />
              <p className="text-base font-roboto text-listingBlack font-semibold">1</p>
            </div>
            <p className="font-light font-roboto text-terragray text-sm">Garage</p>
          </div>

          <div className="flex flex-col">
            <div className="flex items-center space-x-2">
              <Image src={rulerIcon} alt="rulerIcon" className="w-5 h-5" />
              <p className="text-base font-roboto text-listingBlack font-semibold">
                {listingData?.propertySize}
              </p>
            </div>
            <p className="font-light font-roboto text-terragray text-sm">Sq m</p>
          </div>

          <div className="flex flex-col">
            <div className="flex items-center space-x-2">
              <Image src={calendarIcon} alt="calendarIcon" className="w-5 h-5" />
              <p className="text-base font-roboto text-listingBlack font-semibold">2016</p>
            </div>
            <p className="font-light font-roboto text-terragray text-sm">Year Built</p>
          </div>
        </div>
      </div>
      <ListDescription />
      <div className="flex flex-col w-full lg:w-8/12 bg-gray-50">
        <div className="bg-white px-0 lg:px-12 rounded mb-16 mt-14 pt-8 pb-12">
          <div className="flex flex-row justify-between border-b-2 mt-3 items-center pt-3 pb-5">
            <p className="text-lg font-roboto">Video</p>
          </div>
          <div className="relative pb-[75%] h-0 overflow-hidden">
            <iframe
              className="absolute top-0 left-0 w-full h-full"
              src="https://www.youtube.com/embed/-NInBEdSvp8"
              title="Dubai Luxury Property Highlight The Glass Penthouse"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
              referrerPolicy="strict-origin-when-cross-origin"
              allowFullScreen
            ></iframe>
          </div>
        </div>
      </div>
      <Review />
      <div className="flex flex-col w-full lg:w-8/12 bg-gray-50 my-10">
        <div className="flex justify-center gap-5">
          <button className="size-10 bg-white text-sky-500 text-lg flex items-center justify-center rounded ">
            <FaChevronLeft />
          </button>
          <button className="size-10 bg-white text-sky-500 text-lg flex items-center justify-center rounded ">
            <FaChevronRight />
          </button>
        </div>
      </div>
      <div className="w-full"></div>
    </div>
  );
};

export default HeroListing;
