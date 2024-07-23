"use client";
import React from "react";

const SubmitButtom: React.FC = () => {
  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    // Handle form submission
  };

  return (
    <div className="container mx-auto p-4 mb-10 w-[25vh]">
      <form onSubmit={handleSubmit} className="space-y-4">
        <button
          type="submit"
          className="w-full py-2 px-4 bg-btnColor text-white text-sm  rounded-full hover:bg-orange-500"
        >
          Add listing
        </button>
      </form>
    </div>
  );
};

export default SubmitButtom;
