"use client";
import React from "react";
import { env } from "next-runtime-env";
import Spinner from "@/components/Common/Reusable/Spinner";
import { useRouter } from "next/navigation";

interface SubmitButtonProps {
  data: any;
  setSuccessMessage: (message: string) => void;
  setError: (message: string) => void;
}

const SubmitButton: React.FC<SubmitButtonProps> = ({ data, setSuccessMessage, setError }) => {
  const [loading, setLoading] = React.useState<boolean>(false);
  const router = useRouter();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    const images = data.selectedImages || [];
    const uploadedImageUrls = [];

    type EnumMapping = {
      [key: string]: { [key: string]: number };
    };

    const enumMapping: EnumMapping = {
      propertyType: {
        House: 0,
        Apartment: 1,
        StudentHostel: 2,
        Hotel: 3,
        GuestHouse: 4,
        OfficeSpace: 5,
        Shop: 6,
        Warehouse: 7,
        EventSpace: 8,
      },
      listingType: {
        Rent: 0,
        Sale: 1,
      },
      type: {
        Residential: 0,
        Commercial: 1,
      },
      paymentCurrency: {
        Ghs: 0,
        Usd: 1,
        Eur: 2,
      },
      paymentFrequency: {
        Daily: 0,
        Weekly: 1,
        Monthly: 2,
        Annually: 3,
        PerSemester: 4,
        PerAcademicYear: 5,
        Once: 6,
      },
      propertyPublishStatus: {
        Unpublished: 0,
        Published: 1,
        Inreview: 2,
      },
      propertyMarketStatus: {
        Unavailable: 0,
        Available: 1,
        Sold: 3,
        Rented: 2,
      },
      StudentHostelLocation: {
        OnCampus: 0,
        OffCampus: 1,
      },
      studentHostelType: {
        Male: 0,
        Female: 1,
        Coed: 2,
      },
      roomTypes: {
        Single: 0,
        Double: 1,
        Triple: 2,
        Quad: 3,
        Dormitory: 4,
      },
      warehouseSuitableGoods: {
        GeneralMerchandise: 0,
        PerishableGoods: 1,
        HazardousMaterials: 2,
        Electronics: 3,
        IndustrialOrConstructionMaterials: 4,
      },
      eventSpaceSuitableEvents: {
        Wedding: 0,
        Religious: 1,
        Funeral: 2,
        Festival: 3,
        Conference: 4,
        Party: 5,
        Concert: 6,
      },
      officeSpaceType: {
        OpenPlan: 0,
        IndividualOffice: 1,
      },
    };

    const getEnumValue = (category: keyof EnumMapping, value: string | number) => {
      return enumMapping[category]?.[value] ?? value;
    };

    try {
      const baseUrl = env("NEXT_PUBLIC_BASE_URL");

      for (const imageUrl of images) {
        const response = await fetch(imageUrl);
        const blob = await response.blob();
        const file = new File([blob], "property-image.png", { type: blob.type });
        const formData = new FormData();
        formData.append("file", file);

        const imageUploadResponse = await fetch(`${baseUrl}file/upload?fileType=property-image`, {
          method: "POST",
          body: formData,
        });

        if (!imageUploadResponse.ok) {
          throw new Error("Image upload failed");
        }

        const imageResult = await imageUploadResponse.json();
        uploadedImageUrls.push(imageResult.url);
      }

      const finalData = {
        listerId: data.listerId,
        title: data.listingName,
        description: data.listingDescription,
        propertyType: getEnumValue("propertyType", 0),
        listingType: getEnumValue("listingType", 0),
        propertyPublishStatus: getEnumValue("propertyPublishStatus", 1),
        propertyMarketStatus: getEnumValue("propertyMarketStatus", 1),
        propertySize: data.landSize,
        availableStartDate: "2024-07-25T12:35:32.051Z",
        availableEndDate: "2024-07-25T12:35:32.051Z",
        paymentCurrency: getEnumValue("paymentCurrency", 0),
        paymentFrequency: getEnumValue("paymentFrequency", 0),
        price: data.price,
        negotiable: data.negotiable,
        streetName: data.streetName,
        houseNumber: data.houseNumber,
        city: data.city,
        country: data.country,
        zipCode: data.zipCode,
        longitude: data.coordinates.lng,
        latitude: data.coordinates.lat,
        amenities: data.selectedAmenities,
        pictures: uploadedImageUrls,
        videos: [data.video],
        apartment: {
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
        },
        eventSpace: {
          totalFloors: data.totalFloors,
          floorNumber: data.numFloors,
          parkingSpace: data.parkingSpaces,
          maximumCapacity: data.maxCapacity,
          cateringServiceAvailable: data.cateringServices,
          audioVisualEquipmentsAvailable: data.audioVisualEquipment,
          suitableEvents: data.suitableEvents.map((event: string) =>
            getEnumValue("suitableEvents", event)
          ),
        },
        guestHouse: {
          furnishedStatus: data.furnishedStatus,
          numberOfBedrooms: data.bedrooms,
          numberOfBathrooms: data.bathrooms,
          numberOfWashrooms: data.washrooms,
          numberOfKitchens: data.kitchens,
          starRating: data.starRating,
          restaurantOnSite: data.restaurantOnSite,
        },
        hotel: {
          furnishedStatus: data.furnishedStatus,
          numberOfBedrooms: data.bedrooms,
          numberOfBathrooms: data.bathrooms,
          numberOfWashrooms: data.washrooms,
          numberOfKitchens: data.kitchens,
          starRating: data.starRating,
          restaurantOnSite: data.restaurantOnSite,
        },
        house: {
          furnishedStatus: data.furnishedStatus,
          numberOfBedrooms: data.bedrooms,
          numberOfBathrooms: data.bathrooms,
          numberOfWashrooms: data.washrooms,
          numberOfKitchens: data.kitchens,
          numberOfStories: data.numStories,
          garageSpace: data.garageSpace,
          studentFriendly: data.studentFriendly,
        },
        officeSpace: {
          totalFloors: data.totalFloors,
          floorNumber: data.numFloors,
          parkingSpace: data.parkingSpaces,
          officeSpaceType: getEnumValue("officeSpaceType", data.officeSpaceType),
          meetingRoomsAvailable: data.meetingRooms,
          receptionAreaAvailable: data.receptionArea,
        },
        shop: {
          totalFloors: data.totalFloors,
          floorNumber: data.numFloors,
          parkingSpace: data.parkingSpaces,
          displayWindowAvailable: data.displayWindow,
          storageRoomSize: data.storageRoom,
        },
        studentHostel: {
          furnishedStatus: data.furnishedStatus,
          numberOfBedrooms: data.bedrooms,
          numberOfBathrooms: data.bathrooms,
          numberOfWashrooms: data.washrooms,
          numberOfKitchens: data.kitchens,
          roomTypes: data.selectedroomTypes.map((rooms: string) =>
            getEnumValue("selectedroomTypes", rooms)
          ),
          studentHostelType: getEnumValue("studentHostelType", data.studentHostelType),
          studentHostelLocation: getEnumValue("studentHostelLocation", data.location),
          sharedFacilities: data.sharedFacilities,
          mealPlanAvailable: data.mealPlanAvailable,
          studyAreaAvailable: data.furnishedStatus,
          laundryFacilityAvailable: data.laundryFacility,
          cleaningServiceAvailable: data.cleaningService,
        },
        warehouse: {
          totalFloors: data.totalFloors,
          floorNumber: data.numFloors,
          parkingSpace: data.parkingSpaces,
          ceilingHeight: data.ceilingHeight,
          loadingDockAvailable: data.loadingDocks,
          officeSpaceAvailable: data.officeSpaceAvailable,
          suitableGoods: data.suitableGoods.map((goods: string) =>
            getEnumValue("warehouseSuitableGoods", goods)
          ),
        },
      };

      console.log("final data: ", finalData);

      const response = await fetch(`${baseUrl}listing`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(finalData),
      });

      console.log(response);

      if (response.ok) {
        setSuccessMessage("Listing Has Been Added Sucessfully");
        setTimeout(() => {
          setSuccessMessage("");
          router.push("/");
        }, 5000);
      } else {
        setError("Failed To Add listing. Please try again.");
        setTimeout(() => {
          setError("");
        }, 5000);
      }
    } catch (error) {
      setError("Failed To Add listing. Please try again.");
      setTimeout(() => {
        setError("");
      }, 5000);
    }

    setLoading(false);
  };

  return (
    <div className="container mx-auto p-4 mb-10 w-[25vh]">
      <form onSubmit={handleSubmit} className="space-y-4">
        <button
          type="submit"
          className="w-full py-2 px-4 bg-btnColor text-white text-sm rounded-full"
        >
          {loading ? <Spinner /> : "Add Listing"}
        </button>
      </form>
    </div>
  );
};

export default SubmitButton;
