"use client";
import React, { useState } from "react";
import Image from "next/image";

const ContactInDetail = ({ listImg, proIcon }: { listImg: string; proIcon: string }) => {
  const [isChecked, setIsChecked] = useState(false);

  const handleCheckboxChange = () => {
    setIsChecked(!isChecked);
  };
  return (
    <div className="w-[326px] h-[650px] pr-1 mb-4 bg-white mt-6 rounded-md sticky top-2">
      <div className="flex px-7 pt-10 items-center">
        <Image src={listImg} alt="listImg" className="size-[72px] rounded-md" />
        <div className="flex flex-col">
          <div className="flex h-6 justify-center items-center ml-3 space-x-2">
            <Image src={proIcon} alt="proIcon" className="size-4" />
            <p className="text-base font-nunito">Brittany Watkins</p>
          </div>
          <div className="ml-3 font-nunito text-base text-listBlue">View Listings</div>
        </div>
      </div>
      <form className="flex flex-col mt-3 mx-7">
        <div>
          <label>
            <input
              type="text"
              placeholder="Name"
              className="w-[270px] font-nunito h-10 border border-gray-300 rounded-md text-sm pl-2 mb-4 focus:outline-none focus:border-slate-400 focus:shadow-md focus:ring-slate-400"
            />
          </label>
        </div>
        <div>
          <label>
            <input
              type="text"
              placeholder="Phone"
              className="w-[270px] font-nunito h-10 border border-gray-300 rounded-md text-sm pl-2 mb-4 focus:outline-none focus:border-slate-400 focus:shadow-md focus:ring-slate-400"
            />
          </label>
        </div>
        <div>
          <label>
            <input
              type="text"
              placeholder="Email"
              className="w-[270px] h-10 font-nunito border border-gray-300 rounded-md text-sm pl-2 mb-4 focus:outline-none focus:border-slate-400 focus:shadow-md focus:ring-slate-400"
            />
          </label>
        </div>
        <div>
          <label>
            <input
              type="text"
              className="w-[270px] h-[110px] font-nunito border border-gray-300 rounded-md text-sm pl-2 mb-3 focus:outline-none focus:border-slate-400 focus:shadow-md focus:ring-slate-400"
            />
          </label>
        </div>
        <div>
          <select className="custom-select-double border rounded w-[270px] h-10 mb-3 pl-2 focus:outline-none focus:border-gray-200 text-sm font-nunito">
            <option value="" disabled hidden className="text-slate-300">
              Select
            </option>
            <option value="select">Select</option>
          </select>
        </div>
        <div className="flex">
          <div>
            <label>
              <input
                checked={isChecked}
                onChange={handleCheckboxChange}
                type="checkbox"
                id="checkbox"
                className="form-checkbox size-4 border-slate-200 rounded-md text-sm pl-2 mb-3 focus:outline-none"
              />
            </label>
          </div>
          <div className="flex flex-col ml-1">
            <p className="pt-0.5 text-xs pb-1 font-nunito">By submitting this form I agree to</p>
            <p className="text-listBlue text-xs font-nunito">Terms of Use</p>
          </div>
        </div>
        <div className="flex flex-col">
          <div className="flex mt-5 space-x-3">
            <button className="border bg-terraGreen text-white text-base font-nunito w-[128px] h-[42px] rounded-md font-light">
              Send Message
            </button>
            <button className="border border-terraGreen text-terraGreen text-base font-nunito w-[128px] h-[42px] rounded-md">
              Call
            </button>
          </div>
          <button className="flex justify-center items-center mt-3 border border-terraGreen text-terraGreen text-base font-nunito w-[267px] h-[42px] rounded-md font-light">
            <i className="pr-2"></i>
            WhatsApp
          </button>
        </div>
      </form>
    </div>
  );
};
export default ContactInDetail;
