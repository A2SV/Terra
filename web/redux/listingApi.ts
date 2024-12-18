import fetchWithToken from "@/utils/Fetch_Token";
import { createApi } from "@reduxjs/toolkit/query/react";
import { ListingsResponse, Listing } from "@/types/listingTypes";

export const listingApi = createApi({
  reducerPath: "getAllListingApi",
  baseQuery: fetchWithToken,
  endpoints: (builder) => ({
    getAllListings: builder.query<ListingsResponse, void>({
      query: () => ({
        url: `listing/?pageSize=8`,
        method: "GET",
      }),
    }),
    getListingById: builder.query<Listing, { listingId: string }>({
      query: (queryArg) => ({
        url: `Listing/id?Id=${queryArg.listingId}`,
        method: "GET",
      }),
    }),
  }),
});

export const { useGetAllListingsQuery, useGetListingByIdQuery } = listingApi;
