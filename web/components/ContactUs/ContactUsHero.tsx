import React from "react";
import Image from "next/image";
import contactUs from "@/public/contactUs.jpg";

const ContactUsHero = () => {
    return (
        <div className="relative flex flex-col h-64 md:h-96">
          <Image
            src={contactUs}
            alt="Hero Image"
            layout="fill"
            objectFit="cover"
            quality={100}
            className="absolute inset-0 z-0"
          /> 
          <div className="relative flex flex-col my-auto text-white w-7/12 md:w-5/12 pl-10 md:pl-28">
            <div className="text-[32px] md:text-[56px] font-nunito font-bold">Contact Us</div>
            <div className="text-[12px] md:text-[24px] font-nunito mt-2">Need assistance? Reach out to us for prompt and friendly support</div>
          </div>
        </div>
      );
    };

export default ContactUsHero;
