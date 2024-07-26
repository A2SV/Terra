import fetchWithToken from "@/utils/Fetch_Token";
import { createApi } from "@reduxjs/toolkit/query/react";
import { ListingsResponse } from "@/types/listingTypes";

export const getAllListingApi = createApi({
  reducerPath: "getAllListingApi",
  baseQuery: fetchWithToken,
  endpoints: (builder) => ({
    getAllListings: builder.query<ListingsResponse, void>({
      query: () => ({
        url: `listing`,
        method: "GET",
      }),
    }),
  }),
});

export const { useGetAllListingsQuery } = getAllListingApi;
