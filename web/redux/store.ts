import { configureStore } from "@reduxjs/toolkit";
import { env } from "next-runtime-env";
import { setupListeners } from "@reduxjs/toolkit/query";
import { getAllListingApi } from "./getAllListingApi";

export const store = configureStore({
  reducer: {
    [getAllListingApi.reducerPath]: getAllListingApi.reducer,
  },

  devTools: env("NEXT_PUBLIC_NODE_ENV") !== "production",
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({}).concat([getAllListingApi.middleware]),
});

setupListeners(store.dispatch);
export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
