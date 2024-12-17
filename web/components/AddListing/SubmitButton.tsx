"use client";
import React from "react";
import { env } from "next-runtime-env";
import Spinner from "@/components/Common/Reusable/Spinner";
import { useRouter } from "next/navigation";

interface SubmitButtonProps {
  data: any;
  setSuccessMessage: (message: string) => void;
  setError: (message: string) => void;
  targetType: any;
}

const SubmitButton: React.FC<SubmitButtonProps> = ({
  data,
  setSuccessMessage,
  setError,
  targetType,
}) => {
  const [loading, setLoading] = React.useState<boolean>(false);
  const router = useRouter();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    const images = data.selectedImages || [];
    const uploadedImageUrls = [];

    type EnumMapping = {
      [key: string]: { [key: string]: number | boolean | number[] };
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
        "On campus": 0,
        "Off campus": 1,
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
        "General Merchandise": [0],
        "Perishable Goods": [1],
        "Hazardous Materials": [2],
        "Electronics/Sensitive Equipment": [3],
        Electronics: [4],
        "Industrial/Construction Materials": [5],
      },
      eventSpaceSuitableEvents: {
        wedding: 0,
        religious: 1,
        funeral: 2,
        failestival: 3,
        conference: 4,
        party: 5,
        concert: 6,
      },
      officeSpaceType: {
        OpenPlan: 0,
        IndividualOffice: 1,
      },
      negotiable: {
        Yes: true,
        No: false,
      },
      furnishedStatus: {
        Yes: true,
        No: false,
      },
      restaurantOnSite: {
        Yes: true,
        No: false,
      },
      meetingRooms: {
        Yes: true,
        No: false,
      },
      receptionArea: {
        Yes: true,
        No: false,
      },
      displayWindow: {
        Yes: true,
        No: false,
      },
      sharedFacilities: {
        Yes: true,
        No: false,
      },
      mealPlanAvailable: {
        Yes: true,
        No: false,
      },
      laundryFacility: {
        Yes: true,
        No: false,
      },
      audioVisualEquipmentsAvailable: {
        Yes: true,
        No: false,
      },
      loadingDocks: {
        Yes: true,
        No: false,
      },
      storageRoom: {
        Yes: true,
        No: false,
      },
      cateringServiceAvailable: {
        Yes: true,
        No: false,
      },
    };

    const constructPropertySpecificData = (data: any, propertyType: string) => {
      switch (propertyType) {
        case "Apartment":
          return {
            apartment: {
              furnishedStatus: getEnumValue("furnishedStatus", data.furnishedStatus),
              numberOfBedrooms: data.bedrooms,
              numberOfBathrooms: data.bathrooms,
              numberOfWashrooms: data.washrooms,
              numberOfKitchens: data.kitchens,
              numberOfFloorsInBuilding: data.numFloors,
              floorNumberOfUnit: data.floorNumber,
              laundryFacilityAvailable: getEnumValue("laundryFacility", data.laundryFacility),
              cleaningServiceAvailable: data.cleaningService,
              studentFriendly: data.studentFriendly,
            },
          };
        case "House":
          return {
            house: {
              furnishedStatus: getEnumValue("furnishedStatus", data.furnishedStatus),
              numberOfBedrooms: data.bedrooms,
              numberOfBathrooms: data.bathrooms,
              numberOfWashrooms: data.washrooms,
              numberOfKitchens: data.kitchens,
              numberOfStories: data.numStories,
              garageSpace: data.garageSpace,
              studentFriendly: data.studentFriendly,
            },
          };
        case "Student's Hostels":
          return {
            studentHostel: {
              furnishedStatus: getEnumValue("furnishedStatus", data.furnishedStatus),
              numberOfBedrooms: data.bedrooms,
              numberOfBathrooms: data.bathrooms,
              numberOfWashrooms: data.washrooms,
              numberOfKitchens: data.kitchens,
              roomTypes: data.selectedroomTypes.map((rooms: string) =>
                getEnumValue("roomTypes", rooms)
              ),
              studentHostelType: getEnumValue("studentHostelType", data.studentHostelType),
              studentHostelLocation: getEnumValue("StudentHostelLocation", data.location),
              sharedFacilities: getEnumValue("sharedFacilities", data.sharedFacilities),
              mealPlanAvailable: getEnumValue("mealPlanAvailable", data.mealPlanAvailable),
              studyAreaAvailable: getEnumValue("furnishedStatus", data.furnishedStatus),
              laundryFacilityAvailable: data.laundryFacility,
              cleaningServiceAvailable: data.cleaningService,
            },
          };
        case "Hotel":
          return {
            hotel: {
              furnishedStatus: getEnumValue("furnishedStatus", data.furnishedStatus),
              numberOfBedrooms: data.bedrooms,
              numberOfBathrooms: data.bathrooms,
              numberOfWashrooms: data.washrooms,
              numberOfKitchens: data.kitchens,
              starRating: data.starRating,
              restaurantOnSite: getEnumValue("restaurantOnSite", data.restaurantOnSite),
            },
          };
        case "Guest House":
          return {
            guestHouse: {
              furnishedStatus: getEnumValue("furnishedStatus", data.furnishedStatus),
              numberOfBedrooms: data.bedrooms,
              numberOfBathrooms: data.bathrooms,
              numberOfWashrooms: data.washrooms,
              numberOfKitchens: data.kitchens,
              starRating: data.starRating,
              restaurantOnSite: getEnumValue("restaurantOnSite", data.restaurantOnSite),
            },
          };
        case "Office Space":
          return {
            officeSpace: {
              totalFloors: data.totalFloors,
              floorNumber: data.numFloors,
              parkingSpace: parseInt(data.parkingSpaces, 10) > 0,
              officeSpaceType: getEnumValue("officeSpaceType", data.officeSpaceType),
              meetingRoomsAvailable: getEnumValue("meetingRooms", data.meetingRooms),
              receptionAreaAvailable: getEnumValue("receptionArea", data.receptionArea),
            },
          };
        case "Shop":
          return {
            shop: {
              totalFloors: data.totalFloors,
              floorNumber: data.numFloors,
              parkingSpace: parseInt(data.parkingSpaces, 10) > 0,
              displayWindowAvailable: getEnumValue("displayWindow", data.displayWindow),
            },
          };
        case "Warehouse":
          return {
            warehouse: {
              totalFloors: data.totalFloors,
              floorNumber: data.numFloors,
              parkingSpace: parseInt(data.parkingSpaces, 10) > 0,
              ceilingHeight: data.ceilingHeight,
              loadingDockAvailable: getEnumValue("loadingDocks", data.loadingDocks),
              officeSpaceAvailable: data.officeSpaceAvailable,
              suitableGoods: getEnumValue("warehouseSuitableGoods", data.goodsType),
            },
          };
        case "Event Space":
          return {
            eventSpace: {
              totalFloors: data.totalFloors,
              floorNumber: data.floorNumber,
              parkingSpace: parseInt(data.parkingSpaces, 10) > 0,
              maximumCapacity: data.maxCapacity,
              cateringServiceAvailable: data.cateringServiceAvailable,
              audioVisualEquipmentsAvailable: getEnumValue(
                "audioVisualEquipmentsAvailable",
                data.audioVisualEquipment
              ),
              suitableEvents: data.selectedeventTypes.map((event: string) =>
                getEnumValue("eventSpaceSuitableEvents", event)
              ),
            },
          };
        default:
          return {};
      }
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
        propertySize: parseInt(data.landSize, 10),
        availableStartDate: "2024-07-25T12:35:32.051Z",
        availableEndDate: "2024-07-25T12:35:32.051Z",
        paymentCurrency: getEnumValue("paymentCurrency", 0),
        paymentFrequency: getEnumValue("paymentFrequency", 0),
        price: parseInt(data.price, 10),
        negotiable: getEnumValue("negotiable", data.negotiable),
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
        ...constructPropertySpecificData(data, targetType),
      };
      console.log("final data: ");
      console.log("final data: ", JSON.stringify(finalData));

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
