import React from "react";
import ApartmentFeatures from "./ResidentialSubtype/ApartmentFeatures";
import GuestHouseFeatures from "./ResidentialSubtype/GuestHouseFeatures";
import HotelFeatures from "./ResidentialSubtype/HotelFeatures";
import HouseFeatures from "./ResidentialSubtype/HouseFeatures";
import StudentHostelFeatures from "./ResidentialSubtype/StudentHostelFeatures";
import OfficeSpaceFeatures from "./CommercialSubtype/OfficeSpaceFeatures";
import ShopFeatures from "./CommercialSubtype/ShopFeatures";
import WarehouseFeatures from "./CommercialSubtype/WareHouseFeatures";
import EventSpaceFeatures from "./CommercialSubtype/EventSpaceFeatures";

const residentialFeatureComponents: {
  [key: string]: React.FC<{
    handleInputChange: (name: string, value: string | number | boolean | string[]) => void;
  }>;
} = {
  Apartment: ApartmentFeatures,
  House: HouseFeatures,
  "Student's Hostels": StudentHostelFeatures,
  Hotel: HotelFeatures,
  "Guest House": GuestHouseFeatures,
};

const commercialFeatureComponents: {
  [key: string]: React.FC<{
    handleInputChange: (name: string, value: string | number | boolean | string[]) => void;
  }>;
} = {
  "Office Space": OfficeSpaceFeatures,
  Shop: ShopFeatures,
  Warehouse: WarehouseFeatures,
  "Event Space": EventSpaceFeatures,
};

export { residentialFeatureComponents, commercialFeatureComponents };
