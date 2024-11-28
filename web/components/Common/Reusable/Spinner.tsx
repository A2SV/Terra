"use client";

import { Spinner } from "flowbite-react";

export default function SpinnerComponent() {
  // return <Spinner aria-label="Default status example" className="text-white" />;
  return (
    <div className="flex justify-center items-center">
      <Spinner aria-label="Loading spinner" className="w-8 h-7 text-white animate-spin fill-blue" />
    </div>
  );
}
