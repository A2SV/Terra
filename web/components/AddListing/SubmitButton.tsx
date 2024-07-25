"use client";
import React from "react";
import { env } from "next-runtime-env";

interface SubmitButtonProps {
  data: any;
}

const SubmitButton: React.FC<SubmitButtonProps> = ({ data }) => {
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    const images = data.selectedImages;
    const uploadedImageUrls = [];

    try {
      const baseUrl = env("NEXT_PUBLIC_BASE_URL");

      for (const imageUrl of images) {
        // Fetch the blob from the URL
        const response = await fetch(imageUrl);
        const blob = await response.blob();

        // Convert the blob to a File object
        const file = new File([blob], "property-image.png", { type: blob.type });

        const formData = new FormData();
        formData.append("file", file);

        // Send the image to the server
        const imageUploadResponse = await fetch(`${baseUrl}file/upload?fileType=property-image`, {
          method: "POST",
          body: formData,
        });

        console.log("imageUploadResponse", imageUploadResponse);

        if (!imageUploadResponse.ok) {
          throw new Error("Image upload failed");
        }

        const imageResult = await imageUploadResponse.json();
        uploadedImageUrls.push(imageResult.url);
      }

      const apartment = {
        furnishedStatus: data.furnishedStatus,
        numberOfBedrooms: data.bedrooms,
        numberOfBathrooms: data.bathrooms,
        numberOfWashrooms: data.washrooms,
        numberOfKitchens: data.kitchens,
        numberOfFloorsInBuilding: data.numFloors,
        floorNumberOfUnit: data.floorNumber,
        laundryFacilityAvailable: data.laundryFacility,
        cleaningServiceAvailable: data.cleaningService,
        studentFriendly: data.studentFriendly,
      };

      const eventSpace = {
        totalFloors: data.totalFloors,
        floorNumber: data.floorNumber,
        parkingSpace: data.parkingSpaces,
        maximumCapacity: data.maxCapacity,
        cateringServiceAvailable: data.cateringServices === "Yes",
        audioVisualEquipmentsAvailable: data.audioVisualEquipment === "Yes",
        suitableEvents: data.selectedeventTypes,
      };

      const guestHouse = {
        furnishedStatus: data.furnishedStatus,
        numberOfBedrooms: data.bedrooms,
        numberOfBathrooms: data.bathrooms,
        numberOfWashrooms: data.washrooms,
        numberOfKitchens: data.kitchens,
        starRating: data.starRating,
        restaurantOnSite: data.restaurantOnSite === "Yes",
      };

      const hotel = {
        furnishedStatus: data.furnishedStatus,
        numberOfBedrooms: data.bedrooms,
        numberOfBathrooms: data.bathrooms,
        numberOfWashrooms: data.washrooms,
        numberOfKitchens: data.kitchens,
        starRating: data.starRating,
        restaurantOnSite: data.restaurantOnSite === "Yes",
      };

      const house = {
        furnishedStatus: data.furnishedStatus,
        numberOfBedrooms: data.bedrooms,
        numberOfBathrooms: data.bathrooms,
        numberOfWashrooms: data.washrooms,
        numberOfKitchens: data.kitchens,
        numberOfStories: data.numStories,
        garageSpace: data.garageSpaces,
        studentFriendly: data.studentFriendly,
      };

      const officeSpace = {
        totalFloors: data.totalFloors,
        floorNumber: data.floorNumber,
        parkingSpace: data.parkingSpaces,
        officeSpaceType: data.officeType,
        meetingRoomsAvailable: data.meetingRooms === "Yes",
        receptionAreaAvailable: data.receptionArea === "Yes",
      };

      const shop = {
        totalFloors: data.totalFloors,
        floorNumber: data.floorNumber,
        parkingSpace: data.parkingSpaces,
        displayWindowAvailable: data.displayWindow === "Yes",
        storageRoomSize: data.storageRoom,
      };

      const studentHostel = {
        furnishedStatus: data.furnishedStatus,
        numberOfBedrooms: data.bedrooms,
        numberOfBathrooms: data.bathrooms,
        numberOfWashrooms: data.washrooms,
        numberOfKitchens: data.kitchens,
        roomTypes: data.selectedroomTypes,
        studentHostelType: data.hostelType,
        studentHostelLocation: data.location,
        sharedFacilities: data.sharedFacilities === "Yes",
        mealPlanAvailable: data.mealPlanAvailable === "Yes",
        studyAreaAvailable: data.studyAreaAvailable === "Yes",
        laundryFacilityAvailable: data.laundryFacility,
        cleaningServiceAvailable: data.cleaningService,
      };

      const warehouse = {
        totalFloors: data.totalFloors,
        floorNumber: data.floorNumber,
        parkingSpace: data.parkingSpaces,
        ceilingHeight: data.ceilingHeight,
        loadingDockAvailable: data.loadingDocks === "Yes",
        officeSpaceAvailable: data.officeSpaceIncluded === "Yes",
        suitableGoods: data.goodsType,
      };

      const properties = {
        apartment,
        eventSpace,
        guestHouse,
        hotel,
        house,
        officeSpace,
        shop,
        studentHostel,
        warehouse,
      };

      const finalData = {
        listerId: "f7dbc673-4cd9-477b-a809-0739846dd5fb",
        title: data.listingName,
        description: data.listingDescription,
        propertyType: data.type,
        listingType: data.category,
        propertyPublishStatus: 1,
        propertyMarketStatus: 1,
        propertySize: data.landSize,
        availableStartDate: "2024-07-25T12:35:32.051Z",
        availableEndDate: "2024-07-25T12:35:32.051Z",
        paymentCurrency: 1,
        paymentFrequency: data.frequency,
        price: data.price,
        negotiable: data.negotiable,
        streetName: "Afariwa RD",
        houseNumber: "GC-0825-261",
        city: "Accra",
        country: "Ghana",
        zipCode: "+233",
        longitude: 180,
        latitude: 180,
        amenities: data.selectedAmenities,
        pictures: uploadedImageUrls,
        videos: data.video,
        propertyFeatures: properties,
      };

      console.log("finalData", finalData);

      const response = await fetch(`${baseUrl}listing`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(finalData),
      });

      if (!response.ok) {
        throw new Error("Network response was not ok");
      }

      const result = await response.json();
      console.log("Success:", result);
    } catch (error) {
      console.error("Error:", error);
    }

    console.log("lengthhhh", uploadedImageUrls.length);
  };

  return (
    <div className="container mx-auto p-4 mb-10 w-[25vh]">
      <form onSubmit={handleSubmit} className="space-y-4">
        <button
          type="submit"
          className="w-full py-2 px-4 bg-btnColor text-white text-sm rounded-full hover:bg-orange-500"
        >
          Add listing
        </button>
      </form>
    </div>
  );
};

export default SubmitButton;
