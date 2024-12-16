import React from "react";
import Link from "next/link";
import ErrorBackground from "@/public/404bg.svg";

const NotFound = () => {
  return (
    <main
      className="h-screen flex items-center justify-center bg-cover bg-center"
      style={{ backgroundImage: `url(${ErrorBackground.src})` }}
    >
      <div className="flex flex-col items-center text-center font-nunito w-full md:w-5/12 bg-opacity-75 p-6 rounded-md bg-[#fdfbf9]">
        <div className="text-[180px] font-bold w-full -mt-20 -mb-14">
          4<span className="text-terrablue">0</span>4
        </div>
        <div className="text-2xl font-bold w-full">Oops! Page Not Found</div>
        <div className="text-lg font-extralight mb-8 w-full md:w-7/12">
          Something&apos;s only missing, it could be much worse, it happens to the best of us.
        </div>
        <div className="w-full">
          <Link href={"/"}>
            <button type="button" className="bg-terrablue rounded-full h-12 w-60">
              <p className="text-white font-nunito">Go to Homepage</p>
            </button>
          </Link>
        </div>
      </div>
    </main>
  );
};

export default NotFound;