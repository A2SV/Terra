import React from "react";
import Image from "next/image";
import main from "../../public/process.svg";
import textImage from "../../public/procedureSection/text_image.svg";
import subSection from "../../public/procedureSection/sub_section.svg";

const ProcedureSection: React.FC = () => {
  return (
    <div className="flex font-nunito flex-col-reverse md:flex-col-reverse items-center p-6 lg:mr-20 bg-white lg:flex-row ">
      <div className="w-full h-full md:flex lg:mt-0 ml-10 md:ml-24 lg-flex lg:order-1">
        <Image src={main} alt="main" className="w-[300px] md:w-[650px] lg:w-[500px]" />
      </div>
      <div className="w-full h-full justify-center items-center ml-4 lg:mb-8 lg:p-4 lg:ml-8 lg:order-2">
        <div className="w-full mb-10 md:pl-4 lg:ml-0 lg:mt-0 ">
          <Image src={textImage} alt="Text Image" className="h-[5vh] w-[5vh] " />
          <p className="text-gray-600 font-bold text-2xl ml-4 md:text-5xl lg:text-2xl">
            How to work Our
          </p>
          <p className="text-yellow-600 mb-6 lg:mb-5 font-bold text-2xl md:text-5xl ml-4 lg:text-2xl">
            Process
          </p>
          <p className="text-black font-bold ml-4 md:text-2xl lg:text-xl">
            Buy & Sell Your Home Property
          </p>
        </div>
        <div className="lg:ml-4 relative mb-10 mt-10 w-full">
          <div className="lg:flex items-center w-full mt-0">
            <Image src={subSection} alt="sub_section" className=" lg:w-[500px]" />
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProcedureSection;
