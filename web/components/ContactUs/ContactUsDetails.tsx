"use client";

import React, { useState } from "react";
import Image from "next/image";
import contactUs from "@/public/contactUs.jpg";
import { FiPhone, FiMapPin } from "react-icons/fi";
import { ImLinkedin2 } from "react-icons/im";
import { MdMailOutline } from "react-icons/md";
import ContactForm from "./ContactForm";
import GoogleMapComponent from "@/components/AddListing/GoogleMapComponent";

const ContactUsDetails = () => {
  const [coordinates, setCoordinates] = useState<{ lat: number; lng: number }>({
    lat: 5.6037,
    lng: -0.187,
  });

  const handleLocationSelect = (lat: number, lng: number) => {
    setCoordinates({ lat, lng });
  };

  return (
    <div className="grid grid-cols-1 lg:grid-cols-2 gap-20 my-14">
      <div className="flex flex-col items-center lg:items-end">
        <div className="h-36">
          <Image src={contactUs} alt="Testing" width={300} height={100} />
        </div>
      </div>
      <div className="flex flex-col items-center lg:items-start">
        <div className="text-[32px] lg:text-[48px] font-nunito font-bold pb-5">Get in Touch</div>
        <div className="text-[18px] font-nunito font-light w-11/12 lg:w-7/12 pb-5 text-center lg:text-left">
          We envision a future where finding both short-term and permanent housing is a seamless and
          straightforward process for everyone. By addressing the current challenges in the real
          estate market, we aim to become the go-to platform for anyone seeking temporary
          accommodations or looking to buy or sell properties, fostering a community where trust,
          convenience, and innovation are paramount.
        </div>
        <div className="text-[20px] font-nunito font-normal space-y-2 pb-10 text-center lg:text-left">
          {[
            { icon: <FiPhone color="#1779F3" />, text: "(233) 502615146" },
            { icon: <MdMailOutline color="#1779F3" />, text: "terra@gmail.com" },
            { icon: <FiMapPin color="#1779F3" />, text: "Terra 91, Highway" },
            { icon: <ImLinkedin2 color="#1779F3" />, text: "Terra" },
          ].map((item, index) => (
            <div key={index} className="flex flex-row gap-3 items-center">
              {item.icon}
              {item.text}
            </div>
          ))}
        </div>
        <div className="message">
          <div className="text-[24px] lg:text-[32px] font-nunito font-bold pb-5 text-center lg:text-left">
            Send us a message
          </div>
          <ContactForm />
        </div>
      </div>
    </div>
  );
};

export default ContactUsDetails;
