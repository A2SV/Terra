export interface Listing {
  listerId: string;
  paymentInformationId: string;
  propertyLocationId: string;
  id: string;
  title: string;
  description: string;
  propertyType: number;
  publishStatus: number;
  marketStatus: number;
  listingType: number;
  propertySize: number;
  availableStartDate: string;
  availableEndDate: string;
  createdAt: string;
  updatedAt: string;
}

export interface ListingsResponse {
  items: Listing[];
  pageIndex: number;
  totalPages: number;
  hasPreviousPage: boolean;
  hasNextPage: boolean;
}
