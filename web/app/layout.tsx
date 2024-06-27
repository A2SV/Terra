"use client";
import { Inter } from "next/font/google";
import "./globals.css";
import { PublicEnvScript } from "next-runtime-env";

import { Provider as StoreProvider } from "react-redux";
import { store } from "@/redux/store";

const inter = Inter({ subsets: ["latin"] });

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>): JSX.Element {
  return (
    <html lang="en">
      <head>
        <PublicEnvScript />
      </head>
      <StoreProvider store={store}>
        <body className={inter.className}>{children}</body>
      </StoreProvider>
    </html>
  );
}
