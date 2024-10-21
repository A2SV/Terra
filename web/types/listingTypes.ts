export interface PaymentInformation {
  currency: number;
  paymentFrequency: number;
  cost: number;
  negotiable: boolean;
  id: string;
  createdAt: string;
  updatedAt: string;
}

export interface PropertyLocation {
  streetName: string;
  houseNumber: string;
  city: string;
  country: string;
  zipCode: string;
  longitude: number;
  latitude: number;
  id: string;
  createdAt: string;
  updatedAt: string;
}

export interface PropertyPhoto {
  id: string;
  url: string;
}

export interface PropertyVideo {
  id: string;
  url: string;
}

export interface Listing {
  listerId: string;
  paymentInformationId: string;
  propertyLocationId: string;
  title: string;
  description: string;
  propertyType: number;
  propertySubType: number;
  publishStatus: number;
  marketStatus: number;
  listingType: number;
  propertySize: number;
  availableStartDate: string;
  availableEndDate: string;
  lister: null | string; // Adjust this if the lister object structure is known
  paymentInformation: PaymentInformation;
  propertyLocation: PropertyLocation;
  propertyPhotos: PropertyPhoto[];
  propertyVideos: PropertyVideo[];
}

export interface ListingsResponse {
  items: Listing[];
  pageIndex: number;
  totalPages: number;
  hasPreviousPage: boolean;
  hasNextPage: boolean;
}
