import React, { useState, useEffect } from "react";
import { IoIosCheckmarkCircleOutline } from "react-icons/io";
import { IoCaretDownCircleOutline, IoCalendarOutline } from "react-icons/io5";
import { SlMap } from "react-icons/sl";
import { useGetListingByIdQuery } from "@/redux/listingApi";
import { useParams } from "next/navigation";
import UpdatedDate from "../Common/Reusable/UpdatedDate";
import Spinner from "@/components/Common/Reusable/Spinner";
import { enumMapping } from "./HeroListing";
import formatMoney from "@/components/Common/Reusable/MoneyFormatter";

const ListDesc: React.FC = () => {
  const params = useParams<{ id: string }>();

  const { data, error, isLoading } = useGetListingByIdQuery({ listingId: params?.id });
  const [listingData, setListingData] = useState<any>({});
  useEffect(() => {
    if (data) {
      setListingData(data);
    }
  }, [data]);

  const features = [
    ...(listingData.propertyAmenities?.map(
      (amenity: { amenityName: string }) => amenity.amenityName
    ) || []),
  ];

  console.log("Features", features);

  if (isLoading) {
    return (
      <div>
        <Spinner />{" "}
      </div>
    );
  }

  if (error) {
    return <div>Error loading blog data.</div>;
  }

  if (!data) {
    return <div>No blog data found.</div>;
  }

  const handleOpenInGoogleMaps = () => {
    const googleMapsUrl = `https://www.google.com/maps?q=${listingData.propertyLocation?.latitude},${listingData.propertyLocation?.longitude}`;
    window.open(googleMapsUrl, "_blank");
  };

  return (
    <div className="flex flex-col w-full lg:w-8/12 bg-gray-50">
      <div className="bg-white px-0 lg:px-12 rounded mb-16 mt-14 pt-8 pb-12">
        <div className="flex flex-row justify-between border-b-2 mt-3 items-center pt-3 pb-5">
          <p className="text-lg font-roboto">Description</p>
        </div>
        <p className="py-10">{listingData.description}</p>
      </div>

      <div className="bg-white px-0 lg:px-12 rounded mb-16 mt-14 pt-8 pb-12">
        <div className="flex flex-row justify-between border-b-2 mt-3 items-center pt-3 pb-5">
          <p className="text-lg font-roboto">Address</p>
          <button
            className="bg-sky-400 py-1 w-[28%] px-3 rounded flex items-center text-xs justify-between text-white"
            onClick={handleOpenInGoogleMaps}
          >
            <SlMap />
            Open on Google Maps
          </button>
        </div>

        <div className="flex flex-row justify-between">
          <div className="w-[45%]">
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Address</p>
              <p>{listingData.propertyLocation?.streetName}</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">City</p>
              <p>{listingData.propertyLocation?.city}</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">State/county</p>
              <p>{listingData.propertyLocation?.houseNumber}</p>
            </div>
          </div>
          <div className="w-[45%]">
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Zip/Postal Code</p>
              <p>{listingData.propertyLocation?.zipCode}</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Area</p>
              <p>{listingData.propertyLocation?.city}</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Country</p>
              <p>{listingData.propertyLocation?.country}</p>
            </div>
          </div>
        </div>
      </div>
      <div className="w-full bg-white px-0 lg:px-12 rounded py-14">
        <div className="flex flex-row justify-between border-b-2 items-center pt-4 pb-8">
          <p className="text-lg font-roboto">Details</p>
          <p className="font-light text-sm text-gray-400 flex items-center">
            <IoCalendarOutline className="mr-1" />
            <UpdatedDate updatedAt={listingData.propertyLocation?.updatedAt} />
          </p>
        </div>

        <div className="flex flex-row justify-between border bg-terrablue bg-opacity-10 border-sky-500 mt-8 mb-3 px-8 rounded">
          <div className="w-[45%]">
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Property ID:</p>
              <p>N/A</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Price:</p>
              <p>
                {formatMoney(listingData.paymentInformation?.cost ?? 0, {
                  currency: enumMapping.paymentCurrency[listingData.paymentInformation?.currency],
                  locale: "en-GH",
                })}
                / {enumMapping.paymentFrequency[listingData.paymentInformation?.paymentFrequency]}
              </p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Property Size:</p>
              <p>{listingData?.propertySize} Sq m</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Bedrooms:</p>
              <p>{listingData.residentialProperty?.numberOfBedrooms}</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Bathrooms:</p>
              <p>{listingData.residentialProperty?.numberOfBathrooms}</p>
            </div>
          </div>
          <div className="w-[45%]">
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Garage:</p>
              <p>Unavailable</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Garage Size:</p>
              <p>N/A</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Year Built:</p>
              <p>N/A</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Property Type:</p>
              <p>{enumMapping.propertyType[listingData.propertyType]}</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Property Status:</p>
              <p>{enumMapping.propertyMarketStatus[listingData.propertyMarketStatus]}</p>
            </div>
          </div>
        </div>

        <p className="font-medium border-b-2 pt-6 pb-10">Additional details</p>

        <div className="flex flex-row justify-between py-8">
          <div className="w-[45%]">
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Deposit:</p>
              <p>20%</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Pool Size:</p>
              <p>N/A Sqft</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Last remodel year:</p>
              <p>N/A</p>
            </div>
          </div>
          <div className="w-[45%]">
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Amenities:</p>
              <p>N/A</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Additional Rooms:</p>
              <p>N/A</p>
            </div>
            <div className="flex flex-row justify-between border-b-2 py-4">
              <p className="font-bold">Equipment:</p>
              <p>N/A</p>
            </div>
          </div>
        </div>
      </div>

      <div className="w-full bg-white px-0 lg:px-12 rounded mb-16 mt-14 py-6">
        <p className="text-lg font-roboto">Features</p>
        <div className="grid grid-cols-3 my-6">
          {features.map((feature, index) => (
            <div key={index} className={`flex items-center justify-center space-x-2`}>
              <IoIosCheckmarkCircleOutline />
              <p className="">{feature}</p>
            </div>
          ))}
        </div>
      </div>

      <div className="w-full bg-white px-0 lg:px-12 rounded mb-16 mt-14 pt-8 pb-12">
        <p className="text-lg font-roboto">Floor Plans</p>
        <div className="flex flex-row justify-between border-b-2 py-4">
          <p className="font-bold flex items-center">
            <IoCaretDownCircleOutline className="text-blue" />
            City
          </p>
          <p> {listingData.propertyLocation?.city}</p>
        </div>
        <div className="flex flex-row justify-between border-b-2 py-4">
          <p className="font-bold flex items-center">
            <IoCaretDownCircleOutline className="text-blue" />
            State/county
          </p>
          <p> {listingData.propertyLocation?.country}</p>
        </div>
      </div>
    </div>
  );
};

export default ListDesc;
