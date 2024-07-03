import { configureStore } from "@reduxjs/toolkit";
import { env } from "next-runtime-env";
import { setupListeners } from "@reduxjs/toolkit/query";

export const store = configureStore({
  reducer: {},

  devTools: env("NEXT_PUBLIC_NODE_ENV") !== "production",
  middleware: (getDefaultMiddleware) => getDefaultMiddleware({}).concat([]),
});

setupListeners(store.dispatch);
export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;
