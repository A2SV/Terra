import React from "react";
import backgroundImage from "../../public/background.png";
import Image from "next/image";
import logo from "../../public/logo.png";

const ResetBackground: React.FC = () => {
  return (
    <div className="flex items-center justify-center min-h-screen bg-white">
      <div className="flex md:flex-row bg-white shadow-lg min-h-screen w-full md:w-auto">
        <div className="hidden md:block relative w-1/2 overflow-hidden rounded-2xl p-6">
          <Image
            src={backgroundImage}
            alt="Background"
            className="object-cover rounded-2xl h-full w-full  ml-2"
          />
          <div className="absolute bottom-10 left-20 right-0 p-8 font-poppins">
            <h2 className="text-2xl font-semibold text-white">Forgot Password?</h2>
            <p className="mt-2 text-white">Reset password</p>
          </div>
        </div>
        <div className="w-full items-center md:w-1/2">
          <div className="flex justify-center flex-row md:justify-center font-nunito">
            <Image src={logo} alt="Logo" height={180} width={150} className="object-cover" />
          </div>
        </div>
      </div>
    </div>
  );
};

export default ResetBackground;
