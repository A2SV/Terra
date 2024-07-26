"use client";
import { fetchBaseQuery } from "@reduxjs/toolkit/query/react";
import { env } from "next-runtime-env";

const fetchWithToken = async (args: any, api: any, extraOptions: any) => {
  const token = sessionStorage.getItem("token");
  const headers: any = {};
  if (token) {
    headers.Authorization = `Bearer ${token}`;
  }

  return fetchBaseQuery({
    baseUrl: env("NEXT_PUBLIC_BASE_URL"),
    prepareHeaders: (headers) => {
      if (token) {
        headers.set("authorization", `Bearer ${token}`);
      }
      return headers;
    },
  })(args, api, extraOptions);
};

export default fetchWithToken;
