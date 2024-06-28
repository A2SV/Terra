import React from "react";
import Image from "next/image";
import LoginCard from "./LoginCard";
import Link from "next/link";

const LoginBackground: React.FC = () => {
  return (
    <div className="flex md:flex-row flex-col w-full">
      <div className="flex flex-col w-full md:h-[100vh] h-[90vh] p-7">
        <div className="h-[10vh] flex flex-row md:block justify-between">
          <Link href="/">
            <Image
              src="/logo.png"
              className="md:w-[90px] w-[68px] h-[44px] block"
              alt="Logo"
              width={90}
              height={90}
            />
          </Link>
          <h1 className="md:text-white text-black font-bold text-[20px]">
            <Link href="/signup">SignUp</Link>
          </h1>
        </div>
        <div className="flex md:flex-row flex-col md:items-center">
          <div className="order-2 md:order-1">
            <Image
              src="/sign.png"
              alt="Sign"
              width={360}
              height={480}
              className="md:w-[360px] w-[260px]"
            />
          </div>
          <div className="order-1 md:order-2 pt-[30px] md:pt-[0px]">
            <h1 className="font-bold md:text-[44px] text-[40px]">Welcome</h1>
            <h1 className="font-bold md:text-[44px] text-[40px]">Back</h1>
            <p className="text-[#8A8A8A] md:text-[18px] text-[16px] pt-[12px]">
              Login to receive blogs and
            </p>
            <p className="text-[#8A8A8A] md:text-[18px] text-[16px] ">learn more about A2SV</p>
          </div>
        </div>
      </div>
      <div className="flex flex-col w-full h-[100vh] bg-[#264FAD]">
        <div className="w-full flex justify-end h-[10vh] p-7">
          <h1 className="hidden sm:block text-white font-bold text-[20px]">
            <Link href="/signup">SignUp</Link>
          </h1>
        </div>

        <div className="">
          <LoginCard />
        </div>
      </div>
    </div>
  );
};

export default LoginBackground;
