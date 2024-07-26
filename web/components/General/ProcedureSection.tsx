import React from "react";
import Image from "next/image";
import main from "../../public/process.svg";
import textImage from "../../public/procedureSection/text_image.svg";
import subSection from "../../public/procedureSection/sub_section.svg";

const ProcedureSection: React.FC = () => {
  return (
    <div className="lg:h-[100vh] flex font-nunito flex-col-reverse lg:flex-row items-center p-6 lg:m-[3%] lg:mr-20 bg-white  ">
      <div className="w-full md:flex justify-center items-center mt-4 lg:h-[100vh] lg:mt-0">
        <Image src={main} alt="main" className="w-[650px]" />
      </div>
      <div className="w-full h-full justify-center items-center lg:mb-8 lg:w-1/2 lg:p-4 lg:h-[100vh]">
        <div className="w-full mb-10 md:pl-24 lg:ml-0 lg:mt-0">
          <Image src={textImage} alt="Text Image" className="h-[5vh] w-[5vh] " />
          <p className="text-gray-600 font-bold text-4xl ml-4">How to work Our</p>
          <p className="text-yellow-600 mb-6 lg:mb-10 font-bold text-4xl  ml-4">Process</p>
          <p className="text-black font-bold ml-4">Buy & Sell Your Home Property</p>
        </div>
        <div className="lg:ml-4 relative h-[60vh] w-full lg:h-[70vh] md:pl-24 md:w-[60vh]">
          <div className="lg:flex items-center w-full mt-0">
            <Image src={subSection} alt="sub_section" className=" lg:h-[70vh] lg:w-[70vh]" />
          </div>
        </div>
      </div>
    </div>
  );
};

export default ProcedureSection;
