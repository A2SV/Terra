"use client";

import React, { useState } from "react";
import { useRouter } from "next/navigation";
import Image from "next/image";
import HamburgerMenu from "./Hamburger";
import { ProfilePic } from "./Profile";
import { useSession } from "next-auth/react";
import Link from "next/link";

const Navbar = () => {
  const router = useRouter();
  const [activeItem, setActiveItem] = useState<string>("Home");

  const handleItemClick = (item: string) => {
    setActiveItem(item);
    switch (item) {
      case "Home":
        router.push("/");
        break;
      case "Search":
        router.push("/");
        break;
      case "Student":
        router.push("/");
        break;
      case "About us":
        router.push("/aboutUs");
        break;
      case "Contact us":
        router.push("/");
        break;
      default:
        router.push("/");
    }
  };

  const { data: session } = useSession();
  const userIsLoggedIn = !!session;

  return (
    <div className="pt-3 top-0 z-50 w-full bg-white pb-[16px]">
      <div className="flex flex-row justify-between w-full h-16 py-2 lg:px-8 px-4 pt-4 ">
        <div className="flex items-center ">
          <Image src="/headerLogo.svg" alt="Logo" height={90} width={80} className="object-cover" />
        </div>
        <div className="lg:flex flex-row items-center hidden ">
          <nav>
            <ul className="flex flex-row">
              {["Home", "Search", "Student", "About us", "Contact us"].map((item) => (
                <li
                  key={item}
                  className={`px-3 font-nunito ${activeItem === item ? "text-[#03045E]" : "text-black"}`}
                  onClick={() => handleItemClick(item)}
                >
                  <Link href={`/${item.toLowerCase().replace(" ", "")}`}>{item}</Link>
                </li>
              ))}
            </ul>
          </nav>
        </div>
        <div className="flex flex-row">
          {userIsLoggedIn ? (
            <div className="flex flex-row">
              <ProfilePic />
              <p className="lg:flex hidden items-center px-4 font-nunito">
                {session?.user?.firstName} <span className="text-[20px] pl-3"> &#124;</span>
              </p>
            </div>
          ) : (
            <div className="flex flex-row">
              <Link href="/auth">
                <Image
                  src="/profilePic.svg"
                  alt="login"
                  height={40}
                  width={40}
                  className="object-cover"
                />
              </Link>
              <Link href="/auth">
                <p className="lg:flex hidden items-center px-4 font-nunito hover:cursor-pointer">
                  Login <span className="text-[20px] pl-3"> &#124;</span>
                </p>
              </Link>
            </div>
          )}

          <div className="lg:flex hidden items-center">
            <Link href="/add-listing">
              <button className="bg-[#1779F3] text-white font-nunito font-semibold text-[13px] px-5 py-3 rounded-[25px] ">
                Create Listing
              </button>
            </Link>
          </div>
          <HamburgerMenu />
        </div>
      </div>
    </div>
  );
};

export default Navbar;
