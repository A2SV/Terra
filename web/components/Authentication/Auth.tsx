"use client";
import React, { useState } from "react";
import backgroundImage from "../../public/background.png";
import Image from "next/image";
import logo from "../../public/logo.png";
import LoginCard from "@/components/Common/Auth/LoginCard";
import SignupCard from "@/components/Common/Auth/SignupCard";

const Auth: React.FC = () => {
  const [cardType, setCardType] = useState<string>("login");

  return (
    <div className="flex items-center justify-center min-h-screen bg-white">
      <div className="flex md:flex-row bg-white shadow-lg min-h-screen w-full">
        <div className="hidden lg:block relative w-1/2 h-screen overflow-hidden rounded-2xl p-6">
          <Image
            src={backgroundImage}
            alt="Background"
            className="object-cover rounded-2xl h-full w-full ml-2"
          />
          <div className="absolute bottom-10 left-20 right-0 p-8 font-poppins">
            <h2 className="text-2xl font-nunito font-semibold text-white">
              Terra is simply efficient
            </h2>
            <p className="mt-2 font-nunito text-white">
              {cardType === "login" ? "Sign In Today" : "Sign Up Today"}
            </p>
          </div>
        </div>
        <div className="w-full items-center lg:w-1/2 md:mt-3">
          <div className="flex justify-center items-center flex-row md:justify-center">
            <Image
              src={logo}
              alt="Logo"
              height={130}
              width={100}
              className="object-cover mb-4 md:mb-0 md:mr-0 sticky top-0"
            />
            <div className=" flex flex-col justify-center items-center ml-0 font-nunito ">
              <h2 className="font-semibold font-nunito text-gray-700 text-xl">Welcome to Terra</h2>
            </div>
          </div>
          <div className="nav w-[50%] lg:w-[40%] h-12 bg-terrapurple flex items-center rounded-full justify-between px-5 mb-5 mx-auto">
            <button
              type="button"
              className={`${cardType === "login" ? " bg-terrablue rounded-full" : ""} w-1/2 h-2/3 font-nunito`}
              onClick={() => setCardType("login")}
            >
              <p
                className={`${cardType === "login" ? "text-white" : "text-terrablue"} font-nunito`}
              >
                Login
              </p>
            </button>

            <button
              type="button"
              className={`${cardType === "signup" ? " bg-terrablue rounded-full" : ""} w-2/3 md:w-1/2 h-2/3 font-nunito`}
              onClick={() => setCardType("signup")}
            >
              <p
                className={`${cardType === "signup" ? "text-white" : "text-terrablue"} font-nunito`}
              >
                Register
              </p>
            </button>
          </div>
          <div className="w-5/6 lg:w-full font-nunito mx-auto">
            {cardType === "login" ? <LoginCard /> : <SignupCard />}
          </div>
        </div>
      </div>
    </div>
  );
};

export default Auth;
