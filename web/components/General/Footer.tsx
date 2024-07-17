"use client";
import Image from "next/image";
import { CiLocationOn } from "react-icons/ci";
import { FiPhone } from "react-icons/fi";
import { RxEnvelopeClosed } from "react-icons/rx";
import Navbar from "./Navbar";

const Footer = () => {
  return (
    <div>
      {/* Page */}
      <div>
        <Navbar />
        <footer className="bg-[#00010F] text-white py-12 font-nunito text-sm">
          <div className="mx-32 text-left justify-start flex-col px-4 sm:px-6 lg:px-8">
            {/* FIrst line */}
            <div className="flex my-12 justify-between">
              <div className="flex-row">
                <Image className="pb-2" src="/terra_black.png" alt="Logo" height={90} width={126} />
                <p>
                  We are a dedicated team of agents ready, <br /> to give you the best deals on
                  properties for <br /> sale, rent or lease
                </p>
              </div>
              {/* Second line */}
              <div className="w-6/12">
                <div className="pb-2 w-4/6 my-4 text-3xl">
                  <h1>Subscribe to our newsletter</h1>
                </div>
                <div className="flex">
                  <input
                    type="email"
                    className="flex w-4/6 h-14 bg-black border-2 rounded-3xl
                     py-2 px-4 text-white focus:outline-none focus:ring"
                    placeholder="enter your email address"
                  />
                  <button
                    className="bg-terrablue hover:bg-terrablue text-white text-md rounded-3xl ml-2 py-2 px-10 focus:outline-none focus:ring-2 focus:ring-terrablue"
                    type="submit"
                  >
                    Subscribe
                  </button>
                </div>
              </div>
            </div>

            {/* 2nd grid */}
            <div className="flex space-x-10 border-t-2 pt-12 justify-between">
              {/* Menu */}
              <div className="">
                <h3 className="text-lg font-bold pb-7">Menu</h3>
                <ul className="space-y-2">
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      Home
                    </a>
                  </li>
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      Search
                    </a>
                  </li>
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      About Us
                    </a>
                  </li>
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      Contact Us
                    </a>
                  </li>
                </ul>
              </div>

              {/* Socials */}
              <div>
                <h3 className="text-lg font-bold pb-7">Social</h3>
                <ul className="space-y-2">
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      Facebook
                    </a>
                  </li>
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      Instagram
                    </a>
                  </li>
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      Twitter
                    </a>
                  </li>
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500">
                      Youtube
                    </a>
                  </li>
                </ul>
              </div>

              {/* Contact */}
              <div>
                <h3 className="text-lg font-bold pb-7">Contact</h3>
                <ul className="space-y-2">
                  <li>
                    <a
                      href="mailto:info@example.com"
                      className="text-gray-400 hover:text-blue-500 flex"
                    >
                      <RxEnvelopeClosed />
                      terra@gmail.com
                    </a>
                  </li>
                  <li>
                    <a href="tel:+15551234567" className="text-gray-400 hover:text-blue-500 flex">
                      <FiPhone />
                      terra_company
                    </a>
                  </li>
                  <li>
                    <a href="#" className="text-gray-400 hover:text-blue-500 flex">
                      <CiLocationOn /> American House, Accra
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </footer>
      </div>
    </div>
  );
};

export default Footer;
