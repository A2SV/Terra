import React from "react";
import backgroundImage from "../../public/background.png";
import Image from "next/image";
import logo from "../../public/logo.png";

interface AuthBackgroundProps {
  description: string;
  Card: React.ComponentType;
}

const AuthBackground: React.FC<AuthBackgroundProps> = ({ description, Card }) => {
  return (
    <div className="flex items-center justify-center min-h-screen bg-white">
      <div className="flex md:flex-row bg-white shadow-lg min-h-screen w-full">
        <div className="hidden md:block relative w-1/2 h-screen overflow-hidden rounded-2xl p-6">
          <Image
            src={backgroundImage}
            alt="Background"
            className="object-cover rounded-2xl h-full w-full ml-2"
          />
          <div className="absolute bottom-10 left-20 right-0 p-8 font-poppins">
            <h2 className="text-2xl font-semibold text-white">Terra is simply efficient</h2>
            <p className="mt-2 text-white">{description} today</p>
          </div>
        </div>
        <div className="w-full items-center md:w-1/2">
          <div className="flex justify-center flex-row md:justify-center">
            <Image
              src={logo}
              alt="Logo"
              height={150}
              width={120}
              className="object-cover mb-4 md:mb-0 md:mr-0 sticky top-0"
            />
            <div className="mt-14 md:mt-10 ml-0 font-nunito ">
              <h2 className="font-semibold text-gray-700 text-2xl">Welcome to Terra</h2>
            </div>
          </div>
          <div className="Card flex-grow overflow-y-auto ">
            <Card />
          </div>
        </div>
      </div>
    </div>
  );
};

export default AuthBackground;
