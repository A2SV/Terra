export interface Lister {
  firstName: string;
  lastName: string;
  gender: string | null;
  dateOfBirth: string;
  profilePictureUrl: string | null;
  verificationToken: string | null;
  passwordResetToken: string | null;
  createdAt: string;
  updatedAt: string;
  id: string;
  userName: string;
  normalizedUserName: string;
  email: string;
  normalizedEmail: string;
  emailConfirmed: boolean;
  passwordHash: string;
  securityStamp: string;
  concurrencyStamp: string;
  phoneNumber: string | null;
  phoneNumberConfirmed: boolean;
  twoFactorEnabled: boolean;
  lockoutEnd: string | null;
  lockoutEnabled: boolean;
  accessFailedCount: number;
}

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
export interface ApartmentDto {
  numberOfFloorsInBuilding: number;
  floorNumberOfUnit: number;
  laundryFacilityAvailable: boolean;
  cleaningServiceAvailable: boolean;
  studentFriendly: boolean;
}
export interface ResidentialProperty {
  furnishedStatus: boolean;
  numberOfBedrooms: number;
  numberOfBathrooms: number;
  numberOfWashrooms: number;
  numberOfKitchens: number;
  apartmentDto: ApartmentDto | null;
  guestHouseDto: any | null;
  houseDto: any | null;
  hotelDto: any | null;
  studentHostelDto: any | null;
}

export interface Listing {
  id: string;
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
  lister: Lister;
  paymentInformation: PaymentInformation;
  propertyLocation: PropertyLocation;
  propertyPhotos: PropertyPhoto[];
  propertyVideos: any[];
  propertyAmenities: any[];
  commercialProperty: any | null;
  residentialProperty: ResidentialProperty | null;
}

export interface ListingsResponse {
  items: Listing[];
  pageIndex: number;
  totalPages: number;
  hasPreviousPage: boolean;
  hasNextPage: boolean;
}
