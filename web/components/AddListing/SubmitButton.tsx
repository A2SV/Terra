"use client";
import React from "react";
import { env } from "next-runtime-env";
import Spinner from "@/components/Common/Reusable/Spinner";
import { useRouter } from "next/navigation";

interface SubmitButtonProps {
  data: any;
}

const SubmitButton: React.FC<SubmitButtonProps> = ({ data }) => {
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
      paymentCurrency: {
        Ghs: 0,
        Usd: 1,
        Eur: 2,
        Gbp: 3,
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
      propertyMarketStatus: {
        Unavailable: 0,
        Available: 1,
        Rented: 2,
        Sold: 3,
      },
      propertyPublishStatus: {
        Unpublished: 0,
        Published: 1,
        InReview: 2,
      },
      studentHostelLocation: {
        OnCampus: 0,
        OffCampus: 1,
      },
      studentHostelRoomTypes: {
        Single: 0,
        Double: 1,
        Triple: 2,
        Quad: 3,
        Dormitory: 4,
      },
      studentHostelType: {
        Male: 0,
        Female: 1,
        Coed: 2,
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
        listerId: "f7dbc673-4cd9-477b-a809-0739846dd5fb",
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
        negotiable: true,
        streetName: "Afariwa RD",
        houseNumber: "GC-0825-261",
        city: "Accra",
        country: "Ghana",
        zipCode: "+233",
        longitude: 180,
        latitude: 180,
        amenities: data.selectedAmenities,
        pictures: uploadedImageUrls,
        videos: [data.video],
        apartment: {
          furnishedStatus: true,
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
      };

      const response = await fetch(`${baseUrl}listing`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(finalData),
      });

      if (!response.ok) {
        const errorText = await response.text();
        throw new Error(`Request failed: ${errorText}`);
      }

      router.push("/");
    } catch (error) {
      console.error("Error:", error);
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
