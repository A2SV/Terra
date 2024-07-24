"use client";

import React, { useState } from "react";
import { MdUnfoldMore } from "react-icons/md";

const ReviewForm = () => {
  const [showDropdown, setShowDropdown] = useState(false);
  const [rating, setRating] = useState<number | null>(null);

  const toggleDropdown = () => {
    setShowDropdown(!showDropdown);
  };

  const selectRating = (value: number) => {
    setRating(value);
    setShowDropdown(false);
  };
  return (
    <div className="w-full md:w-9/12 flex flex-col justify-center items-center p-12">
      <div className="w-full border-b">
        <p className="mb-10 font-roboto">Leave A Review</p>
      </div>
      <form className="form w-full mt-6 ">
        <p className="font-roboto font-medium text-sm mb-3">Email</p>
        <input
          type="email"
          placeholder="you@example.com"
          className="w-full border h-10 rounded-md p-4 placeholder:text-sm placeholder:font-roboto placeholder:font-light placeholder:text-slate-400"
        />
        <div className="flex mt-3 justify-between">
          <div className="title w-[45%]">
            <p className="font-roboto font-medium text-sm mb-3">Title</p>
            <input
              type="text"
              className="w-full border h-10 rounded-md p-4 placeholder:text-sm placeholder:font-roboto placeholder:font-light placeholder:text-slate-400"
              placeholder="Enter a title"
            />
          </div>
          <div className="rating relative inline-block text-left w-[45%]">
            <label className="font-roboto font-medium text-sm">Rating</label>
            <div className="flex items-center justify-end  ">
              <input
                type="text"
                readOnly
                value={rating !== null ? rating : ""}
                onClick={toggleDropdown}
                className="w-full border h-10 mt-2 rounded-md p-4 placeholder:text-sm placeholder:font-roboto placeholder:font-light placeholder:text-slate-400 cursor-pointer"
                placeholder="Select rating"
              />
              <MdUnfoldMore className="absolute mr-3 mt-2 text-gray-400 pointer-events-none" />
            </div>
            {showDropdown && (
              <div className="absolute mt-1 w-full rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 z-10">
                <ul className="max-h-60 rounded-md py-1 text-base leading-6 shadow-xs overflow-auto focus:outline-none sm:text-sm sm:leading-5">
                  {[1, 2, 3, 4, 5].map((value) => (
                    <li
                      key={value}
                      onClick={() => selectRating(value)}
                      className="cursor-pointer select-none relative py-2 pl-3 pr-9 hover:bg-gray-100"
                    >
                      {value}
                    </li>
                  ))}
                </ul>
              </div>
            )}
          </div>
        </div>
        <p className="font-roboto font-medium text-sm my-3 ">Review</p>
        <textarea
          name="review"
          id=""
          className="border w-full h-32 focus:outline-none resize-none rounded-md p-3 font-roboto text-sm mb-3"
        ></textarea>
        <button className="bg-green-600 text-white p-2 rounded font-roboto text-sm font-normal hover:shadow-xl ">
          Submit Review
        </button>
      </form>
    </div>
  );
};

export default ReviewForm;
